package com.guduke.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.MenuDao;
import com.guduke.blog.entity.Menu;
import com.guduke.blog.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	@Override
	public List<Menu> queryMenu() {
		return menuDao.queryMenu();
	}

}
