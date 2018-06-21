package com.ecjtu.service;

import com.ecjtu.entity.Student;

import java.util.List;
import java.util.Map;

public interface IStudentService {

    //全查
    public List<Student> findAll();

    public Student findByName(String name);

    public Student selectStudent(Student student);

    public List<Student> selectClazzByStudent(String id);

    public int insert(Student student);

    public int update(Student student);

    public int delete(String id);

    public List<Student> findByPage(Map map);

    Student getMe(String id);

    int getRowsCount(Map map);
    public boolean doLogin(String name,String pwd);
}
