package com.cdu.edu.sportmall.controller;


import com.cdu.edu.sportmall.entity.Category;
import com.cdu.edu.sportmall.entity.UserAddr;
import com.cdu.edu.sportmall.service.UserAddrService;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@Api(value = "提供收货地址相关接口",tags = "收货地址管理")
@RequestMapping("/useraddr")
public class UserAddrController {

    @Autowired
    private UserAddrService userAddrService;

    @GetMapping("/list")
    @ApiImplicitParam(dataType = "int",name = "userId", value = "用户ID",required = true)
    public ResultVo listAddr(Integer userId, @RequestHeader("token") String token){
        ResultVo resultVo = userAddrService.listAddrsByUid(userId);
        return resultVo;
    }


    @ApiOperation("用户地址基本信息查询接口")
    @GetMapping("/details")
    public ResultVo getUserBasicInfo(String addrId, @RequestHeader("token") String token){


        return userAddrService.getUserAddrDetails(addrId);

    }

    @ApiOperation("修改地址信息接口")
    @PostMapping("/update")
    public ResultVo updateUserAddr(@RequestBody UserAddr userAddr,@RequestHeader("token") String token){



        return userAddrService.updateUserAddr(userAddr);

    }

    @ApiOperation("添加地址信息接口")
    @PostMapping("/insert")
    public ResultVo insertUserAddr(@RequestBody UserAddr userAddr,@RequestHeader("token") String token){


        return userAddrService.insertUserAddr(userAddr);

    }
}
