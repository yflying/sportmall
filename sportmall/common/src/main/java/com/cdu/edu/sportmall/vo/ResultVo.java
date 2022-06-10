package com.cdu.edu.sportmall.vo;


import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "ResultVo对象")
public class ResultVo {


    private int code;
    private String msg;
    private Object data;
}
