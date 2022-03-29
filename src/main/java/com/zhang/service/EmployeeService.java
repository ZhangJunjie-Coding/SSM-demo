package com.zhang.service;

import com.zhang.bean.Employee;
import com.zhang.bean.EmployeeExample;
import com.zhang.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    /*
    * 查询所有员工
    * */
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    /*
    * 员工保存
    * */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /*
    * 检查用户名是否可用
    * true：代表可用
    * false:代表不可用
    * */
    public boolean checkuser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);
        return count == 0;
    }

    /*
    * 按照员工id查询员工
    * */
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //根据id删除员工信息
    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in (1,2,3)
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
