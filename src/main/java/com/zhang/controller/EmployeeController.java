package com.zhang.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhang.bean.Employee;
import com.zhang.bean.Msg;
import com.zhang.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
* 处理员工CRUD请求
* URI:
*
* /emp/{id} GET 查询员工
* /emp      POST 保存员工
* /emp/{id} PUT 修改员工
* /emp/{id} DELETE 删除员工
*
* */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    /**
     * 员工更新方法
     *
     * 如果直接发送ajax=PUT形式的请求
     * 封装的数据为：
     * Employee{empId=1, empName='null', gender=null, email='null', dId=null, department=null}
     * 问题：
     * 请求体中有数据；
     * 但是Employee对象封装不上
     * 最后sql拼接成  update tb_emp where emp_id = #{empId,jdbcType=INTEGER} 造成了错误
     *
     * 原因：
     * 由tomcat引起的：
     *      1、将请求体中的数据，封装一个map。
     *      2、request.getParameter("empName")就会从map中取值。
     *      3、SpringMVC封装POJO对象的时候。
     *                          会把POJO中每个属性的值,都封装为map，request.getParamter("email")
     *    AJAX发送PUT请求引发的问题：
     *          PUT请求，请求体重的数据，request.getParameter("empName")拿不到
     *          Tomcat一看是PUT类型的请求，就不会封装请求体中的数据为map，只有POST形式的请求才能封装请求体为map
     *
     *
     *   解决方案：
     *   我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
     *   1、配置上HttpPutFormContentFilter
     *   2、它的作用：将请求体中的数据解析包装成一个map
     *   3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee, HttpServletRequest request){
        System.out.println(request.getParameter("email"));
        System.out.println("将要更新的数据："+employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    //根据id查询员工信息
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
       Employee employee = employeeService.getEmp(id);
       return Msg.success().add("emp",employee);
    }




    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsJson(@RequestParam(value="pn",defaultValue = "1") Integer pn, Model model){
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询之前只需调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);

    }

    /*
    * 查询员工数据（分页查询）
    * */
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value="pn",defaultValue = "1") Integer pn, Model model){
         //这不是一个分页查询
         //引入PageHelper分页插件
         //在查询之前只需调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }


    /**
     *  员工保存
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validator依赖包
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = bindingResult.getFieldErrors();
            for(FieldError fieldError : errors){
                System.out.println("错误的字段名:"+fieldError.getField());
                System.out.println("错误的信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /**
     * 检查用户名是否可用
     *
     * */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(String empName){
        //先判断用户名是否是合法的表达式
        String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位数字和字母的组合或者是2-5位的汉字组合");
        }
        //数据库用户名重复校验
        if(employeeService.checkuser(empName)){
            return Msg.success();
        }
        return Msg.fail().add("va_msg","用户名不可用");
    }

    /**
     * 单个批量二和一
     * 批量删除：1-2-3
     * 单个删除：1
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg delEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<Integer>();
            String []empIds = ids.split("-");
           //组装id的集合
            for(String id : empIds){
                del_ids.add(Integer.parseInt(id));
            }
            employeeService.deleteBatch(del_ids);
        }else{
            int id = Integer.parseInt(ids);
            employeeService.deleteEmpById(id);
        }

        return Msg.success();
    }
}
