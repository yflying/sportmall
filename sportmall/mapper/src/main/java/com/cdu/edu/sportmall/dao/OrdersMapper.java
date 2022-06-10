package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.Orders;
import com.cdu.edu.sportmall.entity.OrdersVo;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersMapper extends GeneralDao<Orders> {

    public List<OrdersVo> selectOrders(@Param("userId") String userId,
                                       @Param("status") String status,
                                       @Param("start") int start,
                                       @Param("limit") int limit);

    public List<OrdersVo> selectAllOrders(@Param("status") String status,
                                       @Param("start") int start,
                                       @Param("limit") int limit);

    public int setOrderById(@Param("orderId") String orderId);

    public int receiveOrder(@Param("orderId") String orderId);

    public int commentsResult(@Param("orderId") String orderId);

    public List<Orders> selectOrderMap();
}