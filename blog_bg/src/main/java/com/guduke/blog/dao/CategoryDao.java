package com.guduke.blog.dao;

import java.util.List;

import com.guduke.blog.entity.Category;

public interface CategoryDao {

	List<Category> queryCategory();

	Category queryCategoryById(Integer id);

	void insert(Category category);

	void update(Category category);

	void delete(Integer id);


}
