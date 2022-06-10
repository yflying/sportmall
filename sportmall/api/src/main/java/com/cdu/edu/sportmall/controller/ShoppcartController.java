package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.entity.ShoppingCart;
import com.cdu.edu.sportmall.service.ShoppingCartService;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import org.apiguardian.api.API;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/shopcart")
@CrossOrigin
@Api(value = "提供购物车相关业务接口",tags = "购物车管理")
public class ShoppcartController {


    @Autowired
    private ShoppingCartService shoppingCartService;

    @PostMapping("/add")
    public ResultVo addShoppingCart(@RequestBody ShoppingCart cart,@RequestHeader("token")String token){
        ResultVo resultVo = shoppingCartService.addShoppingCart(cart);
        return resultVo;
    }

    @GetMapping("/list")
    @ApiImplicitParam(dataType = "int",name = "userId", value = "用户ID",required = true)
    public ResultVo list(Integer userId,@RequestHeader("token")String token){
        ResultVo resultVo = shoppingCartService.listShoppingCartsByUserId(userId);
        return resultVo;
    }

    @PutMapping("/update/{cid}/{cnum}")
    public ResultVo updateNum(@PathVariable("cid") Integer cartId,
                              @PathVariable("cnum") Integer cartNum,
                              @RequestHeader("token") String token){
        ResultVo resultVo = shoppingCartService.updateCartNum(cartId, cartNum);
        return resultVo;
    }

    @GetMapping("/listbycids")
    @ApiImplicitParam(dataType = "String",name = "cids", value = "选择的购物车记录的id",required = true)
    public ResultVo listByCids(String cids, @RequestHeader("token")String token){
        ResultVo resultVo = shoppingCartService.listShoppingCartsByCids(cids);
        return resultVo;
    }

}
