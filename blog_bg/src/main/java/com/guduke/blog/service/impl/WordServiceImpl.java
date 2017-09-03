package com.guduke.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.WordDao;
import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.Word;
import com.guduke.blog.service.WordService;

@Service
public class WordServiceImpl implements WordService {
	@Autowired
	private WordDao wordDao;

	@Override
	public Page<Word> queryPage(Integer pageNo, Integer pageSize) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", (pageNo-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		List<Word> words = wordDao.queryAllWord(paramMap);
		Page<Word> page = new Page<>();
		int totalSize = wordDao.queryTotalSize(paramMap);
		int totalNo = 0;
		if(totalSize%pageSize==0){
			totalNo = totalSize/pageSize;
		}else{
			totalNo = totalSize/pageSize+1;
		}
		page.setTotalNo(totalNo);
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.setData(words);
		page.setTotalSize(totalSize);
		return page;
	}

	@Override
	public void update(Word word) {
		wordDao.update(word);
		
	}

	@Override
	public Word queryWordById(Integer id) {
		return wordDao.queryWordById(id);
	}

	@Override
	public void insert(Word word) {
		word.setCreatetime(new Date());
		wordDao.insert(word);
	}

	@Override
	public void deleteWord(Integer id) {
		wordDao.deleteWord(id);
		
	}

	@Override
	public void bathDelete(Integer[] ids) {
		for(Integer id:ids){
			wordDao.deleteWord(id);
		}
	}
}
