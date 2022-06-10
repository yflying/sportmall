package com.cdu.edu.sportmall.service.impl;


import com.cdu.edu.sportmall.dao.UsersMapper;
import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.service.UserService;
import com.cdu.edu.sportmall.utils.Base64Utils;
import com.cdu.edu.sportmall.utils.MD5Utils;
import com.cdu.edu.sportmall.utils.PageHelper;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UsersMapper usersMapper;



    @Transactional
    public ResultVo registUser(String userName, String userPwd) {

        synchronized (this){


            Example example = new Example(Users.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("username",userName);
            List<Users> users = usersMapper.selectByExample(example);

            if (users.size() == 0){
                String md5Pwd =  MD5Utils.md5(userPwd);
                Users user = new Users();
                user.setUsername(userName);
                user.setPassword(md5Pwd);
                user.setUserRegtime(new Date());
                user.setUserModtime(new Date());
                user.setUserImg("111");
                int i = usersMapper.insertUseGeneratedKeys(user);
                if (i>0){
                    return new ResultVo(ResStatus.OK,"注册成功",user);
                }else {
                    return new ResultVo(ResStatus.NO,"注册失败",null);

                }
            }else {
                return new ResultVo(ResStatus.NO,"用户名已被注册",null);
            }

        }

    }



    @Override
    public ResultVo checkLogin(String userName, String userPwd) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", userName);
        List<Users> users = usersMapper.selectByExample(example);

        if(users.size() == 0){
            return new ResultVo(ResStatus.NO,"登录失败，用户名不存在！",null);
        }else{
            String md5Pwd = MD5Utils.md5(userPwd);
            if(md5Pwd.equals(users.get(0).getPassword())){
                //如果登录验证成功，则需要生成令牌token（token就是按照特定规则生成的字符串）
                //使用jwt规则生成token字符串
                JwtBuilder builder = Jwts.builder();

                HashMap<String,Object> map = new HashMap<>();
                map.put("key1","value1");
                map.put("key2","value2");

                String token = builder.setSubject(userName)                     //主题，就是token中携带的数据
                        .setIssuedAt(new Date())                            //设置token的生成时间
                        .setId(users.get(0).getUserId() + "")               //设置用户id为token  id
                        .setClaims(map)                                     //map中可以存放用户的角色权限信息
                        .setExpiration(new Date(System.currentTimeMillis() + 24*60*60*1000)) //设置token过期时间
                        .signWith(SignatureAlgorithm.HS256, "6666")     //设置加密方式和加密密码
                        .compact();


                return new ResultVo(ResStatus.OK,token,users.get(0));
            }else{
                return new ResultVo(ResStatus.NO,"登录失败，密码错误！",null);
            }
        }
    }


    @Override
    public ResultVo listAllUsers(String keyword, int pageNum, int limit) {

        if (keyword==null){
            keyword="";
        }
        keyword = "%"+keyword+"%";

        //1.分页查询
        int start = (pageNum-1)*limit;
        List<Users> users = usersMapper.selectAllUsers(keyword,start, limit);

        //2.查询总记录数
        Example example = new Example(Orders.class);
        Example.Criteria criteria = example.createCriteria();
        int count = usersMapper.selectCountByExample(example);

        //3.计算总页数
        int pageCount = count%limit==0?count/limit:count/limit+1;

        //4.封装数据
        PageHelper<Users> pageHelper = new PageHelper<>(count, pageCount, users);;
        return new ResultVo(ResStatus.OK,"SUCCESS",pageHelper);
    }


    @Override
    public ResultVo getUserBasicInfo(Integer userId) {
        Example example=new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userId",userId);
        List<Users> users = usersMapper.selectByExample(example);
        if (users.size()>0){

            return new ResultVo(ResStatus.OK,"success",users);

        }else {
            return new ResultVo(ResStatus.NO,"查询的用户不存在",null);
        }

    }


    @Override
    public ResultVo updateUser(Users users, String coverFileName) {


        users.setPassword(MD5Utils.md5(users.getPassword()));
        StringBuilder s = new StringBuilder(coverFileName);
        s.insert(0,"images/");


        Date date = new Date();
        users.setUserImg(s.toString());
        users.setUserModtime(date);
        if (users.getUserSex().equals("男")) {
            users.setUserSex("M");
        }
        if (users.getUserSex().equals("女")){
            users.setUserSex("F");
        }
        System.out.println(users);
        usersMapper.updateByPrimaryKey(users);


        return null;
    }

    @Override
    public ResultVo deleteUser(Integer userId) {


        int i=usersMapper.deleteByPrimaryKey(userId);
        if (i>0) {
            return new ResultVo(ResStatus.OK, "success", null);
        }
        else {
            return new ResultVo(ResStatus.NO, "fail", null);
        }
    }
    @Override
    public ResultVo insertUser(Users users, String coverFileName) {

        users.setPassword(MD5Utils.md5(users.getPassword()));
        StringBuilder s = new StringBuilder(coverFileName);
        s.insert(0,"images/");

        Date date = new Date();
        users.setUserImg(s.toString());
        users.setUserModtime(date);
        users.setUserRegtime(date);
        if (users.getUserSex().equals("男")){
            users.setUserSex("M");
        }else {
            users.setUserSex("F");
        }
        System.out.println(users);


        usersMapper.insert(users);


        return null;
    }


}



