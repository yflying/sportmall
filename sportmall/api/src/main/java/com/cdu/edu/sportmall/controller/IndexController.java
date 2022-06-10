package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.service.CategoryService;
import com.cdu.edu.sportmall.service.IndexImgService;
import com.cdu.edu.sportmall.service.ProductService;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("/index")
@Api(value = "提供首页数据显示的接口")
public class IndexController {


    @Autowired
    private IndexImgService indexImgService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;


    @GetMapping("/indeximg")
    @ApiOperation("首页轮播图接口")
    public ResultVo listIndexImg(){

        return  indexImgService.listIndexImg();
    }


    @GetMapping("/category-list")
    @ApiOperation("首页分类列表")
    public ResultVo listCategories(){

        return categoryService.listCategories();

    }


    @GetMapping("/list-recommends")
    @ApiOperation("查询推荐商品接口")
    public ResultVo listRecommendProducts(){
        return productService.listRecommedProducts();
    }


    @GetMapping("/category-recommends")
    @ApiOperation("分类推荐接口")
    public ResultVo listRecommendProductsByCategory(){
        return categoryService.listFirstLevelCategories();
    }




}
