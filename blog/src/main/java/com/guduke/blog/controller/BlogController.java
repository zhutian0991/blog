package com.guduke.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.User;
import com.guduke.blog.entity.Weather;
import com.guduke.blog.entity.Word;
import com.guduke.blog.service.BlogService;
import com.guduke.blog.util.WeatherUtil;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	//跳转到主页，将用户及文章分类信息放入到session
	@RequestMapping("/home")
	public String main(HttpSession session,Model model){
		try {
			List<Article> articles = blogService.queryMarkArticle();
			List<Article> rankArticles = blogService.queryRankArticle();
			//获取用户信息
			User user = blogService.queryUser();
			//获取文章分类
			List<Category> categories = blogService.queryCategory();
			//获取天气信息，对天气信息进行异常处理，防止获取不到天气影响主页显示
			try {
				if(session.getAttribute("weather")==null){
					Weather weather = WeatherUtil.getWeather("长沙");
					session.setAttribute("weather", weather);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.setAttribute("categories", categories);
				session.setAttribute("suser", user);
				model.addAttribute("articles", articles);
				model.addAttribute("rankArticles", rankArticles);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error.jsp";
		}
		
		return "home";
	}
	
	//跳转到个人简介页面
	@RequestMapping("/about")
	public String about(Model model){
		return "about";
	}
	
	//跳转到碎言碎语页面
	@RequestMapping("/shuo")
	public String shou(){
		return "shuo";
	}
	
	//根据文章ID查询文章信息，并跳转到文章浏览页面
	@RequestMapping("/showArticle")
	public String showArticle(Integer id,Model model){
		Article article = blogService.queryArticleById(id);
		model.addAttribute("article", article);
		return "article";
	}
	
	//跳转到文章列表页面
	@RequestMapping("/list")
	public String list(Integer id,Model model){
		Category category = blogService.queryCategoryById(id);
		model.addAttribute("category", category);
		model.addAttribute("id", id);
		return "list";
	}
	
	//通过文章分类ID获取文章列表，并通JSON数据返回
	@ResponseBody
	@RequestMapping("/articleList")
	public Object show(Integer pageNo,Integer pageSize,Integer categorieid){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Page<Article> page = blogService.queryArticlePage(pageNo,pageSize,categorieid);
			resultMap.put("page", page);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//获取碎言碎语信息，并以JSON数据返回
	@ResponseBody
	@RequestMapping("/wordList")
	public Object wordList(Integer pageNo,Integer pageSize){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Page<Word> page = blogService.queryWordPage(pageNo,pageSize);
			resultMap.put("page", page);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
}
