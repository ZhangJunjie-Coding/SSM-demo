package com.zhang.controller;


import com.zhang.bean.Department;
import com.zhang.bean.Msg;
import com.zhang.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理和部门有关的请求
 */
@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getDepts();
        return  Msg.success().add("depts",list);
    }
}
