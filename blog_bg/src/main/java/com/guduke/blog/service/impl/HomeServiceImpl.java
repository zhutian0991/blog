package com.guduke.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guduke.blog.dao.LinkDao;
import com.guduke.blog.entity.Link;
import com.guduke.blog.service.HomeService;
@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private LinkDao linkDao;

	@Override
	public List<Link> queryLink() {
		return linkDao.queryLink();
	}

	@Override
	public Link queryLinkById(Integer id) {
		return linkDao.queryLinkById(id);
	}

	@Override
	public void insert(Link link) {
		linkDao.insert(link);
	}

	@Override
	public void update(Link link) {
		linkDao.update(link);
		
	}

	@Override
	public void delete(Integer id) {
		linkDao.delete(id);
		
	}

}
