package com.fwtai.swagger;

import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

import static springfox.documentation.builders.PathSelectors.regex;

/**
 * swagger2配置,注意扫描的包名!!!
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020/3/23 18:00
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@Configuration
@EnableSwagger2
public class Swagger2{

    //swagger2的配置文件,打开 http://127.0.0.1:801/swagger-ui.html
    @Bean
    public Docket docketV1() {
        return platformApi("v1.0.0");
    }

    public Docket platformApi(final String groupName) {
        return new Docket(DocumentationType.SWAGGER_2).groupName(groupName).apiInfo(apiInfo()).forCodeGeneration(true)
          .select()
          .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
          .paths(regex("^.*(?<!error)$"))
          .build()
          .securitySchemes(securitySchemes())
          .securityContexts(securityContexts());
    }

    private List<ApiKey> securitySchemes(){
        final List<ApiKey> apiKeyList = new ArrayList();
        apiKeyList.add(new ApiKey("accessToken","accessToken","header"));
        apiKeyList.add(new ApiKey("refreshToken","refreshToken","header"));
        return apiKeyList;
    }

    private List<SecurityContext> securityContexts(){
        final List<SecurityContext> securityContexts = new ArrayList<>();
        securityContexts.add(
          SecurityContext.builder()
            .securityReferences(defaultAuth())
            .forPaths(regex("^(?!auth).*$"))
            .build());
        return securityContexts;
    }

    private List<SecurityReference> defaultAuth(){
        final AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = new AuthorizationScope("global","accessEverything");;
        final List<SecurityReference> securityReferences = new ArrayList<>();
        securityReferences.add(new SecurityReference("accessToken", authorizationScopes));
        securityReferences.add(new SecurityReference("refreshToken", authorizationScopes));
        return securityReferences;
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("水西天香豆宴").description("©2020 Copyright. 驼峰科技有限责任公司<br />")
          .termsOfServiceUrl("http://www.yinlz.com")
          .contact(new Contact("api接口文档", "", "444141300@qq.com")).license("保密版本")
          .licenseUrl("http://www.yinlz.com").version("v1.0").build();
    }
}