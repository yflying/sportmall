package com.cdu.edu.sportmall.service.impl;

import com.cdu.edu.sportmall.dao.ProductImgMapper;
import com.cdu.edu.sportmall.dao.ProductMapper;
import com.cdu.edu.sportmall.dao.ProductParamsMapper;
import com.cdu.edu.sportmall.dao.ProductSkuMapper;
import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.service.ProductService;
import com.cdu.edu.sportmall.utils.PageHelper;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ProductImgMapper productImgMapper;

    @Autowired
    private ProductSkuMapper productSkuMapper;

    @Autowired
    private ProductParamsMapper productParamsMapper;


    public ResultVo listRecommedProducts() {
        List<ProductVo> productVoList=productMapper.selectRecommedProducts();
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", productVoList);
        return resultVo;
    }


    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVo getProductBasicInfo(String productId) {
        //商品信息
        Example example=new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        criteria.andEqualTo("productStatus",1);
        List<Product> products = productMapper.selectByExample(example);
        if (products.size()>0){
            //商品图片
            Example example1= new Example(ProductImg.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("itemId",productId);
            List<ProductImg> productImgs = productImgMapper.selectByExample(example1);

            //商品套餐sku

            Example example2 = new Example(ProductSku.class);
            Example.Criteria criteria2 = example2.createCriteria();
            criteria2.andEqualTo("productId",productId);
            criteria2.andEqualTo("status",1);
            List<ProductSku> productSkus = productSkuMapper.selectByExample(example2);

            HashMap<String,Object> basicInfo = new HashMap<>();
            basicInfo.put("product",products.get(0));
            basicInfo.put("productImgs",productImgs);
            basicInfo.put("productSkus",productSkus);
            return new ResultVo(ResStatus.OK,"success",basicInfo);

        }else {
            return new ResultVo(ResStatus.NO,"查询的商品不存在",null);
        }

    }

    @Override
    public ResultVo getProductParamById(String productId) {
        Example example = new Example(ProductParams.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("productId",productId);
        List<ProductParams> productParams = productParamsMapper.selectByExample(example);
        if (productParams.size()>0){

            return new ResultVo(ResStatus.OK,"success",productParams.get(0));
        }else {
            return new ResultVo(ResStatus.NO,"此商品无相关信息",null);
        }
    }

    @Override
    public ResultVo getProductsByCategoryId(int categoryId, int pageNum, int limit) {
        //1.查询分页数据
        int start = (pageNum-1)*limit;
        List<ProductVo> productVOS = productMapper.selectProductByCategoryId(categoryId, start, limit);
        //2.查询当前类别下的商品的总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("categoryId",categoryId);
        int count = productMapper.selectCountByExample(example);
        //3.计算总页数
        int pageCount = count%limit==0? count/limit : count/limit+1;
        //4.封装返回数据
        PageHelper<ProductVo> pageHelper = new PageHelper<>(count, pageCount, productVOS);
        return new ResultVo(ResStatus.OK,"SUCCESS",pageHelper);
    }

    @Override
    public ResultVo listBrands(int categoryId) {
        List<String> brands = productMapper.selectBrandByCategoryId(categoryId);
        return new ResultVo(ResStatus.OK,"success",brands);
    }

    @Override
    public ResultVo searchProduct(String kw, int pageNum, int limit) {
        //1.查询搜索结果

        kw = "%"+kw+"%";
        int start = (pageNum-1)*limit;
        List<ProductVo> productVOS = productMapper.selectProductByKeyword(kw, start, limit);

        //2.查询总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("productName",kw);
        int count = productMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0? count/limit:count/limit+1;

        //4.封装，返回数据
        PageHelper<ProductVo> pageHelper = new PageHelper<>(count, pageCount, productVOS);


        ResultVo resultVO = new ResultVo(ResStatus.OK, "SUCCESS", pageHelper);
        return resultVO;
    }

    @Override
    public ResultVo listBrands(String kw) {
        kw = "%"+kw+"%";
        List<String> brands = productMapper.selectBrandByKeyword(kw);
        return new ResultVo(ResStatus.OK,"SUCCESS",brands);
    }


    @Override
    public ResultVo addNewProduct(NewProduct newProduct) {
        Timestamp d= new Timestamp(System.currentTimeMillis());
        newProduct.setCreateTime(d);
        newProduct.setUpdateTime(d);
        Product product = new Product();
        ProductParams productParams = new ProductParams();
        ProductImg productImg = new ProductImg();
        ProductSku productSku = new ProductSku();

        int count1 = productMapper.selectMaxId();
        newProduct.setProductId(String.valueOf(count1+1));

        BeanUtils.copyProperties(newProduct,product);
        BeanUtils.copyProperties(newProduct,productParams);
        BeanUtils.copyProperties(newProduct,productSku);
        productImg.setSort(newProduct.getSort());
        productImg.setItemId(newProduct.getProductId());
        productImg.setIsMain(newProduct.getIsMain());
        productImg.setUrl(newProduct.getUrl());
        productImg.setCreatedTime(newProduct.getCreateTime());
        productImg.setUpdatedTime(newProduct.getUpdateTime());
        //获取数据条数

        int count2 = productParamsMapper.selectMaxId();
        productParams.setParamId(String.valueOf(count2+1));
        int count3 = productSkuMapper.selectMaxId();
        productSku.setSkuId(String.valueOf(count3+1));
        int count4 = productImgMapper.selectMaxId();
        productImg.setId(String.valueOf(count4+1));

        String a = productSku.getUntitled();
        String regexp = "\'";
        a=a.replaceAll(regexp,"\"");
        productSku.setUntitled(a);

        String b = product.getContent().replace("'","\"").replace("‘","\"");
        product.setContent(b);


        int i = productMapper.insert(product);
        int j=productSkuMapper.insert(productSku);
        int m=productParamsMapper.insert(productParams);
        int n=productImgMapper.insert(productImg);

        if (i>0&&j>0&&m>0&&n>0){
            return new ResultVo(ResStatus.OK,"success",null);
        }else {
            return new ResultVo(ResStatus.NO,"fail",null);
        }
    }

    @Override
    public ResultVo listAllProduct(String keyword, int pageNum, int limit) {
        //1.查询搜索结果

        if (keyword==null){
            keyword="";
        }
        keyword = "%"+keyword+"%";
        int start = (pageNum-1)*limit;
        List<ProductVo> productVOS = productMapper.selectAllProduct(keyword, start, limit);

        //2.查询总记录数
        Example example = new Example(Product.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("productName",keyword);
        int count = productMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0? count/limit:count/limit+1;

        //4.封装，返回数据
        PageHelper<ProductVo> pageHelper = new PageHelper<>(count, pageCount, productVOS);


        ResultVo resultVO = new ResultVo(ResStatus.OK, "SUCCESS", pageHelper);
        return resultVO;
    }

    @Override
    public ResultVo deleteProduct(Integer productId) {

        int i=productMapper.deleteByProductId(productId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }


    @Override
    public ResultVo downProduct(Integer productId) {
        int i=productMapper.downProduct(productId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }

    @Override
    public ResultVo onProduct(Integer productId) {
        int i=productMapper.onProduct(productId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }

    @Override
    public ResultVo getProductByBrands(int categoryId, String brand, int pageNum, int limit) {
        //1.查询分页数据
        int start = (pageNum-1)*limit;
        limit=limit*pageNum;
        List<ProductVo> productVOS = productMapper.selectProductByBrands(categoryId);

        //2.查询当前类别下的商品的总记录数
        List<ProductVo> productVos2= new ArrayList<>();
        for (ProductVo item : productVOS){
            Example example = new Example(ProductParams.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("productId",item.getProductId());
            List<ProductParams> productParams=productParamsMapper.selectByExample(example);

            if (productParams.get(0).getBrand().equals(brand)){
                productVos2.add(item);
            }
        }
        System.out.println(productVos2.size());
        if (limit>productVos2.size()){
            limit=productVos2.size();
        }
        productVos2=productVos2.subList(start,limit);
        Example example2 = new Example(Product.class);
        Example.Criteria criteria2 = example2.createCriteria();
        criteria2.andEqualTo("categoryId",categoryId);
        List<Product> products = productMapper.selectByExample(example2);
        int count=0;
        for (Product item2 : products) {
            Example example3 = new Example(ProductParams.class);
            Example.Criteria criteria3 = example3.createCriteria();
            criteria3.andEqualTo("productId",item2.getProductId());
            List<ProductParams> productParams2=productParamsMapper.selectByExample(example3);
            if (productParams2.get(0).getBrand().equals(brand)){
                count=count+1;
            }
        }
        System.out.println(count);
        //3.计算总页数
        int pageCount = count%limit==0? count/limit : count/limit+1;
        //4.封装返回数据
        PageHelper<ProductVo> pageHelper = new PageHelper<>(count, pageCount, productVos2);
        return new ResultVo(ResStatus.OK,"SUCCESS",pageHelper);
    }
}
