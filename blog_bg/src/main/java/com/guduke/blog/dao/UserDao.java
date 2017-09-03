package com.guduke.blog.dao;

import com.guduke.blog.entity.User;

public interface UserDao {

	User queryUser(User user);

	void updateIntroduce(User user);

	void updateInfo(User user);

	User queryUserInfo();

}
