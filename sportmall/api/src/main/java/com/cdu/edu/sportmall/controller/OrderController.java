package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.config.MyPayConfig;
import com.cdu.edu.sportmall.entity.Orders;
import com.cdu.edu.sportmall.service.OrderService;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import com.github.wxpay.sdk.WXPay;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/order")
@Api(value = "提供订单相关的操作接口",tags = "订单管理")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    public ResultVo add(String cids, @RequestBody Orders order){
        ResultVo resultVo = null;
        try {
            Map<String, String> orderInfo = orderService.addOrder(cids, order);
            if(orderInfo!=null){
                String orderId = orderInfo.get("orderId");
                //设置当前订单信息
                HashMap<String,String> data = new HashMap<>();
                data.put("body",orderInfo.get("productNames"));  //商品描述
                data.put("out_trade_no",orderId);               //使用当前用户订单的编号作为当前支付交易的交易号
                data.put("fee_type","CNY");                     //支付币种
                //data.put("total_fee",order.getActualAmount()*100+"");          //支付金额
                data.put("total_fee","1");
                data.put("trade_type","NATIVE");                //交易类型
                data.put("notify_url","http://yyt123.free.idcfengye.com/pay/callback");           //设置支付完成时的回调方法接口

                //发送请求，获取响应
                //微信支付：申请支付连接
                WXPay wxPay = new WXPay(new MyPayConfig());
                Map<String, String> resp = wxPay.unifiedOrder(data);
                orderInfo.put("payUrl",resp.get("code_url"));
                //orderInfo中包含：订单编号，购买的商品名称，支付链接
                resultVo = new ResultVo(ResStatus.OK,"提交订单成功！",orderInfo);
            }else{
                resultVo = new ResultVo(ResStatus.NO,"提交订单失败！",null);
            }
        } catch (SQLException e) {
            resultVo = new ResultVo(ResStatus.NO,"提交订单失败！",null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultVo;
    }

    @GetMapping("/status/{oid}")
    public ResultVo getOrderStatus(@PathVariable("oid") String orderId,@RequestHeader("token")String token){
        ResultVo resultVo = orderService.getOrderById(orderId);
        return resultVo;
    }

    @GetMapping("/list")
    @ApiOperation("用户订单查询接口")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "userId", value = "用户ID",required = true),
            @ApiImplicitParam(dataType = "string",name = "status", value = "订单状态",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页条数",required = true)
    })
    public ResultVo list(@RequestHeader("token")String token,
                         String userId,String status,int pageNum,int limit){

        ResultVo resultVo = orderService.listOrders(userId, status, pageNum, limit);
        return resultVo;
    }

    @GetMapping("/list-all")
    @ApiOperation("查询所有订单接口")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "status", value = "订单状态",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页条数",required = true)
    })
    public ResultVo listAll(String status,int pageNum,int limit){
        ResultVo resultVo = orderService.listAllOrders(status, pageNum, limit);
        return resultVo;
    }

    @ApiOperation("删除订单接口")
    @GetMapping("/deleteOrder/{oid}")
    public ResultVo deleteOrder(@PathVariable("oid") String oid){

        return orderService.deleteOrder(oid);

    }

    @ApiOperation("订单发货接口")
    @GetMapping("/setOrder/{oid}")
    public ResultVo setOrder(@PathVariable("oid") String oid){

        return orderService.setOrder(oid);

    }

    @ApiOperation("订单收货接口")
    @GetMapping("/receiveOrder/{oid}")
    public ResultVo receiveOrder(@PathVariable("oid") String oid){

        return orderService.receiveOrder(oid);

    }



}
