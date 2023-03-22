package com.example.demo.controller;

import com.example.demo.crud.AdminsRepository;
import com.example.demo.entity.Admins;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminsController {

    @Autowired
    AdminsRepository adminsRepository;

    //跳转到登录页
    @RequestMapping("/")
    public String index(){
        return "login";
    }
    //登录功能
    @PostMapping("/login")
    public String login(HttpServletRequest request, Model model){
        String adminsName = request.getParameter("userName");
        String passWord = request.getParameter("passWord");
        List<Admins> adminsList = adminsRepository.findByNameAndPassword(adminsName,passWord);
        if(!adminsList.isEmpty()) {
            HttpSession session = request.getSession(true);
            session.setAttribute("name",adminsName);
           return "first1";
        } else {
            String error = "用户名或密码错误";
            model.addAttribute("error",error);
            return "login";
        }
    }
}
