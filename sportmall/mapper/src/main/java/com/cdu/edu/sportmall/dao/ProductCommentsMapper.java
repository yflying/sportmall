package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.ProductComments;
import com.cdu.edu.sportmall.entity.ProductCommentsVo;
import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductCommentsMapper extends GeneralDao<ProductComments> {

    public int selectMaxId();

    public List<ProductCommentsVo> selectCommentsByProductId(@Param("productId") String productId, @Param("start")int start, @Param("limit")int limit);


    public List<ProductComments> selectUserCommentsById(@Param("userId") String userId,
                                      @Param("start") int start,
                                      @Param("limit") int limit);

    public List<ProductComments> selectAllComments(@Param("keyword") String keyword,
                                      @Param("start") int start,
                                      @Param("limit") int limit);
}