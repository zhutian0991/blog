package com.guduke.blog.dao;

import java.util.List;
import java.util.Map;

import com.guduke.blog.entity.Word;

public interface WordDao {

	List<Word> queryAllWord(Map<String, Object> paramMap);

	int queryTotalSize(Map<String, Object> paramMap);

	void update(Word word);

	Word queryWordById(Integer id);

	void insert(Word word);

	void deleteWord(Integer id);

	void bathDelete(Integer[] id);

}
