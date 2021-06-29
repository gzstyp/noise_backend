package com.fwtai.web.controller;

import com.fwtai.service.core.LoginLogsService;
import com.fwtai.tool.ToolClient;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * sys_login_logs控制层|路由层
 * @作者 田应平
 * @版本 v1.0
 * @QQ号码 444141300
 * @创建日期 2020-10-13 10:53:19
 * @官网 <url>http://www.yinlz.com</url>
*/
@RestController
@RequestMapping("/loginLogs")
public class LoginLogsController{

    @Resource
	private LoginLogsService loginlogsService;

    /**根据id查询对应的数据*/
    @PreAuthorize("hasAuthority('loginLogs_row_queryById')")
    @GetMapping("/queryById")
    public void queryById(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(loginlogsService.queryById(ToolClient.getFormData(request)),response);
    }

    /**删除-单行*/
    @PreAuthorize("hasAuthority('loginLogs_row_delById')")
    @PostMapping("/delById")
    public void delById(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(loginlogsService.delById(ToolClient.getFormData(request)),response);
    }

    /**获取数据*/
    @PreAuthorize("hasAuthority('loginLogs_btn_listData')")
    @GetMapping("/listData")
    public void listData(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(loginlogsService.listData(ToolClient.getFormData(request)),response);
    }

    @GetMapping("/notAuthorized")
    public void notAuthorized(final HttpServletResponse response){
        ToolClient.responseJson(ToolClient.accessDenied(),response);
    }
}