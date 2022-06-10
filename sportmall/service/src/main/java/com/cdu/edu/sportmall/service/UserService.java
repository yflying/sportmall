package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.vo.ResultVo;

public interface UserService {


    public ResultVo registUser(String userName,String userPwd);
    public ResultVo checkLogin(String userName,String userPwd);

    public ResultVo listAllUsers(String keyword,int pageNum,int limit);

    public ResultVo getUserBasicInfo(Integer userId);

    public ResultVo updateUser(Users users,String coverFileName);

    public ResultVo deleteUser(Integer userId);


    public ResultVo insertUser(Users users,String coverFileName);

}
