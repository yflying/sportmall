package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.ShoppingCart;
import com.cdu.edu.sportmall.vo.ResultVo;

public interface ShoppingCartService {

    public ResultVo addShoppingCart(ShoppingCart cart);
    public ResultVo listShoppingCartsByUserId(int userId);

    public ResultVo updateCartNum(int cartId,int cartNum);

    public ResultVo listShoppingCartsByCids(String cids);


}
