package com.guduke.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.CategoryDao;
import com.guduke.blog.entity.Category;
import com.guduke.blog.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> queryCategory() {
		return categoryDao.queryCategory();
	}

	@Override
	public Category queryCategoryById(Integer id) {
		return categoryDao.queryCategoryById(id);
	}

	@Override
	public void insert(Category category) {
		categoryDao.insert(category);
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);
		
	}

	@Override
	public void delete(Integer id) {
		categoryDao.delete(id);
		
	}
}
