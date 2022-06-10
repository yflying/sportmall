package com.cdu.edu.sportmall.service;


import com.cdu.edu.sportmall.entity.Orders;
import com.cdu.edu.sportmall.vo.ResultVo;

import java.sql.SQLException;
import java.util.Map;

public interface OrderService {
    public Map<String,String> addOrder(String cids, Orders order) throws SQLException;

    public int updateOrderStatus(String orderId, String status);

    public ResultVo getOrderById(String orderId);

    public void closeOrder(String orderId);

    public ResultVo listOrders(String userId,String status,int pageNum, int limit);

    public ResultVo listAllOrders(String status,int pageNum,int limit);

    public ResultVo deleteOrder(String orderId);

    public ResultVo setOrder(String orderId);

    public ResultVo receiveOrder(String orderId);

}
