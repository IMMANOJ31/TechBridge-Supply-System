package com.techbridge.app.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.IOException;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "com.techbridge.app")
@EnableWebMvc
@EnableScheduling
public class AppConfig implements WebMvcConfigurer {

    @Value("${db.driver}")
    private String driverClassName;

    @Value("${db.url}")
    private String url;

    @Value("${db.username}")
    private String userName;

    @Value("${db.password}")
    private String password;

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
        source.setDriverClassName(driverClassName);
        source.setUrl(url);
        source.setUsername(userName);
        source.setPassword(password);
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

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyConfigurer() {
        PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
        Resource[] resources = new Resource[]{
                new ClassPathResource("application.properties"),
                new ClassPathResource("application-secret.properties")
        };
        configurer.setLocations(resources);
        return configurer;
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
