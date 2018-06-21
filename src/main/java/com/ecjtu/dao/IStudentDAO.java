package com.ecjtu.dao;

import com.ecjtu.entity.Student;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

//声明所有的数据操作方法
@Repository("studentDao")
public interface IStudentDAO {

    //全查
    public List<Student> findAll();

    public List<Student> selectview();

    public Student findByName(String name);

    public Student selectStudent(Student student);

    public List<Student> selectClazzByStudent(String id);

    public int insert(Student student);

    public int update(Student student);

    public int delete(String id);

    public List<Student> findByPage(Map map);

    Student getMe(String id);

    int getRowsCount(Map map);
    public List<Student> findCourse();
}
