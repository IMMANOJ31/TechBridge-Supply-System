package com.techbridge.app.configuration;


import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }
    // non-web components (services, db, swagger)

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{AppConfig.class, SwaggerConfig.class};
    }
    // web layer configuration (controllers, view resolvers)

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }



}
