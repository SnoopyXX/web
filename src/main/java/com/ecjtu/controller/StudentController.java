package com.ecjtu.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ecjtu.entity.Student;
import com.ecjtu.service.impl.StudentServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Resource(name = "studentService")
    private StudentServiceImpl bll;

    @RequestMapping("/login")
    public String login(@RequestParam("name") String name,
                              @RequestParam("password") String password,
                              Model model){
        System.out.println(name + password);
        if(bll.doLogin(name,password)){
            return "redirect:/index";
        }else{
            //重定向
            return "/index_old.jsp";
        }
    }

    @RequestMapping("/index")
    public String showStudent(){
        return "studentManager";
    }

    @RequestMapping("/form")
    public String operate(){
        return "student";
    }

    @RequestMapping("/query")
    @ResponseBody
    public Object showAllStudent(@RequestBody Map<Object,Object> p){
        Map<String,Object> cond = new HashMap<String,Object>();
        JSONObject param = (JSONObject) JSONObject.toJSON(p);
        int start = param.getInteger("pageNumber") * param.getInteger("rowsCount");
        cond.put("name",param.getString("name"));
        cond.put("start",start);
        cond.put("limit",p.get("rowsCount"));
        List<Student> list = bll.findByPage(cond);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total",bll.getRowsCount(cond));
        map.put("rows",list);
        return JSONObject.parse(JSONArray.toJSONString(map));
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestBody Student student){
        System.out.println(student.toString());
            //将字符串转成Date 71行，78行
//            DateFormat df = new SimpleDateFormat("yyyy-MM-dd " +
//                    "HH:mm:ss");
            student.setId(UUID.randomUUID().toString().replace("-",""));
            int code = bll.insert(student);
            if (code > 0){
                return "success";
            }else{
                return "fail";
            }
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST,
            produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String edit(@RequestParam("id") String id){
        Student student = bll.getMe(id);
        //JSONArray fastJson alibaba
        System.out.println(JSONArray.toJSONString(student));
        //返回内容给页面
        return JSONArray.toJSONString(student);
    }

    @RequestMapping(value = "/doEdit",method = RequestMethod.POST)
    @ResponseBody
    public String doEdit(@RequestBody Student student){
        System.out.println(student.toString());
        int code = bll.update(student);
        if (code > 0){
            return "success";
        }else{
            return "fail";
        }
    }
    @RequestMapping(value = "/del",method = RequestMethod.POST)
    @ResponseBody
    public String del(@RequestParam("id") String id){
        int code = bll.delete(id);
        if (code > 0){
            return "success";
        }else{
            return "fail";
        }
    }
}
