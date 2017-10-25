package com.benqzl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.benqzl.dao.UserMapper;
import com.benqzl.pojo.User;
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public User selectByPrimaryKey(Integer id) throws Exception {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(User record) throws Exception {
		return mapper.updateByPrimaryKey(record);
	}

	@Override
	public User selectByUsername(String username) {
		return mapper.selectByUsername(username);
	}

}
