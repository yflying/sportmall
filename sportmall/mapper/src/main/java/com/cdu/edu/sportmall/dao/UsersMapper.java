package com.cdu.edu.sportmall.dao;

import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.general.GeneralDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersMapper extends GeneralDao<Users> {


    public List<Users> selectAllUsers(@Param("keyword") String keyword,
                                      @Param("start") int start,
                                      @Param("limit") int limit);
}