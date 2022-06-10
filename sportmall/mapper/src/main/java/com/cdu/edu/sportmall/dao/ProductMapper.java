package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.Product;
import com.cdu.edu.sportmall.entity.ProductVo;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper extends GeneralDao<Product>{

    public List<ProductVo> selectRecommedProducts();

    public List<ProductVo> selectTop6ByCategory(int cid);


    public List<ProductVo> selectProductByCategoryId(@Param("cid") int cid,
                                                     @Param("start") int start,
                                                     @Param("limit") int limit);

    /**
     * 根据类别id查询此类别下的商品的品牌列表
     * @param cid
     * @return
     */
    public List<String> selectBrandByCategoryId(int cid);


    /**
     * 根据关键字模糊搜索商品信息
     * @param keyword
     * @param start
     * @param limit
     * @return
     */
    public List<ProductVo> selectProductByKeyword(@Param("kw") String keyword,
                                                  @Param("start") int start,
                                                  @Param("limit") int limit);

    /**
     * 根据搜索关键字查询相关商品的品牌列表
     * @param kw
     * @return
     */
    public List<String> selectBrandByKeyword(String kw);


    public int selectMaxId();

    public List<ProductVo> selectAllProduct(@Param("kw") String keyword,
                                          @Param("start") int start,
                                          @Param("limit") int limit);

    public int deleteByProductId(@Param("productId") int productId);

    public int downProduct(@Param("productId") int productId);

    public int onProduct(@Param("productId") int productId);

    public List<ProductVo> selectProductByBrands(@Param("cid") int categoryId);

    public int selectNumByRootCategoryId(@Param("rid")int rootCategoryId);
}