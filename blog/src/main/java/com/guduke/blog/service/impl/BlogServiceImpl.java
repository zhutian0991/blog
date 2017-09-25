package com.guduke.blog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.BlogDao;
import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.User;
import com.guduke.blog.entity.Word;
import com.guduke.blog.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	private BlogDao blogDao;

	@Override
	public List<Word> queryWord() {
		return blogDao.queryWord();
	}

	@Override
	public Page<Word> queryWordPage(Integer pageNo, Integer pageSize) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", (pageNo-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		List<Word> words = blogDao.queryAllWord(paramMap);
		Page<Word> page = new Page<>();
		int totalSize = blogDao.queryWordTotalSize(paramMap);
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
	public Page<Article> queryArticlePage(Integer pageNo, Integer pageSize, Integer categorieid) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", (pageNo-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		paramMap.put("categorieid", categorieid);
		List<Article> articles = blogDao.queryAllArticle(paramMap);
		Page<Article> page = new Page<>();
		int totalSize = blogDao.queryArticleTotalSize(paramMap);
		int totalNo = 0;
		if(totalSize%pageSize==0){
			totalNo = totalSize/pageSize;
		}else{
			totalNo = totalSize/pageSize+1;
		}
		page.setTotalNo(totalNo);
		page.setPageNo(pageNo);
		page.setPageSize(pageSize);
		page.setData(articles);
		page.setTotalSize(totalSize);
		return page;
	}

	@Override
	public Article queryArticleById(Integer id) {
		return blogDao.queryArticleById(id);
	}

	@Override
	public Category queryCategoryById(Integer id) {
		return blogDao.queryCategoryById(id);
	}

	@Override
	public List<Article> queryMarkArticle() {
		return blogDao.queryMarkArticle();
	}

	@Override
	public List<Article> queryRankArticle() {
		return blogDao.queryRankArticle();
	}

	@Override
	public User queryUser() {
		return blogDao.queryUser();
	}

	@Override
	public List<Category> queryCategory() {
		return blogDao.queryCategory();
	}

	@Override
	public Article queryPreArticle(Article article) {
		return blogDao.queryPreArticle(article);
	}

	@Override
	public Article queryNextArticle(Article article) {
		return blogDao.queryNextArticle(article);
	}

}
