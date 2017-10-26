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

import com.guduke.blog.entity.Link;
import com.guduke.blog.service.HomeService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private HomeService homeService;

	//增加友情链接操作
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Link link){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			homeService.insert(link);
			resultMap.put("insert", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("insert", false);
		}
		return resultMap;
	}
	
	//修改友情链接操作
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Link link){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			homeService.update(link);
			resultMap.put("update", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("update", false);
		}
		return resultMap;
	}
	
	//删除友情链接操作
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			homeService.delete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转友情链接列表页面
	@RequestMapping("/link")
	public String list(Model model){
		List<Link> links = homeService.queryLink();
		model.addAttribute("links", links);
		return "home/link";
	}
	
	//跳转友情链接修改页面
	@RequestMapping("/edit")
	public String edit(@RequestParam(required=false) Integer id,Model model){
		if(id!=null){
			Link link = homeService.queryLinkById(id);
			model.addAttribute("link", link);
		}
		return "home/editLink";
	}
}
