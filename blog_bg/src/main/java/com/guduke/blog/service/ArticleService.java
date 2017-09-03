package com.guduke.blog.service;

import java.util.List;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Page;

public interface ArticleService {

	List<Category> queryCategory();

	void insertArticle(Article article);

	Page<Article> queryPage(Integer pageNo, Integer pageSize ,Integer categorieid,String qname);

	Article queryArticleById(Integer id);

	void updateArticle(Article article);

	void deleteArticle(Integer id);

	void bathDelete(Integer[] id);

	void updateArticleMark(Article article);

}
