package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.entity.ProductComments;
import com.cdu.edu.sportmall.entity.Users;
import com.cdu.edu.sportmall.service.ProductCommentsService;
import com.cdu.edu.sportmall.service.UserService;
import com.cdu.edu.sportmall.utils.Base64Utils;
import com.cdu.edu.sportmall.utils.BlobUtils;
import com.cdu.edu.sportmall.utils.ConvertUtil;
import com.cdu.edu.sportmall.utils.FileUploadUtil;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.*;
import io.swagger.models.auth.In;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.Blob;

@RestController
@RequestMapping("/user")
@Api(value = "用户管理")
@CrossOrigin
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private ProductCommentsService productCommentsService;

    @ApiOperation("用户登录接口")
    @GetMapping(value = "/login")
    public ResultVo login(@RequestParam("userName") String name,
                          @RequestParam("userPwd") String pwd){

        ResultVo resultVo = userService.checkLogin(name,pwd);



        return  resultVo;
    }


    @ApiOperation("用户注册接口")
    @RequestMapping(value = "/regist",method = RequestMethod.POST)
    public ResultVo regist(@RequestBody Users user){

        ResultVo resultVo = userService.registUser(user.getUsername(),user.getPassword());
        return resultVo;

    }


    @ApiOperation("校验token是否过期接口")
    @GetMapping("/check")
    public ResultVo userTokencheck(@RequestHeader("token") String token){
        return new ResultVo(ResStatus.OK,"success",null);
    }



    @GetMapping("/list-all")
    @ApiOperation("查询所有用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(dataType = "string",name = "keyword", value = "搜索关键字",required = false),
            @ApiImplicitParam(dataType = "int",name = "pageNum", value = "页码",required = true),
            @ApiImplicitParam(dataType = "int",name = "limit", value = "每页条数",required = true)
    })
    public ResultVo listAll(String keyword, int pageNum,int limit){
        ResultVo resultVo = userService.listAllUsers(keyword,pageNum, limit);
        return resultVo;
    }


    @ApiOperation("用户基本信息查询接口")
    @GetMapping("/detail-info/{pid}")
    public ResultVo getUserBasicInfo(@PathVariable("pid") Integer pid){

        return userService.getUserBasicInfo(pid);

    }


    @ApiOperation("修改用户信息接口")
    @PostMapping("/updateUser")
    public ResultVo updateUser(Users users , @RequestParam(value = "file", required = false)MultipartFile coverFile){


        String path = "D:/学习/SpringBoot/sportmall-static/static/images";

        try {
            String coverFileName = FileUploadUtil.saveFile(coverFile, path );
            System.out.println(coverFileName);

            ResultVo resultVo = userService.updateUser(users,coverFileName);
            return resultVo;
        } catch (IOException e) {
            e.printStackTrace();
        }


        return null;

    }

    @ApiOperation("删除用户接口")
    @GetMapping("/deleteUser/{pid}")
    public ResultVo deleteUser(@PathVariable("pid") Integer pid){

        return userService.deleteUser(pid);

    }


    @ApiOperation("添加用户信息接口")
    @PostMapping("/insertUser")
    public ResultVo insertUser(Users users , @RequestParam(value = "file", required = false)MultipartFile coverFile){


        String path = "D:/学习/SpringBoot/sportmall-static/static/images";

        try {
            String coverFileName = FileUploadUtil.saveFile(coverFile, path );
            System.out.println(coverFileName);

            ResultVo resultVo = userService.insertUser(users,coverFileName);
            return resultVo;
        } catch (IOException e) {
            e.printStackTrace();
        }


        return null;

    }


    @ApiOperation("用户评论查询接口")
    @GetMapping("/comments-list")
    public ResultVo getUserCommentsBasicInfo(String userId,int pageNum,int limit){



        return productCommentsService.getUserComments(userId,pageNum,limit);

    }

    @ApiOperation("删除用户评论接口")
    @GetMapping("/deleteUserComments/{pcid}")
    public ResultVo deleteUserComments(@PathVariable("pcid") String pcid){

        return productCommentsService.deleteUserComments(pcid);

    }

}

