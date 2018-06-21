package com.ecjtu.service.impl;

import com.ecjtu.dao.IStudentDAO;
import com.ecjtu.entity.Student;
import com.ecjtu.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("studentService")
public class StudentServiceImpl implements IStudentService {

    @Resource(name = "studentDao")
    private IStudentDAO studentDao;


    @Override
    public List<Student> findAll() {
        return studentDao.findAll();
    }

    @Override
    public Student findByName(String name) {
        return studentDao.findByName(name);
    }

    @Override
    public Student selectStudent(Student student) {
        return studentDao.selectStudent(student);
    }

    @Override
    public List<Student> selectClazzByStudent(String id) {
        return studentDao.selectClazzByStudent(id);
    }

    @Override
    public int insert(Student student) {
        return studentDao.insert(student);
    }

    @Override
    public int update(Student student) {
        return studentDao.update(student);
    }

    @Override
    public int delete(String id) {
        return studentDao.delete(id);
    }

    @Override
    public List<Student> findByPage(Map map) {
        return studentDao.findByPage(map);
    }

    @Override
    public Student getMe(String id) {
        return studentDao.getMe(id);
    }

    @Override
    public int getRowsCount(Map map) {
        return studentDao.getRowsCount(map);
    }

    public boolean doLogin(String name, String pwd){
        Student student = new Student();
        student.setName(name);
        student.setPassword(pwd);
        return studentDao.selectStudent(student) == null?false:true;
    }

}
