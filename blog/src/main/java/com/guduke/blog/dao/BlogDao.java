package com.guduke.blog.dao;

import java.util.List;
import java.util.Map;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.User;
import com.guduke.blog.entity.Word;

public interface BlogDao {

	List<Word> queryWord();

	List<Word> queryAllWord(Map<String, Object> paramMap);

	int queryWordTotalSize(Map<String, Object> paramMap);

	List<Article> queryAllArticle(Map<String, Object> paramMap);

	int queryArticleTotalSize(Map<String, Object> paramMap);

	Article queryArticleById(Integer id);

	Category queryCategoryById(Integer id);

	List<Article> queryMarkArticle();

	List<Article> queryRankArticle();

	User queryUser();

	List<Category> queryCategory();

	Article queryPreArticle(Article article);

	Article queryNextArticle(Article article);


}
