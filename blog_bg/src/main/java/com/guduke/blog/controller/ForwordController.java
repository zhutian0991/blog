package com.guduke.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guduke.blog.entity.Menu;
import com.guduke.blog.service.MenuService;

@Controller
public class ForwordController {
	@Autowired
	private MenuService menuService;
	
	//退出登录
	@RequestMapping("/loginout")
	public String loginout(HttpSession session,HttpServletResponse response){
		//清除cookie
		Cookie cookie = new Cookie("loginacct", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		//使session失效
		session.invalidate();
		return "redirect:/";
	}
	
	//获取后台页面菜单
	@RequestMapping("/main")
	public String menu(HttpSession session){
		List<Menu> menus = menuService.queryMenu();
		Map<Integer, Menu> map = new HashMap<>();
		List<Menu> paramMenu = new ArrayList<>();
		for(Menu menu:menus){
			map.put(menu.getId(), menu);
		}
		for(Menu menu:menus){
			Menu children = menu;
			if(menu.getPid()==0){
				paramMenu.add(menu);
			}else{
				Menu parentMenu = map.get(menu.getPid());
				parentMenu.getChildren().add(children);
			}
		}		
		session.setAttribute("smenu", paramMenu);
		return "main";
	}
	
}
