package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.service.ProductCommentsService;
import com.cdu.edu.sportmall.service.ProductService;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apiguardian.api.API;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@CrossOrigin
@RequestMapping("/product")
@Api(value = "提供商品信息相关的接口",tags = "商品管理")
public class ProductController {

    @Autowired
    private ProductService productService;


    @Autowired
    private ProductCommentsService productCommentsService;


    @ApiOperation("商品基本信息查询接口")
    @GetMapping("/detail-info/{pid}")
    public ResultVo getProductBasicInfo(@PathVariable("pid") String pid){

        return productService.getProductBasicInfo(pid);

    }

    @ApiOperation("商品参数信息查询接口")
    @GetMapping("/detail-params/{pid}")
    public ResultVo getProductParams(@PathVariable("pid") String pid){

        return productService.getProductParamById(pid);

    }


    @ApiOperation("商品评论信息查询接口")
    @GetMapping("/detail-comments/{pid}")
    public ResultVo getproductComments(@PathVariable("pid") String pid,int pageNum,int limit){

        return productCommentsService.ListCommentsByProductId(pid,pageNum,limit);

    }

    @ApiOperation("商品评论统计查询接口")
    @GetMapping("/detail-commentscount/{pid}")
    public ResultVo getproductCommentsCount(@PathVariable("pid") String pid){

        return productCommentsService.getCommentsCountByProductId(pid);

    }
    @ApiOperation("根据类别查询商品接口")
    @GetMapping("/listbycid/{cid}")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "当前页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页显示条数",required = true)
    })
    public ResultVo getProductsByCategoryId(@PathVariable("cid") int cid,int pageNum,int limit){
        return productService.getProductsByCategoryId(cid,pageNum,limit);
    }

    @ApiOperation("根据类别查询商品品牌接口")
    @GetMapping("/listbrands/{cid}")
    public ResultVo getBrandsByCategoryId(@PathVariable("cid") int cid){
        return productService.listBrands(cid);
    }

    @ApiOperation("根据类别和品牌查询商品接口")
    @GetMapping("/listBybrands")
    public ResultVo getProductByBrands(int categoryId,String brand,int pageNum,int limit){
        System.out.println(categoryId);
        System.out.println(brand);

        return productService.getProductByBrands(categoryId,brand,pageNum,limit);
    }

    @ApiOperation("根据关键字查询商品接口")
    @GetMapping("/listbykeyword")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = true),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "当前页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页显示条数",required = true)
    })
    public ResultVo searchProducts(String keyword,int pageNum,int limit){
        return productService.searchProduct(keyword,pageNum,limit);

    }

    @ApiOperation("根据关键字查询商品品牌接口")
    @GetMapping("/listbrands-keyword")
    @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = true)
    public ResultVo getBrandsByKeyword(String keyword){
        return productService.listBrands(keyword);
    }

    @ApiOperation("添加商品信息")
    @PostMapping("/add")
    public ResultVo addProducts(@RequestBody NewProduct newProduct){
        System.out.println(newProduct);

        ResultVo resultVo = productService.addNewProduct(newProduct);
        return resultVo;
    }


    @ApiOperation("查询所有商品")
    @GetMapping("/list-all")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "当前页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页显示条数",required = true)
    })
    public ResultVo listAll(String keyword,int pageNum,int limit){
        return productService.listAllProduct(keyword,pageNum,limit);

    }



    @ApiOperation("删除商品接口")
    @GetMapping("/deleteProduct/{pid}")
    public ResultVo deleteProduct(@PathVariable("pid") Integer pid){

        return productService.deleteProduct(pid);

    }


    @ApiOperation("下架商品接口")
    @GetMapping("/downProduct/{pid}")
    public ResultVo downProduct(@PathVariable("pid") Integer pid){

        return productService.downProduct(pid);

    }

    @ApiOperation("上架商品接口")
    @GetMapping("/onProduct/{pid}")
    public ResultVo onProduct(@PathVariable("pid") Integer pid){

        return productService.onProduct(pid);

    }



    @ApiOperation("用户商品评论接口")
    @PostMapping("/comment")
    public ResultVo commentProduct(String isAnonymous ,String commType,String commContent,String orderId,Integer userId){

        return productCommentsService.insertComments(isAnonymous,commType,commContent,orderId,userId);

    }



    @GetMapping("/comments-list")
    @ApiOperation("查询所有评论信息")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页条数",required = true)
    })
    public ResultVo listAllComments(String keyword, int pageNum,int limit){
        ResultVo resultVo = productCommentsService.listAllComments(keyword,pageNum, limit);
        return resultVo;
    }

    @ApiOperation("回复评论接口")
    @PostMapping("/replyComments")
    public ResultVo replyComments(@RequestBody ProductComments productComments){


        return productCommentsService.replyComments(productComments);

    }


}
