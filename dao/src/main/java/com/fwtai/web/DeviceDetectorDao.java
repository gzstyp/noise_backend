package com.fwtai.web;

import com.fwtai.bean.PageFormData;
import com.fwtai.datasource.DaoHandle;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * 探测器设备访问数据库
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020/4/9 13:43
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@Repository
public class DeviceDetectorDao{

    @Resource
    private DaoHandle dao;

    public int add(final PageFormData pageFormData){
        return dao.execute("module_device_detector.add",pageFormData);
    }

    public String queryExistById(final String kid){
        return dao.queryForString("module_device_detector.queryExistById",kid);
    }

    public int edit(final PageFormData pageFormData){
        return dao.execute("module_device_detector.edit",pageFormData);
    }

    public HashMap<String, Object> queryById(final String kid){
        return dao.queryForHashMap("module_device_detector.queryById",kid);
    }

    public int delById(final String kid){
        return dao.execute("module_device_detector.delById",kid);
    }

    public int delByKeys(final ArrayList<String> list){
        return dao.execute("module_device_detector.delByKeys",list);
    }

    public HashMap<String,Object> listData(final PageFormData pageFormData){
        return dao.queryForPage(pageFormData,"module_device_detector.listData","module_device_detector.listTotal");
    }
}