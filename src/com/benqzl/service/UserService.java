package com.benqzl.service;

import com.benqzl.pojo.User;

public interface UserService {
	 User selectByPrimaryKey(Integer id) throws Exception;

	 int updateByPrimaryKey(User record) throws Exception;
	 
	 User selectByUsername(String username);
}
