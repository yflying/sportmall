package com.cdu.edu.sportmall.controller;


import com.alibaba.druid.sql.visitor.functions.Substring;
import com.cdu.edu.sportmall.dao.CategoryMapper;
import com.cdu.edu.sportmall.dao.OrdersMapper;
import com.cdu.edu.sportmall.dao.ProductCommentsMapper;
import com.cdu.edu.sportmall.dao.ProductMapper;
import com.cdu.edu.sportmall.entity.*;
import com.cdu.edu.sportmall.vo.ResStatus;
import com.cdu.edu.sportmall.vo.ResultVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/echarts")
@Api(value = "数据分析接口")
public class EchartsController {


    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private ProductCommentsMapper productCommentsMapper;

    @GetMapping("/Category")
    @ApiOperation("商品统计查询接口")
    public ResultVo User(){
        System.out.println("success");

            int num1=productMapper.selectNumByRootCategoryId(1);
            int num2=productMapper.selectNumByRootCategoryId(2);
            int num3=productMapper.selectNumByRootCategoryId(3);

        Map<String,Object> map=new HashMap<>();
        List<Map<String,Object>> cicle=new ArrayList<>();
        map.put("name",categoryMapper.selectByPrimaryKey(1).getCategoryName());
        map.put("value",num1);
        cicle.add(map);
        Map<String,Object> map1=new HashMap<>();
        map1.put("name",categoryMapper.selectByPrimaryKey(2).getCategoryName());
        map1.put("value",num2);
        cicle.add(map1);
        Map<String,Object> map2=new HashMap<>();
        map2.put("name",categoryMapper.selectByPrimaryKey(3).getCategoryName());
        map2.put("value",num3);
        cicle.add(map2);



        return new ResultVo(ResStatus.OK,"success",cicle);
    }



    @GetMapping("/order")
    @ApiOperation("订单统计查询接口")
    public ResultVo orderMap(){

        List<Map<String,Object>> maps=new ArrayList<>();

        List<Orders> orders=ordersMapper.selectOrderMap();
        for (Orders item: orders){
            Map<String,Object> map=new HashMap<>();
            String a=item.getReceiverAddress().substring(0,2);
            map.put("NAME",a);
            map.put("value",item.getActualAmount());
            maps.add(map);
        }
        System.out.println(maps);
        return new ResultVo(ResStatus.OK,"success",maps);

    }

    @GetMapping("/comments")
    @ApiOperation("评论统计查询接口")
    public ResultVo commentsTable(){


        List<ProductComments> productComments=productCommentsMapper.selectAll();
        int [] good=new int[5];
        int [] normal=new int[5];
        int [] bad=new int[5];
        for (ProductComments item:productComments){
            String a = item.getProductName().substring(0,2);
            if (a.equals("NI")){
                if (item.getCommType().equals(1)){
                    good[0]=good[0]+1;
                }
                if (item.getCommType().equals(0)){
                    normal[0]=normal[0]+1;
                }
                if (item.getCommType().equals(-1)){
                    bad[0]=bad[0]+1;
                }
            }
            if (a.equals("ad")){
                if (item.getCommType().equals(1)){
                    good[1]=good[1]+1;
                }
                if (item.getCommType().equals(0)){
                    normal[1]=normal[1]+1;
                }
                if (item.getCommType().equals(-1)){
                    bad[1]=bad[1]+1;
                }
            }
            if (a.equals("FI")){
                if (item.getCommType().equals(1)){
                    good[2]=good[2]+1;
                }
                if (item.getCommType().equals(0)){
                    normal[2]=normal[2]+1;
                }
                if (item.getCommType().equals(-1)){
                    bad[2]=bad[2]+1;
                }
            }
            if (a.equals("华亚")){
                if (item.getCommType().equals(1)){
                    good[3]=good[3]+1;
                }
                if (item.getCommType().equals(0)){
                    normal[3]=normal[3]+1;
                }
                if (item.getCommType().equals(-1)){
                    bad[3]=bad[3]+1;
                }
            }
            if (a.equals("CO")){
                if (item.getCommType().equals(1)){
                    good[4]=good[4]+1;
                }
                if (item.getCommType().equals(0)){
                    normal[4]=normal[4]+1;
                }
                if (item.getCommType().equals(-1)){
                    bad[4]=bad[4]+1;
                }
            }


        }
        List<Map<String,Object>> comments=new ArrayList<>();

        Map<String,Object> map1=new HashMap<>();
        map1.put("value1",good[0]);
        map1.put("value2",normal[0]);
        map1.put("value3",bad[0]);
        map1.put("name","耐克");
        comments.add(map1);
        Map<String,Object> map2=new HashMap<>();
        map2.put("value1",good[1]);
        map2.put("value2",normal[1]);
        map2.put("value3",bad[1]);
        map2.put("name","adidas");
        comments.add(map2);
        Map<String,Object> map3=new HashMap<>();
        map3.put("value1",good[2]);
        map3.put("value2",normal[2]);
        map3.put("value3",bad[2]);
        map3.put("name","斐乐");
        comments.add(map3);
        Map<String,Object> map4=new HashMap<>();
        map4.put("value1",good[3]);
        map4.put("value2",normal[3]);
        map4.put("value3",bad[3]);
        map4.put("name","华亚");
        comments.add(map4);
        Map<String,Object> map5=new HashMap<>();
        map5.put("value1",good[4]);
        map5.put("value2",normal[4]);
        map5.put("value3",bad[4]);
        map5.put("name","匡威");
        comments.add(map5);


        return new ResultVo(ResStatus.OK,"success",comments);

    }


}
