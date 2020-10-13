package com.fwtai.service.core;

import com.fwtai.bean.PageFormData;
import com.fwtai.config.ConfigFile;
import com.fwtai.config.LocalUserId;
import com.fwtai.core.DepartmentDao;
import com.fwtai.tool.ToolClient;
import com.fwtai.tool.ToolProperties;
import com.fwtai.tool.ToolString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 组织机构
 * @作者 田应平
 * @版本 v1.0
 * @QQ号码 444141300
 * @官网 http://www.fwtai.com
 */
@Service
public class DepartmentService{

    @Autowired
    private DepartmentDao departmentDao;

    /**添加*/
    public String add(final HttpServletRequest request){
        final String login_key = LocalUserId.get();
        final PageFormData pageFormData = ToolClient.getFormData(request);
        final String kid = pageFormData.getString("kid");
        final String default_parent = ToolProperties.getInstance("config.properties").getString("default_parent","kid00000000000000000000000001024");
        final String parent_id = ToolString.isBlank(kid) ? default_parent : kid;
        pageFormData.put("creator",login_key);
        final String isParent = pageFormData.getString("isParent");
        pageFormData.put("parent_id",parent_id);
        pageFormData.put("kid",ToolString.getIdsChar32());
        return ToolClient.executeRows(departmentDao.add(pageFormData));
    }

    /**编辑*/
    public String edit(final HttpServletRequest request){
        final PageFormData pageFormData = ToolClient.getFormData(request);
        final String validateField = ToolClient.validateField(pageFormData,"kid");
        if(validateField != null)return validateField;
        final String kid = pageFormData.getString("kid");
        final String isParent = pageFormData.getString("isParent");
        final boolean use = departmentDao.queryTotalDep(kid);/*查询该节点是否还有子节点*/
        if(use){
            /*编辑时如果该节点还有子节点则更新为是父节点*/
            if(("0").equals(isParent)){
                return ToolClient.createJson(ConfigFile.code199,"该节点含子节点不能更改类型");
            }
        }
        return ToolClient.executeRows(departmentDao.edit(pageFormData));
    }

    /**行删除*/
    public String delById(final PageFormData pageFormData){
        final String p_kid = "id";
        final String validate = ToolClient.validateField(pageFormData,p_kid);
        if(validate != null)return validate;
        final String kid = pageFormData.getString(p_kid);
        final String exist = departmentDao.queryOccupyDep(kid);
        if(exist != null){
            return ToolClient.createJson(ConfigFile.code199,"该节点已被使用不能删除");
        }
        final boolean use = departmentDao.queryTotalDep(kid);
        if(use){
            return ToolClient.createJson(ConfigFile.code199,"该节点还有子节点不能删除");
        }
        final int total = departmentDao.queryTotal();
        if(total == 1){
            return ToolClient.createJson(ConfigFile.code199,"跟节点仅能改名不能删除");
        }
        return ToolClient.executeRows(departmentDao.delById(kid));
    }

    /**
     * 查询所有的部门机构,用于添加或编辑
     * @param pageFormData
     * @作者 田应平
     * @创建时间 2017年1月21日 上午1:09:20
     * @QQ号码 444141300
     * @官网 http://www.fwtai.com
    */
    public String queryAllDepartment(final PageFormData pageFormData){
        final String parent_id = ToolProperties.getInstance("config.properties").getString("default_parent","kid00000000000000000000000001024");
        String id = pageFormData.getString("kid");
        id = id == null?parent_id:id;
        try {
            return ToolClient.queryJson(departmentDao.queryAllDepartment(id));
        } catch (Exception e){
            return ToolClient.exceptionJson();
        }
    }

    /**查询登录者所拥有的权限*/
    public String queryPermissions(){
        final List<String> permissions = departmentDao.queryPermissions();
        return ToolClient.queryJson(permissions);
    }
}