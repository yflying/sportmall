package com.cdu.edu.sportmall.service.impl;

import com.cdu.edu.sportmall.dao.ShoppingCartMapper;
import com.cdu.edu.sportmall.entity.ShoppingCart;
import com.cdu.edu.sportmall.entity.ShoppingCartVo;
import com.cdu.edu.sportmall.service.ShoppingCartService;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @Override
    public ResultVo addShoppingCart(ShoppingCart cart) {
        cart.setCartTime(sdf.format(new Date()));
        int i = shoppingCartMapper.insert(cart);
        if (i>0){
            return new ResultVo(ResStatus.OK,"success",null);
        }else {
            return new ResultVo(ResStatus.NO,"fail",null);
        }
    }
    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVo listShoppingCartsByUserId(int userId) {
        List<ShoppingCartVo> list = shoppingCartMapper.selectShopcartByUserId(userId);
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", list);
        return resultVo;
    }

    @Override
    public ResultVo updateCartNum(int cartId, int cartNum) {
        int i = shoppingCartMapper.updateCartnumByCartid(cartId, cartNum);
        if(i>0){
            return new ResultVo(ResStatus.OK,"update success",null);
        }else{
            return new ResultVo(ResStatus.NO,"update fail",null);
        }
    }

    @Override
    public ResultVo listShoppingCartsByCids(String cids) {
        //使用tkmapper只能查询到某张表中拥有的字段，因此没法查询到商品名称、图片、单价等信息
        String[] arr = cids.split(",");
        List<Integer> cartIds = new ArrayList<>();
        for (int i=0; i<arr.length; i++){
            cartIds.add(Integer.parseInt(arr[i]));
        }
        List<ShoppingCartVo> list = shoppingCartMapper.selectShopcartByCids(cartIds);
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", list);
        return resultVo;
    }


}
