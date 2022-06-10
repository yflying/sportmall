package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.ProductParams;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductParamsMapper extends GeneralDao<ProductParams> {

    public int selectMaxId();

    public List<ProductParams> selectParamsByProductId(String ProductId);

}