package com.cdu.edu.sportmall.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductQueryCondition {


    private String productName;
    private Date startTime;
    private Date endTime;
    private Integer rootCategoryId;


}
