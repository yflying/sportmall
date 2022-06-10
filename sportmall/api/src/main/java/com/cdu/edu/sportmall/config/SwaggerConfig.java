package com.cdu.edu.sportmall.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {



    @Bean
    public Docket getDocket(){



        ApiInfoBuilder apiInfoBuilder = new ApiInfoBuilder();

        apiInfoBuilder.title("体育商场接口说明");
        ApiInfo apiInfo =  apiInfoBuilder.build();



        Docket docket = new Docket(DocumentationType.SWAGGER_2)//制定文档风格
                    .apiInfo(apiInfo)//制定生成中的文档中的封面信息：标题作者版本
                    .select()
                    .apis(RequestHandlerSelectors.basePackage("com.cdu.edu.sportmall.controller"))
                    .paths(PathSelectors.any())//所有请求.any()
                    .build();


        return docket;

    }
}
