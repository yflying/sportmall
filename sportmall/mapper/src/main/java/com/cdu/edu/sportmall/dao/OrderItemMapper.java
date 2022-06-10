package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.OrderItem;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemMapper extends GeneralDao<OrderItem> {

    public List<OrderItem> listOrderItemsByOrderId(String orderId);

}