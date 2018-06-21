package com.ecjtu.controller;

import com.ecjtu.entity.Student;
import com.ecjtu.service.impl.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/stu")
public class StuController {

    public String getStu(@RequestParam("name") String name,
                         @RequestParam("password") String pwd,
                         Model model){

        if(new StudentServiceImpl().doLogin(name,pwd)){
            List<Student> list = new StudentServiceImpl().findAll();
            model.addAttribute("stulist",list);
            //请求转发
            return "second";
        }else{
            //重定向
            return "index";
        }
    }

}
