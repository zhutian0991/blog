package com.guduke.blog.dao;

import java.util.List;
import java.util.Map;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;

public interface ArticleDao {

	List<Category> queryCategory();

	void insertArticle(Article article);

	int queryTotalSize(Map<String, Object> paramMap);

	List<Article> queryAllArticle(Map<String, Object> paramMap);

	Article queryArticleById(Integer id);

	void updateArticle(Article article);

	void deleteArticle(Integer id);

	void updateArticleMark(Article article);

}
