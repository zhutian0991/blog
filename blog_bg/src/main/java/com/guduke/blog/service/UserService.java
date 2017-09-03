package com.guduke.blog.service;

import com.guduke.blog.entity.User;

public interface UserService {

	User queryUser(User user);

	void updateIntroduce(User user);

	void updateInfo(User user);

	User queryUserInfo();

}
