package com.cdu.edu.sportmall.service.impl;


import com.cdu.edu.sportmall.dao.OrderItemMapper;
import com.cdu.edu.sportmall.dao.OrdersMapper;
import com.cdu.edu.sportmall.dao.ProductCommentsMapper;
import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.service.ProductCommentsService;
import com.cdu.edu.sportmall.utils.PageHelper;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class ProductCommentsServiceImpl implements ProductCommentsService {
    @Autowired
    private ProductCommentsMapper productCommentsMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;
    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public ResultVo ListCommentsByProductId(String productId,int pageNum,int limit) {

        //List<ProductCommentsVo> productCommentsVos = productCommentsMapper.selectCommentsByProductId(productId);
        Example example = new Example(ProductComments.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        //查询总记录条数
        int count = productCommentsMapper.selectCountByExample(example);
        //计算总页数（确定每页显示多少条） pageSize()=limit
        int pageCount=count%limit==0?count/limit:count/limit+1;
        //查询当前页数据（连表查询）
        int start=(pageNum-1)*limit;
        List<ProductCommentsVo> list = productCommentsMapper.selectCommentsByProductId(productId, start, limit);
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", new PageHelper<ProductCommentsVo>(count,pageCount,list));
        return resultVo;
    }


    @Override
    public ResultVo getCommentsCountByProductId(String productId) {
        Example example = new Example(ProductComments.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("productId",productId);
        int total= productCommentsMapper.selectCountByExample(example);



        criteria.andEqualTo("commType",1);
        int goodTotal = productCommentsMapper.selectCountByExample(example);

        Example example1 = new Example(ProductComments.class);
        Example.Criteria criteria1 = example1.createCriteria();
        criteria1.andEqualTo("productId",productId);
        criteria1.andEqualTo("commType",0);
        int midTotal = productCommentsMapper.selectCountByExample(example1);

        Example example2 = new Example(ProductComments.class);
        Example.Criteria criteria2 = example2.createCriteria();
        criteria2.andEqualTo("productId",productId);
        criteria2.andEqualTo("commType",-1);
        int badTotal = productCommentsMapper.selectCountByExample(example2);

        double percent = (Double.parseDouble(goodTotal+"")/Double.parseDouble(total+""))*100;
        String percentValue=(percent+"").substring(0,(percent+"").lastIndexOf(".")+3);

        HashMap<String,Object> map= new HashMap<>();
        map.put("total",total);
        map.put("goodTotal",goodTotal);
        map.put("midTotal",midTotal);
        map.put("badTotal",badTotal);
        map.put("percent",percentValue);

        return new ResultVo(ResStatus.OK,"success",map);
    }


    @Override
    public ResultVo insertComments(String isAnonymous, String commType, String commContent, String orderId, Integer userId) {

        ProductComments productComments = new ProductComments();
        if (isAnonymous.equals("匿名")){
            productComments.setIsAnonymous(1);
        }
        if (isAnonymous.equals("不匿名")){
            productComments.setIsAnonymous(0);
        }
        if (commType.equals("好评")){
            productComments.setCommType(1);
        }
        if (commType.equals("中评")){
            productComments.setCommType(0);
        }
        if (commType.equals("差评")){
            productComments.setCommType(-1);
        }
        productComments.setCommContent(commContent);
        productComments.setUserId(userId.toString());

        //根据订单id查询订单项信息
        Example example = new Example(OrderItem.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("orderId",orderId);
        OrderItem orderItem = new OrderItem();
        List<OrderItem> list1=orderItemMapper.selectByExample(example);
        System.out.println(list1);
        orderItem=list1.get(0);
        productComments.setProductId(orderItem.getProductId());
        productComments.setProductName(orderItem.getProductName());
        productComments.setOrderItemId(orderItem.getItemId());

        Date date = new Date();
        productComments.setSepcName(date);
        productComments.setReplyStatus(0);
        int count=productCommentsMapper.selectMaxId();
        productComments.setCommId(String.valueOf(count+1));

        productCommentsMapper.insert(productComments);

        //修改订单状态为已完成
        ordersMapper.commentsResult(orderId);



        return null;
    }

    @Override
    public ResultVo getUserComments(String userId, int pageNum, int limit) {

        //1.分页查询
        int start = (pageNum-1)*limit;
        List<ProductComments> productComments = productCommentsMapper.selectUserCommentsById(userId,start, limit);

        //2.查询总记录数
        Example example = new Example(Orders.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        int count = productCommentsMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0?count/limit:count/limit+1;

        //4.封装数据
        PageHelper<ProductComments> pageHelper = new PageHelper<>(count, pageCount, productComments);
        return new ResultVo(ResStatus.OK,"SUCCESS",pageHelper);
    }

    @Override
    public ResultVo deleteUserComments(String commId) {

        int i=productCommentsMapper.deleteByPrimaryKey(commId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }

    @Override
    public ResultVo listAllComments(String keyword, int pageNum, int limit) {

        if (keyword==null){
            keyword="";
        }
        keyword = "%"+keyword+"%";

        //1.分页查询
        int start = (pageNum-1)*limit;
        List<ProductComments> productComments = productCommentsMapper.selectAllComments(keyword,start, limit);

        //2.查询总记录数
        Example example = new Example(ProductComments.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("productName",keyword);
        int count = productCommentsMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0?count/limit:count/limit+1;

        //4.封装数据
        PageHelper<ProductComments> pageHelper = new PageHelper<>(count, pageCount, productComments);;
        return new ResultVo(ResStatus.OK,"SUCCESS",pageHelper);
    }

    @Override
    public ResultVo replyComments(ProductComments productComments) {

        ProductComments productComments1 = new ProductComments();

        productComments1=productCommentsMapper.selectByPrimaryKey(productComments.getCommId());

        productComments1.setReplyContent(productComments.getReplyContent());

        productComments1.setReplyStatus(1);
        Date date = new Date();
        productComments1.setReplyTime(date);

        productCommentsMapper.updateByPrimaryKey(productComments1);

        return null;
    }
}
