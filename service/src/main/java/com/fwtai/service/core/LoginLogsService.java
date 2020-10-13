package com.fwtai.service.core;

import com.fwtai.bean.PageFormData;
import com.fwtai.config.ConfigFile;
import com.fwtai.core.LoginLogsDao;
import com.fwtai.tool.ToolClient;
import com.fwtai.tool.ToolString;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * sys_login_logs业务层
 * @作者 田应平
 * @版本 v1.0
 * @QQ号码 444141300
 * @创建日期 2020-10-13 10:53:19
 * @官网 <url>http://www.yinlz.com</url>
*/
@Service
public class LoginLogsService{

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private LoginLogsDao loginlogsDao;

    public String add(final HttpServletRequest request){
        final PageFormData formData = new PageFormData(request);
        final String p_user_name = "user_name";
        final String validate = ToolClient.validateField(formData,p_user_name);
        if(validate != null)return validate;
        formData.put("kid",ToolString.getIdsChar32());
        return ToolClient.executeRows(loginlogsDao.add(formData));
    }

    public String queryById(final PageFormData pageFormData){
        final String p_id = "id";
        final String validate = ToolClient.validateField(pageFormData,p_id);
        if(validate != null)return validate;
        return ToolClient.queryJson(loginlogsDao.queryById(pageFormData.getString(p_id)));
    }

    public String delById(final PageFormData formData){
        final String p_kid = "id";
        final String validate = ToolClient.validateField(formData,p_kid);
        if(validate != null)return validate;
        final String kid = formData.getString(p_kid);
        return ToolClient.executeRows(loginlogsDao.delById(kid));
    }

    public String listData(PageFormData formData){
        final String p_iColumns = "iColumns";
        final String validate = ToolClient.validateField(formData,p_iColumns);
        if(validate != null)return validate;
        final String fieldInteger = ToolClient.validateInteger(formData,p_iColumns);
        if(fieldInteger != null)return fieldInteger;
        try {
        formData = ToolClient.dataTableMysql(formData);
        if(formData == null)return ToolClient.jsonValidateField();
        final HashMap<String,Object> map = loginlogsDao.listData(formData);
        return ToolClient.dataTableOK((List<Object>)map.get(ConfigFile.rows),map.get(ConfigFile.total),(List<String>)map.get(ConfigFile.permissions),formData.get("sEcho"));
        } catch (Exception e){
            return ToolClient.dataTableException(formData.get("sEcho"));
        }
    }
}