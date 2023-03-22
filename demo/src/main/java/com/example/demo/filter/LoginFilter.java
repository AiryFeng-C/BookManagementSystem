package com.example.demo.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化方法被执行");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(true);
        response.setContentType("text/html;");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String contextPath = request.getContextPath();
        if(session.getAttribute("name") != null){
            filterChain.doFilter(servletRequest,servletResponse);
        } else {
            out.println("您没有登录，请先登录！3秒后回到登录页面。");
            response.setHeader("refresh","3;url="+contextPath+"/");
        }
    }

    @Override
    public void destroy() {
        System.out.println("destroy方法被执行");
    }
}
