package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.NewProduct;
import com.cdu.edu.sportmall.entity.ProductQueryCondition;
import com.cdu.edu.sportmall.entity.ProductVo;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {

    public ResultVo listRecommedProducts();

    public ResultVo getProductBasicInfo(String productId);

    public ResultVo getProductParamById(String productId);


    public ResultVo getProductsByCategoryId(int categoryId,int pageNum,int limit);

    public ResultVo listBrands(int categoryId);

    public ResultVo searchProduct(String kw,int pageNum,int limit);

    public ResultVo listBrands(String kw);

    public ResultVo addNewProduct(NewProduct newProduct);


    public ResultVo listAllProduct(String keyword, int pageNum,int limit);

    public ResultVo deleteProduct(Integer productId);

    public ResultVo downProduct(Integer productId);

    public ResultVo onProduct(Integer productId);

    public ResultVo getProductByBrands(int categoryId,String brand,int pageNum, int limit);

}
