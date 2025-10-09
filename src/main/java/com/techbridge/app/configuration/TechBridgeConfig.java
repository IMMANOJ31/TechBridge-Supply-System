package com.techbridge.app.configuration;

import org.omg.CORBA.INTERNAL;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "com.techbridge.app")
@EnableWebMvc
@EnableScheduling
public class TechBridgeConfig implements WebMvcConfigurer {

    @Bean
    public ViewResolver resolver(){
        return new InternalResourceViewResolver("/","jsp");
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean factoryBean(){
        LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
        bean.setPackagesToScan("com.techbridge.app.entity");
        bean.setDataSource(dataSource());
        bean.setJpaProperties(properties());
        bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        return bean;
    }

    @Bean
    public DriverManagerDataSource dataSource(){
        DriverManagerDataSource source = new DriverManagerDataSource();
        source.setDriverClassName("com.mysql.cj.jdbc.Driver");
        source.setUrl("jdbc:mysql://localhost:3306/techBridge");
        source.setUsername("root");
        source.setPassword("Manu@Xwoorkz");
        return source;
    }

    @Bean
    public Properties properties(){
        Properties properties = new Properties();
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
        properties.setProperty("hibernate.show_sql", "true");
        properties.setProperty("hibernate.hbm2ddl.auto", "update");
        return properties;
    }
}
