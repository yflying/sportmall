package com.cdu.edu.sportmall.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.code.ORDER;

import javax.persistence.Column;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewProduct {


    private String productId;
    private String productName;
    private Integer categoryId;
    private Integer rootCategoryId;
    private Integer soldNum;
    private Integer productStatus;
    private String content;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date updateTime;

    private String skuId;
    private String skuName;
    private String skuImg;
    private String untitled;
    private Integer originalPrice;
    private Integer sellPrice;
    private BigDecimal discounts;
    private Integer stock;
    private Integer status;

    private String paramId;
    private String productPlace;
    private String clog;
    private String brand;
    private String factoryName;
    private String factoryAddress;
    private String function;
    private String details;
    private String weight;

    private String id;
    private String url;
    private Integer sort;
    private Integer isMain;



}
