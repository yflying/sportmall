package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.entity.Category;
import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.service.CategoryService;
import com.cdu.edu.sportmall.utils.FileUploadUtil;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@CrossOrigin
@RequestMapping("/category")
@Api(value = "提供商品分类的接口")
public class CategoryController {


    @Autowired
    private CategoryService categoryService;


    @GetMapping("/list-all")
    @ApiOperation("分类信息查询")
    public ResultVo listAllCategories(Integer level, int pageNum, int limit){


        return categoryService.listAllCategories(level,pageNum, limit);

    }


    @ApiOperation("分类基本信息查询接口")
    @GetMapping("/detail-info/{cid}")
    public ResultVo getCategoryBasicInfo(@PathVariable("cid") Integer cid){

        return categoryService.getCategoryBasicInfo(cid);

    }


    @ApiOperation("修改分类信息接口")
    @PostMapping("/update")
    public ResultVo insertUser(@RequestBody Category category){


        System.out.println(category);
        categoryService.updateCategory(category);

        return null;

    }

    @ApiOperation("删除分类接口")
    @GetMapping("/deleteCategory/{cid}")
    public ResultVo deleteUser(@PathVariable("cid") Integer cid){

        return categoryService.deleteCategory(cid);

    }

    @ApiOperation("添加商品分类接口")
    @PostMapping("/insertCategory")
    public ResultVo insertCategory(@RequestBody Category category){


        if (category.getParentId()==null){
            category.setParentId(0);
        }
        categoryService.insertCategory(category);
        return null;

    }

}
