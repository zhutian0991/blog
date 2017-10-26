package com.guduke.blog.service;

import java.util.List;

import com.guduke.blog.entity.Link;

public interface HomeService {

	List<Link> queryLink();

	Link queryLinkById(Integer id);

	void insert(Link link);

	void update(Link link);

	void delete(Integer id);

}
