package com.cdu.edu.sportmall.service.impl;

import com.cdu.edu.sportmall.dao.UserAddrMapper;
import com.cdu.edu.sportmall.entity.UserAddr;
import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.service.UserAddrService;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

@Service
public class UserAddrServiceImpl implements UserAddrService {

    @Autowired
    private UserAddrMapper userAddrMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
    public ResultVo listAddrsByUid(int userId) {
        Example example = new Example(UserAddr.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        criteria.andEqualTo("status",1);

        List<UserAddr> userAddrs = userAddrMapper.selectByExample(example);
        ResultVo resultVo = new ResultVo(ResStatus.OK, "success", userAddrs);
        return resultVo;
    }


    @Override
    public ResultVo getUserAddrDetails(String addrId) {
        Example example=new Example(UserAddr.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("addrId",addrId);
        List<UserAddr> userAddrs = userAddrMapper.selectByExample(example);
        if (userAddrs.size()>0){

            return new ResultVo(ResStatus.OK,"success",userAddrs);

        }else {
            return new ResultVo(ResStatus.NO,"查询的用户不存在",null);
        }
    }

    @Override
    public ResultVo updateUserAddr(UserAddr userAddr) {


        Date date = new Date();
        userAddr.setUpdateTime(date);

        userAddrMapper.updateByPrimaryKey(userAddr);

        return null;
    }


    @Override
    public ResultVo insertUserAddr(UserAddr userAddr) {

        int count=userAddrMapper.selectMaxId();
        userAddr.setAddrId(String.valueOf(count+1));
        userAddr.setStatus(1);
        Date date =new Date();
        userAddr.setUpdateTime(date);
        userAddr.setCreateTime(date);
        Example example=new Example(UserAddr.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userAddr.getUserId());
        if (userAddrMapper.selectCountByExample(example)>=1){
            userAddr.setCommonAddr(0);
        }else {
            userAddr.setCommonAddr(1);
        }
        userAddrMapper.insert(userAddr);


        return null;
    }
}
