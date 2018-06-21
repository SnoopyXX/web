import com.ecjtu.entity.Student;
import com.ecjtu.service.impl.StudentServiceImpl;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-dataSource.xml"})
public class StudentServiceImplTest {

    @Resource(name = "studentService")
    private StudentServiceImpl studentService;

    @org.junit.Test
    public void get(){
        List<Student> studentList = studentService.findAll();
        for (Student s:studentList
             ) {
            System.out.println(s.toString());
        }
    }

    @org.junit.Test
    public void login(){
        System.out.println(studentService.doLogin("222","123"));
    }
}
