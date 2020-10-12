package com.fwtai.auth;

import com.fwtai.bean.JwtUser;
import com.fwtai.config.ConfigFile;
import com.fwtai.service.core.MenuService;
import com.fwtai.tool.ToolClient;
import com.fwtai.tool.ToolJWT;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录成功操作并返回token[type来区分PC端和小程序或ios或android]
*/
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

    @Resource
    private ToolJWT toolToken;

    @Resource
    private MenuService menuService;

    @Override
    public void onAuthenticationSuccess(final HttpServletRequest request,final HttpServletResponse response,final Authentication authentication) throws IOException, ServletException{
        final String type = request.getParameter("type");//除了PC端之外都要这个参数,登录类型1 为android ; 2 ios;3 小程序
        //取得账号信息
        final JwtUser jwtUser = (JwtUser) authentication.getPrincipal();
        SecurityContextHolder.getContext().setAuthentication(authentication);
        //取token,先去缓存中找,好的解决方案,登录成功后token存储到缓存数据库中,只要token还在过期内，不需要每次重新生成
        final String userId = jwtUser.getUserId();
        //加载前端菜单
        final Map<String,Object> map = new HashMap<>(4);
        if(type == null || type.isEmpty()){
            map.put(ConfigFile.REFRESH_TOKEN,toolToken.expireRefreshToken(userId));
            map.put(ConfigFile.ACCESS_TOKEN,toolToken.expireAccessToken(userId));
            map.put("menuData",menuService.getMenuData(userId));
            map.put("userName",jwtUser.getUsername());
        }else{
            map.put(ConfigFile.REFRESH_TOKEN,toolToken.buildRefreshToken(userId));
            map.put(ConfigFile.ACCESS_TOKEN,toolToken.buildAccessToken(userId));
        }
        final String json = ToolClient.queryJson(map);
        ToolClient.responseJson(json,response);
    }
}