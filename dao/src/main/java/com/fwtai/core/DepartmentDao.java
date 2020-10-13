package com.fwtai.core;

import com.fwtai.bean.PageFormData;
import com.fwtai.datasource.DaoHandle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * 组织部门
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-10-10 16:46
 * @QQ号码 444141300
 * @Email service@dwlai.com
 * @官网 http://www.fwtai.com
*/
@Repository
public class DepartmentDao{

    @Autowired
    private DaoHandle dao;

    @Transactional
    public int add(final PageFormData pageFormData){
        return dao.execute("sys_department.add",pageFormData);
    }

    public int edit(final PageFormData pageFormData){
        return dao.execute("sys_department.edit",pageFormData);
    }

    public int delById(final String kid){
        return dao.execute("sys_department.delById",kid);
    }

    public List<HashMap<String,Object>> queryAllDepartment(final String id){
        return dao.queryForListHashMap("sys_department.queryAllDepartment",id);
    }

    public int queryTotal(){
        return dao.queryForInteger("sys_department.queryTotal");
    }

    public String queryOccupyDep(final String kid){
        return dao.queryForString("sys_department.queryOccupyDep",kid);
    }

    public boolean queryTotalDep(final String kid){
        return dao.queryForString("sys_department.queryTotalDep",kid) != null;
    }
}