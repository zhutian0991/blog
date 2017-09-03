package com.guduke.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Page;
import com.guduke.blog.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	//更新文章推荐信息
	@ResponseBody
	@RequestMapping("/updateMark")
	public Object addMark(Article article){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			articleService.updateArticleMark(article);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//批量删除文章
	@ResponseBody
	@RequestMapping("/bathDelete")
	public Object bathDelete(Integer[] id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			articleService.bathDelete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//删除单个文章
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			articleService.deleteArticle(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//执行更新操作
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Article article){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			articleService.updateArticle(article);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转编辑页面
	@RequestMapping("/edit")
	public String edit(Integer id,Model model){
		Article article = articleService.queryArticleById(id);
		model.addAttribute("article", article);
		List<Category> categories = articleService.queryCategory();
		model.addAttribute("categories", categories);
		return "article/edit";
	}
	
	//跳转文章浏览页面
	@RequestMapping("/read")
	public String read(Integer id,Model model){
		Article article = articleService.queryArticleById(id);
		model.addAttribute("article", article);
		return "article/read";
	}
	
	//分页显示文章列表
	@ResponseBody
	@RequestMapping("/show")
	public Object show(Integer pageNo,Integer pageSize,Integer categorieid,String qname){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Page<Article> page = articleService.queryPage(pageNo,pageSize,categorieid,qname);
			resultMap.put("page", page);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转文章列表页面
	@RequestMapping("/list")
	public String list(Model model){
		List<Category> categories = articleService.queryCategory();
		model.addAttribute("categories", categories);
		return "article/list";
	}
	
	//跳转增加文章页面
	@RequestMapping("/add")
	public String add(Model model){
		List<Category> categories = articleService.queryCategory();
		model.addAttribute("categories", categories);
		return "article/add";
	}
	
	//增加文章操作
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Article article){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			articleService.insertArticle(article);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
}
