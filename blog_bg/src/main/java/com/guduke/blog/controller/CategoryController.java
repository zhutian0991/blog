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

import com.guduke.blog.entity.Category;
import com.guduke.blog.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	//增加文章分类操作
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Category category){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			categoryService.insert(category);
			resultMap.put("insert", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("insert", false);
		}
		return resultMap;
	}
	
	//修改文章分类操作
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Category category){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			categoryService.update(category);
			resultMap.put("update", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("update", false);
		}
		return resultMap;
	}
	
	//删除文章分类操作
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			categoryService.delete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转文章分类列表页面
	@RequestMapping("/list")
	public String list(Model model){
		List<Category> categories = categoryService.queryCategory();
		model.addAttribute("categories", categories);
		return "category/list";
	}
	
	//跳转文章分类修改页面
	@RequestMapping("/edit")
	public String edit(@RequestParam(required=false) Integer id,Model model){
		if(id!=null){
			Category category = categoryService.queryCategoryById(id);
			model.addAttribute("category", category);
		}
		return "category/edit";
	}
}
