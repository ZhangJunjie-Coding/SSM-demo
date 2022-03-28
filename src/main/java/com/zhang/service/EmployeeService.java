package com.zhang.service;

import com.zhang.bean.Employee;
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
}
