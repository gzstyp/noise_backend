package com.fwtai.service.web;

import com.fwtai.bean.PageFormData;
import com.fwtai.config.ConfigFile;
import com.fwtai.tool.ToolClient;
import com.fwtai.tool.ToolString;
import com.fwtai.web.ParameterDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 参数管理业务层
 * @作者 田应平
 * @版本 v1.0
 * @QQ号码 444141300
 * @创建日期 2020-11-02 15:28:42
 * @官网 <url>http://www.yinlz.com</url>
*/
@Service
public class ParameterService{

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private ParameterDao parameterDao;

    public String add(final HttpServletRequest request){
        final PageFormData formData = new PageFormData(request);
        final String p_name = "name";
        final String p_value = "value";
        final String validate = ToolClient.validateField(formData,p_name,p_value);
        if(validate != null)return validate;
        formData.put("kid",ToolString.getIdsChar32());
        return ToolClient.executeRows(parameterDao.add(formData));
    }

    public String edit(final HttpServletRequest request){
        final PageFormData formData = new PageFormData(request);
        final String p_kid = "kid";
        final String p_name = "name";
        final String p_value = "value";
        final String validate = ToolClient.validateField(formData,p_name,p_value,p_kid);
        if(validate != null)return validate;
        final String exist_key = parameterDao.queryExistById(formData.getString(p_kid));
        if(exist_key == null){
            return ToolClient.createJson(ConfigFile.code199,"数据已不存在,刷新重试");
        }
        return ToolClient.executeRows(parameterDao.edit(formData));
    }

    public String queryById(final PageFormData pageFormData){
        final String p_id = "id";
        final String validate = ToolClient.validateField(pageFormData,p_id);
        if(validate != null)return validate;
        return ToolClient.queryJson(parameterDao.queryById(pageFormData.getString(p_id)));
    }

    public String delById(final PageFormData formData){
        final String p_kid = "id";
        final String validate = ToolClient.validateField(formData,p_kid);
        if(validate != null)return validate;
        final String kid = formData.getString(p_kid);
        final String exist_key = parameterDao.queryExistById(kid);
        if(exist_key == null){
            return ToolClient.createJson(ConfigFile.code199,"删除失败,数据已不存在");
        }
        return ToolClient.executeRows(parameterDao.delById(kid));
    }

    public String delByKeys(final PageFormData formData){
        final String p_ids = "ids";
        final String validate = ToolClient.validateField(formData,p_ids);
        if(validate != null)return validate;
        final String ids = formData.getString(p_ids);
        final ArrayList<String> lists = ToolString.keysToList(ids);
        return ToolClient.executeRows(parameterDao.delByKeys(lists),"操作成功","数据已不存在,刷新重试");
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
        final HashMap<String,Object> map = parameterDao.listData(formData);
        return ToolClient.dataTableOK((List<Object>)map.get(ConfigFile.rows),map.get(ConfigFile.total),(List<String>)map.get(ConfigFile.permissions),formData.get("sEcho"));
        } catch (Exception e){
            return ToolClient.dataTableException(formData.get("sEcho"));
        }
    }
}