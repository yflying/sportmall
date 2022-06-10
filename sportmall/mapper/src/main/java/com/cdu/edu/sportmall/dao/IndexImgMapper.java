package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.IndexImg;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface IndexImgMapper extends GeneralDao<IndexImg> {


    //查询轮播图信息

    public List<IndexImg> selectIndexImg();



}