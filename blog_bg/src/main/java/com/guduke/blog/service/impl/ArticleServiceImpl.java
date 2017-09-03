package com.guduke.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.ArticleDao;
import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Page;
import com.guduke.blog.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleDao articleDao;

	@Override
	public List<Category> queryCategory() {
		return articleDao.queryCategory();
	}

	@Override
	public void insertArticle(Article article) {
		article.setCreatetime(new Date());
		article.setModifytime(new Date());
		article.setMark("0");
		articleDao.insertArticle(article);
	}

	@Override
	public Page<Article> queryPage(Integer pageNo, Integer pageSize, Integer categorieid, String qname) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", (pageNo-1)*pageSize);
		paramMap.put("pageSize", pageSize);
		paramMap.put("categorieid", categorieid);
		paramMap.put("qname", qname);
		List<Article> articles = articleDao.queryAllArticle(paramMap);
		Page<Article> page = new Page<>();
		int totalSize = articleDao.queryTotalSize(paramMap);
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
		return articleDao.queryArticleById(id);
	}

	@Override
	public void updateArticle(Article article) {
		article.setModifytime(new Date());
		articleDao.updateArticle(article);
		
	}

	@Override
	public void deleteArticle(Integer id) {
		articleDao.deleteArticle(id);
	}

	@Override
	public void bathDelete(Integer[] ids) {
		for(Integer id:ids){
			articleDao.deleteArticle(id);
		}
	}

	@Override
	public void updateArticleMark(Article article) {
		articleDao.updateArticleMark(article);
	}

}
