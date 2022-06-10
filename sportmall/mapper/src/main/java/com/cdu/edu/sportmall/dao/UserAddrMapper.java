package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.UserAddr;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAddrMapper extends GeneralDao<UserAddr> {


    public int selectMaxId();
}