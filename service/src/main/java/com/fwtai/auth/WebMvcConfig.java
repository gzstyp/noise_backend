package com.fwtai.auth;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 解决跨域问题
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020/4/29 20:42
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

    @Override
    public void addCorsMappings(final CorsRegistry registry){
        registry.addMapping("/**")
            .allowedOrigins("http://www.fwtai.com","https://www.fwtai.com","http://192.168.3.108","http://127.0.0.1:8080","http://192.168.3.108:8080","http://localhost:8080")//同源配置*表示任何请求都视为同源，若需指定ip和端口可以改为如“localhost：8080”，多个以“,”分隔；
            .allowedMethods("PUT","DELETE","GET","POST","OPTIONS")
            .allowedHeaders("*")
            .allowCredentials(true)
            .maxAge(7200L);//默认值是 1800 seconds (即30分钟)
    }
}