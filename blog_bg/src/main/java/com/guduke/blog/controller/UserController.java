package com.guduke.blog.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guduke.blog.entity.User;
import com.guduke.blog.service.UserService;
import com.guduke.blog.util.MD5Util;
import com.guduke.blog.util.VerifyCodeUtils;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	//更新用户信息
	@ResponseBody
	@RequestMapping("/updateInfo")
	public Object updateInfo(User user,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			userService.updateInfo(user);
			User dbuser = userService.queryUserInfo();
			session.setAttribute("suser", dbuser);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转个人资料页面
	@RequestMapping("/info")
	public String info(){
		return "user/info";
	}
	
	//跳转个人简介显示页面
	@RequestMapping("/introduceList")
	public String introduceList(Model model,HttpSession session){
		User dbuser = userService.queryUserInfo();
		session.setAttribute("suser", dbuser);
		return "user/introduceList";
	}
	
	//跳转个人简介修改页面
	@RequestMapping("/introduceEdit")
	public String introduceEdit(Model model){
		return "user/introduceEdit";
	}
	
	//更新个人简介操作
	@ResponseBody
	@RequestMapping("/updateIntroduce")
	public Object updateIntroduce(User user){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			userService.updateIntroduce(user);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//生成图片验证码
	@RequestMapping("/authImage")
	public void authImage(HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg"); 
           
        //生成随机字串 
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4); 
        //存入会话session 
        HttpSession session = request.getSession(true); 
        //删除以前的
        session.removeAttribute("verCode");
        session.setAttribute("verCode", verifyCode.toLowerCase()); 
        //生成图片 
        int w = 110, h = 40; 
        try {
			VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//转发到登录页面
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpSession session){
		//判断是否有免登录的cookie
		Cookie[] cookies = request.getCookies();
		User dbUser = null;
		if(cookies!=null){
			for(Cookie cookie:cookies){
				String name = cookie.getName();
				if(name.equals("loginacct")){
					String[] userInfo = cookie.getValue().split("&");
					String loginacct = userInfo[0].split("=")[1];
					String password = userInfo[1].split("=")[1];
					User user = new User();
					user.setLoginacct(loginacct);
					user.setPassword(password);
					dbUser = userService.queryUser(user);
				}
			}
		}
		if(dbUser!=null){
			session.setAttribute("suser", dbUser);
			return "redirect:main.htm";
		}else{
			return "login";
		}
	}
	
	//登录数据处理
	@ResponseBody
	@RequestMapping("/dologin")
	public Object dologin(User user,HttpSession session,String rememberme,
			HttpServletResponse response,String verCode){
		Map<String, Object> resultMap = new HashMap<>();
		String sverCode = (String) session.getAttribute("verCode");
		if(sverCode.equalsIgnoreCase(verCode)){
			String password = MD5Util.digest(user.getPassword());
			user.setPassword(password);
			User dbUser = userService.queryUser(user);
			if(dbUser!=null){
				if(rememberme.equals("1")){
					String loginacct = "loginacct="+dbUser.getLoginacct()+"&password="+dbUser.getPassword();
					Cookie cookie = new Cookie("loginacct", loginacct);
					cookie.setMaxAge(60*60*24*3);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				resultMap.put("success", true);
				session.setAttribute("suser", dbUser);
			}else{
				resultMap.put("success", false);
			}
			resultMap.put("verCode", true);
		}else {
			resultMap.put("verCode", false);
			resultMap.put("success", false);
		}
		return resultMap;
	}
}
