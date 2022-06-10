package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.ShoppingCart;
import com.cdu.edu.sportmall.entity.ShoppingCartVo;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingCartMapper extends GeneralDao<ShoppingCart> {

    public List<ShoppingCartVo> selectShopcartByUserId(int userId);

    public int updateCartnumByCartid(@Param("cartId") int cartId,
                                     @Param("cartNum") int cartNum);

    //1,8
    public List<ShoppingCartVo> selectShopcartByCids(List<Integer> cids);

}