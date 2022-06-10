package com.cdu.edu.sportmall.entity;

import tk.mybatis.mapper.annotation.KeySql;
import tk.mybatis.mapper.code.ORDER;

import java.util.Date;
import javax.persistence.*;

@Table(name = "product_params")
public class ProductParams {
    /**
     * 商品参数id
     */
    @Id
    @Column(name = "param_id")
    private String paramId;

    /**
     * 商品id
     */
    @Column(name = "product_id")
    private String productId;


    @Column(name = "product_place")
    private String productPlace;


    @Column(name = "clog")
    private String clog;


    private String brand;

    /**
     * 生产厂名 生产厂名，例：大灰狼工厂
     */
    @Column(name = "factory_name")
    private String factoryName;

    /**
     * 生产厂址 生产厂址，例：大灰狼生产基地
     */
    @Column(name = "factory_address")
    private String factoryAddress;


    @Column(name = "function")
    private String function;

    /**
     * 规格重量 规格重量，例：35g
     */
    private String weight;


    @Column(name = "details")
    private String details;



    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 获取商品参数id
     *
     * @return param_id - 商品参数id
     */
    public String getParamId() {
        return paramId;
    }

    /**
     * 设置商品参数id
     *
     * @param paramId 商品参数id
     */
    public void setParamId(String paramId) {
        this.paramId = paramId;
    }

    /**
     * 获取商品id
     *
     * @return product_id - 商品id
     */
    public String getProductId() {
        return productId;
    }

    /**
     * 设置商品id
     *
     * @param productId 商品id
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * 获取产地 产地，例：中国江苏
     *
     * @return product_place - 产地 产地，例：中国江苏
     */
    public String getProductPlace() {
        return productPlace;
    }

    /**
     * 设置产地 产地，例：中国江苏
     *
     * @param productPlace 产地 产地，例：中国江苏
     */
    public void setProductPlace(String productPlace) {
        this.productPlace = productPlace;
    }

    /**
     * 获取品牌名 品牌名，例：三只大灰狼
     *
     * @return brand - 品牌名 品牌名，例：三只大灰狼
     */
    public String getBrand() {
        return brand;
    }

    /**
     * 设置品牌名 品牌名，例：三只大灰狼
     *
     * @param brand 品牌名 品牌名，例：三只大灰狼
     */
    public void setBrand(String brand) {
        this.brand = brand;
    }

    /**
     * 获取生产厂名 生产厂名，例：大灰狼工厂
     *
     * @return factory_name - 生产厂名 生产厂名，例：大灰狼工厂
     */
    public String getFactoryName() {
        return factoryName;
    }

    /**
     * 设置生产厂名 生产厂名，例：大灰狼工厂
     *
     * @param factoryName 生产厂名 生产厂名，例：大灰狼工厂
     */
    public void setFactoryName(String factoryName) {
        this.factoryName = factoryName;
    }

    /**
     * 获取生产厂址 生产厂址，例：大灰狼生产基地
     *
     * @return factory_address - 生产厂址 生产厂址，例：大灰狼生产基地
     */
    public String getFactoryAddress() {
        return factoryAddress;
    }

    /**
     * 设置生产厂址 生产厂址，例：大灰狼生产基地
     *
     * @param factoryAddress 生产厂址 生产厂址，例：大灰狼生产基地
     */
    public void setFactoryAddress(String factoryAddress) {
        this.factoryAddress = factoryAddress;
    }



    public String getWeight() {
        return weight;
    }

    /**
     * 设置规格重量 规格重量，例：35g
     *
     * @param weight 规格重量 规格重量，例：35g
     */
    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getClog() {
        return clog;
    }

    public void setClog(String clog) {
        this.clog = clog;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    /**
     * 获取存储方法 存储方法，例：常温5~25°
     *
     * @return storage_method - 存储方法 存储方法，例：常温5~25°
     */




    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "ProductParams{" +
                "paramId='" + paramId + '\'' +
                ", productId='" + productId + '\'' +
                ", productPlace='" + productPlace + '\'' +
                ", clog='" + clog + '\'' +
                ", brand='" + brand + '\'' +
                ", factoryName='" + factoryName + '\'' +
                ", factoryAddress='" + factoryAddress + '\'' +
                ", function='" + function + '\'' +
                ", weight='" + weight + '\'' +
                ", details='" + details + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}