package com.benqzl.service;

import java.util.List;
import java.util.Map;

import com.benqzl.pojo.Message;

public interface MessageService {
	int deleteByPrimaryKey(Integer id) throws Exception;

	int insert(Message record) throws Exception;

	Message selectByPrimaryKey(Integer id) throws Exception;

	int updateByPrimaryKey(Message record) throws Exception;

	List<Message> findByPage(Map<String, Object> map) throws Exception;

	int pageCount(Map<String, Object> map) throws Exception;
}
