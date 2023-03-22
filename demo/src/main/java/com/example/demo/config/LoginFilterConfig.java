package com.example.demo.config;

import com.example.demo.filter.LoginFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class LoginFilterConfig {

    @Bean
    public FilterRegistrationBean setLoginFilter(){
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new LoginFilter());
        filterRegistrationBean.setName("loginFilter");
        filterRegistrationBean.addUrlPatterns("/book/*");
        filterRegistrationBean.setOrder(1);
        return filterRegistrationBean;
    }

}
