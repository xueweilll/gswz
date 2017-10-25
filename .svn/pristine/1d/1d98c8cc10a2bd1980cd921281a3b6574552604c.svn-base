package com.benqzl.dao;

import java.util.List;
import java.util.Map;

import com.benqzl.pojo.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Message record);
    
    List<Message> findByPage(Map<String, Object> map);
    
    int pageCount(Map<String, Object> map);
}