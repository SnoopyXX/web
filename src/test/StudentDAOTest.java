import com.ecjtu.dao.IStudentDAO;
import com.ecjtu.entity.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-dataSource.xml"})
public class StudentDAOTest {

    /*
        把studao这个接口的对象值注入到dao里面
     */
    @Resource(name = "studentDao")
    private IStudentDAO dao;

    @Test
    public void findAll(){
        List<Student> studentList = dao.findAll();
        for (Student s:studentList
                ) {
            System.out.println(s.toString());
        }
    }

    @Test
    public void find(){
        Student student= dao.getMe("99");
        System.out.println(student.toString());
    }


    @Test
    public void findStudent(){
        List<Student> list = dao.selectClazzByStudent("12");
        for (Student s:list
             ) {
            System.out.println(s.toString());
        }
    }

    @Test
    public void save(){
        Student s = new Student();
        s.setId("99");
        s.setName("wl");
        s.setBirtday(new Date());
        s.setSex("男");
        s.setPassword("123");
        int i = dao.insert(s);
        System.out.println(i);
    }

    @Test
    public void update(){
        Student s = new Student();
        s.setId("99");
        s.setName("wl");
        s.setBirtday(new Date());
        s.setSex("男");
        s.setPassword("999");
        int i = dao.update(s);
        System.out.println(i);
    }

    @Test
    public void del(){
        int i = dao.delete("9999");
        System.out.println();
    }

    @Test
    public void findByPage(){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",0);
        map.put("limit",5);
        map.put("name","");
        List<Student> list = dao.findByPage(map);
        System.out.println(list);
    }

    @Test
    public void findView(){
        List<Student> list = dao.selectview();
        for (Student s:list
             ) {
            System.out.println(s.toString());
        }
    }

    @Test
    public void findCourse(){
        List<Student> list = dao.findCourse();
        for (Student s:list
                ) {
            System.out.println(s.toString());
        }
    }
}
