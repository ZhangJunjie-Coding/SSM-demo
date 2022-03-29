package com.zhang.service;

import com.zhang.bean.Department;
import com.zhang.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        return departmentMapper.selectByExample(null);
    }
}
