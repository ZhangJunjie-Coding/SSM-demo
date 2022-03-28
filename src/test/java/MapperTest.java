import com.zhang.bean.Department;
import com.zhang.bean.Employee;
import com.zhang.dao.DepartmentMapper;
import com.zhang.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void  test(){
        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department(null,"运营部"));
//        departmentMapper.insertSelective(new Department(null,"教学部"));
//        employeeMapper.insertSelective(new Employee(null,"zhangjunjie", (byte) 1,"2298@qq.com",1));

        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0 ;i< 1000 ;i++){
            String uid = UUID.randomUUID().toString().substring(0,6);
            employeeMapper.insertSelective(new Employee(null,uid,(byte)(i%2==0?1:2),uid+"@qq.com",1));
        }
        System.out.println("批量插入成功");
    }
}
