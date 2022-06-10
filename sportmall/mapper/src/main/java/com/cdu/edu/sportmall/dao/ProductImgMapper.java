package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.ProductImg;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImgMapper extends GeneralDao<ProductImg> {

    public List<ProductImg> selectProductImgByProductId(int productId);


    public int selectMaxId();
}