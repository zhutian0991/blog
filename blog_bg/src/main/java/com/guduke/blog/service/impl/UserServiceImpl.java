package com.guduke.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.UserDao;
import com.guduke.blog.entity.User;
import com.guduke.blog.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public User queryUser(User user) {
		return userDao.queryUser(user);
	}

	@Override
	public void updateIntroduce(User user) {
		userDao.updateIntroduce(user);
	}

	@Override
	public void updateInfo(User user) {
		userDao.updateInfo(user);
	}

	@Override
	public User queryUserInfo() {
		return userDao.queryUserInfo();
	}

}
