package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.Category;
import com.cdu.edu.sportmall.vo.ResultVo;

public interface CategoryService {

    public ResultVo listCategories();

    public ResultVo listFirstLevelCategories();

    public ResultVo listAllCategories(Integer level, int pageNum, int limit);

    public ResultVo getCategoryBasicInfo(Integer categoryId);

    public ResultVo updateCategory(Category category);

    public ResultVo deleteCategory(Integer categoryId);

    public ResultVo insertCategory(Category category);
}
