package com.benqzl.service;

import java.util.List;
import java.util.Map;

import com.benqzl.pojo.News;

public interface NewsService {
	int deleteByPrimaryKey(Integer id)throws Exception;

    int insert(News record)throws Exception;

    News selectByPrimaryKey(Integer id)throws Exception;

    int updateByPrimaryKey(News record)throws Exception;
    
    List<News> findByPage(Map<String, Object> map)throws Exception;
    
    int pageCount(Map<String, Object> map) throws Exception;
    
    String selectByClasses(Integer classes) throws Exception;
    
    List<News> selectByTopThree()throws Exception;
}
