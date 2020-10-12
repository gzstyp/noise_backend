package com.fwtai.api.controller;

import com.fwtai.tool.ToolClient;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

/**
 * 小程序|移动端登录
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-07-17 15:08
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
 */
@Api(tags = "小程序移动端登录")
@RestController
public class ApiUserController{

    //实际上是不走这个方法!!!
    @ApiOperation(value = "小程序登录功能", notes = "要求输入账号(用户名)、登录密码、type类型为3")
    @ApiImplicitParams({
      @ApiImplicitParam(name = "username", value = "登录账号(用户名|手机号)", dataType = "String", paramType = "query", required = true),
      @ApiImplicitParam(name = "password", value = "登录密码", dataType = "String", paramType = "query", required = true),
      @ApiImplicitParam(name = "type", value = "登录密码", dataType = "int", example = "3",paramType = "query", required = true)
    })
    @PostMapping(value = "/login")
    public void edit(final HttpServletResponse response){
        ToolClient.responseJson(ToolClient.createJsonSuccess("需要token才能访问edit成功"),response);
    }
}