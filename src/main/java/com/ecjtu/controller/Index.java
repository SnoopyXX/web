package com.ecjtu.controller;

import com.ecjtu.entity.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller  //表示这个类是springmvc控制器
@RequestMapping("Hello")   //Hello 就找到这个类
public class Index {

//    通过类注解RequestMapping的值和方法上RequestMapping的值来
//    访问相应的方法
    @RequestMapping("/world")
    public String index(){
        return "/index_old.jsp";  //返回index.jsp页面
    }

    @RequestMapping(value = "/index",method = RequestMethod.POST)
    public String testModel(@RequestParam("username") String username,
                            @RequestParam("userpwd") String userpwd,
                            Model model){
        //key value
        model.addAttribute("username",username);
        model.addAttribute("password",userpwd);
        return "home";
    }

    @RequestMapping(value = "/index_2/Student",
                    method = RequestMethod.POST)
    public ModelAndView testModelView(Student student){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",student);
        modelAndView.setViewName("home");
        return modelAndView;
    }
    @RequestMapping(value = "/index_3",method = RequestMethod.POST)
    @ResponseBody
    public String test(){
        return "success";  //out.print("success");
    }
}
