package com.benqzl.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.benqzl.dao.MessageMapper;
import com.benqzl.pojo.Message;
@Service("message")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper mapper;
	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Message record) throws Exception {
		return mapper.insert(record);
	}

	@Override
	public Message selectByPrimaryKey(Integer id) throws Exception {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Message record) throws Exception {
		return mapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Message> findByPage(Map<String, Object> map) throws Exception {
		return mapper.findByPage(map);
	}

	@Override
	public int pageCount(Map<String, Object> map) throws Exception {
		return mapper.pageCount(map);
	}

}
