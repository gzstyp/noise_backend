package com.fwtai.web.controller;

import com.fwtai.service.core.DepartmentService;
import com.fwtai.tool.ToolClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 组织机构
 * @作者 田应平
 * @版本 v1.0
 * @QQ号码 444141300
 * @官网 http://www.fwtai.com
*/
@RequestMapping("/department")
@RestController
public class DepartmentController{

    @Autowired
    private DepartmentService service;

    /**右键添加*/
    @PreAuthorize("hasAuthority('department_add')")
    @PostMapping("/add")
    public void add(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(service.add(request),response);
    }

    /**右键编辑*/
    @PreAuthorize("hasAuthority('department_edit')")
    @PostMapping("/edit")
    public void edit(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(service.edit(request),response);
    }

    /**右键删除*/
    @PreAuthorize("hasAuthority('department_delById')")
    @PostMapping("/delById")
    public void delById(final HttpServletRequest request,final HttpServletResponse response){
        ToolClient.responseJson(service.delById(ToolClient.getFormData(request)),response);
    }

    /**查询所有的部门机构,用于添加或编辑菜单*/
    @PreAuthorize("hasAuthority('department_queryAllDepartment')")
    @GetMapping("/queryAllDepartment")
    public void queryAllDepartment(final HttpServletRequest request,final HttpServletResponse response){
        final String json = service.queryAllDepartment(ToolClient.getFormData(request)).replaceAll("\"false\"", "false").replaceAll("\"true\"", "true");
        ToolClient.responseJson(json,response);
    }

    /**查询登录者所拥有的权限,一般是listData即*/
    @PreAuthorize("hasAuthority('department_queryAllDepartment')")
    @GetMapping("/permissions")
    public void permissions(final HttpServletResponse response){
        ToolClient.responseJson(service.queryPermissions(),response);
    }
}