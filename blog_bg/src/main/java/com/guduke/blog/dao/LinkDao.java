package com.guduke.blog.dao;

import java.util.List;
import com.guduke.blog.entity.Link;

public interface LinkDao {
	List<Link> queryLink();

	Link queryLinkById(Integer id);

	void insert(Link link);

	void update(Link link);

	void delete(Integer id);
}
