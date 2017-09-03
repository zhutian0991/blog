package com.guduke.blog.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.Word;
import com.guduke.blog.service.WordService;

@Controller
@RequestMapping("/word")
public class WordController {
	@Autowired
	private WordService wordService;
	
	//批量删除碎言碎语操作
	@ResponseBody
	@RequestMapping("/bathDelete")
	public Object bathDelete(Integer[] id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			wordService.bathDelete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//单个删除碎言碎语操作
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(Integer id){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			wordService.deleteWord(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//添加碎言碎语操作
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Word word){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			wordService.insert(word);
			resultMap.put("insert", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("insert", false);
		}
		return resultMap;
	}
	
	//修改碎言碎语操作
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Word word){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			wordService.update(word);
			resultMap.put("update", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("update", false);
		}
		return resultMap;
	}
	
	//跳转碎言碎语页面
	@RequestMapping("/edit")
	public String edit(@RequestParam(required=false) Integer id,Model model){
		if(id!=null){
			Word word = wordService.queryWordById(id);
			model.addAttribute("word", word);
		}
		return "word/edit";
	}
	
	//显示碎言碎语列表操作
	@ResponseBody
	@RequestMapping("/show")
	public Object show(Integer pageNo,Integer pageSize){
		Map<String, Object> resultMap = new HashMap<>();
		try {
			Page<Word> page = wordService.queryPage(pageNo,pageSize);
			resultMap.put("page", page);
			resultMap.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("success", false);
		}
		return resultMap;
	}
	
	//跳转碎言碎语列表
	@RequestMapping("/list")
	public String list(Model model){
		return "word/list";
	}
}
