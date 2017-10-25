package com.benqzl.dao;

import java.util.List;
import java.util.Map;

import com.benqzl.pojo.News;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(News record);
    
    List<News> findByPage(Map<String, Object> map);
    
    int pageCount(Map<String, Object> map);
    
    String selectByClasses(Integer classes);
    
    List<News> selectByTopThree();
}