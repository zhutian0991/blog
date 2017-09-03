package com.guduke.blog.service;

import com.guduke.blog.entity.Page;
import com.guduke.blog.entity.Word;

public interface WordService {

	Page<Word> queryPage(Integer pageNo, Integer pageSize);

	void update(Word word);

	Word queryWordById(Integer id);

	void insert(Word word);

	void deleteWord(Integer id);

	void bathDelete(Integer[] id);

}
