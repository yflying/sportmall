package com.cdu.edu.sportmall.service.impl;


import com.cdu.edu.sportmall.dao.CategoryMapper;
import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.service.CategoryService;
import com.cdu.edu.sportmall.utils.MD5Utils;
import com.cdu.edu.sportmall.utils.PageHelper;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {


    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public ResultVo listCategories() {
        List<CategoryVo> categoryVos = categoryMapper.selectAllCategories();
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", categoryVos);
        return resultVo;

    }


    @Override
    public ResultVo listFirstLevelCategories() {
        List<CategoryVo> categoryVos = categoryMapper.selectFirstLevelCategories();
        ResultVo resultVo=new ResultVo(ResStatus.OK,"success",categoryVos);
        return resultVo;
    }

    @Override
    public ResultVo listAllCategories(Integer level, int pageNum, int limit) {


        int start = (pageNum-1)*limit;
        System.out.println(level);
        List<CategoryVo> categoryVos = categoryMapper.selectAllCategory(level, start, limit);

        //2.查询总记录数
        Example example = new Example(Category.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("categoryLevel",level);
        int count = categoryMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0? count/limit:count/limit+1;

        //4.封装，返回数据
        PageHelper<CategoryVo> pageHelper = new PageHelper<>(count, pageCount, categoryVos);


        ResultVo resultVO = new ResultVo(ResStatus.OK, "SUCCESS", pageHelper);
        return resultVO;
    }

    @Override
    public ResultVo getCategoryBasicInfo(Integer categoryId) {
        Example example=new Example(Category.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("categoryId",categoryId);
        List<Category> categories = categoryMapper.selectByExample(example);
        if (categories.size()>0){

            return new ResultVo(ResStatus.OK,"success",categories);

        }else {
            return new ResultVo(ResStatus.NO,"查询的用户不存在",null);
        }
    }


    @Override
    public ResultVo updateCategory(Category category) {

        int i = categoryMapper.updateByPrimaryKey(category);
        if (i>0){
            return new ResultVo(ResStatus.OK,"success",null);
        }else {
            return new ResultVo(ResStatus.NO,"fail",null);
        }
    }


    @Override
    public ResultVo deleteCategory(Integer categoryId) {

        int i=categoryMapper.deleteByPrimaryKey(categoryId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }


    @Override
    public ResultVo insertCategory(Category category) {


        if (category.getCategoryLevel()==1){
            category.setCategoryIcon("package.png");
        }

        categoryMapper.insert(category);

        return null;
    }
}
