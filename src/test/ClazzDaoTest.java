import com.ecjtu.dao.ClazzMapper;
import com.ecjtu.entity.Clazz;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-dataSource.xml"})
public class ClazzDaoTest {

    @Resource(name = "clazzDao")
    private ClazzMapper clazzMapper;

    @Test
    public void test(){
       List<Clazz>  list = clazzMapper.selectStudentByClazz();
        for (Clazz c:list
             ) {
            System.out.println(c.toString());
        }
    }
}
