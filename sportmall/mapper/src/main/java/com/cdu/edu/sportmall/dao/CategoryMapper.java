package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.Category;
import com.cdu.edu.sportmall.entity.CategoryVo;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CategoryMapper extends GeneralDao<Category> {

    public List<CategoryVo> selectAllCategories();


    //查询一级类别
    public List<CategoryVo> selectFirstLevelCategories();


    public List<CategoryVo> selectAllCategory(@Param("level")Integer level,
                                              @Param("start") int start,
                                              @Param("limit") int limit);
}