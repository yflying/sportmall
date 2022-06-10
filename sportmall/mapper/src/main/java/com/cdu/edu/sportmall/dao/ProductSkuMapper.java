package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.ProductSku;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductSkuMapper extends GeneralDao<ProductSku> {

    public List<ProductSku> selectLowerestPriceByProductId(String productId);

    public int selectMaxId();

    public List<ProductSku> selectSkusByProductId(String productId);
}