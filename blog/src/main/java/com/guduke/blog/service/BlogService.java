package com.guduke.blog.service;

import java.util.List;

import com.guduke.blog.entity.Article;
import com.guduke.blog.entity.Category;
import com.guduke.blog.entity.Link;
import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.User;
import com.guduke.blog.entity.Word;

public interface BlogService {

	List<Word> queryWord();

	Page<Word> queryWordPage(Integer pageNo, Integer pageSize);

	Page<Article> queryArticlePage(Integer pageNo, Integer pageSize, Integer categorieid);

	Article queryArticleById(Integer id);

	Category queryCategoryById(Integer id);

	List<Article> queryMarkArticle();

	List<Article> queryRankArticle();

	User queryUser();

	List<Category> queryCategory();

	Article queryPreArticle(Article article);

	Article queryNextArticle(Article article);

	List<Link> queryLink();

}
