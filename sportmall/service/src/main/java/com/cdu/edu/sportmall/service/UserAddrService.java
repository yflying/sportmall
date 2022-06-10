package com.cdu.edu.sportmall.service;

import com.cdu.edu.sportmall.entity.UserAddr;
import com.cdu.edu.sportmall.vo.ResultVo;

public interface UserAddrService {
    public ResultVo listAddrsByUid(int userId);


    public ResultVo getUserAddrDetails(String addrId);

    public ResultVo updateUserAddr(UserAddr userAddr);

    public ResultVo insertUserAddr(UserAddr userAddr);
}
