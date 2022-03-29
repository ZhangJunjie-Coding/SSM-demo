<%--
  Created by IntelliJ IDEA.
  User: 俊杰
  Date: 3/27/2022
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--
    web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
    以/开始绝对路径，找资源，以服务器的路径为标准（http://localhost:3306）;

    需要加上项目名http://localhost:3306/SSM-GUIGU
    --%>

    <!--引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.0.js"></script>
    <!--引入bootStrap样式-->
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</head>
<body>
<!--员工修改的模态框-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工信息修改</h4>
            </div>
            <div class="modal-body">
                <!--=====================================-->
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_update_input" placeholder="zhangjunjie@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="2"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--提交部门id即可-->
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<!--=====================================-->







<!--员工添加的模态框-->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <!--=====================================-->
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                    <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" id="email_add_input" placeholder="zhangjunjie@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="2"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--提交部门id即可-->
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--=====================================-->


<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-sm" id="emp_add_modal_btn"> 新增</button>
            <button class="btn btn-danger btn-sm" id="emp_delete_all_btn"> 删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
                <th><input type="checkbox" id="chekc_all"/></th>
                <th>#</th>
                <th>empName</th>
                <th>gender</th>
                <th>email</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>

    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">

        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
    <script type="text/javascript">
        var totalRecord,currentPage;
        //1、页面加载完成以后，直接去发送ajax请求，要到分页数据
        $(function(){
             //去首页
            to_page(1);
            });


        function to_page(pn){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function(result){
                    //解析显示员工信息
                    build_emps_table(result);
                    //解析显示分页信息
                    build_page_info(result);
                    //解释显示分页条
                    build_page_nav(result);
                }
            });
        }

        //解析显示员工数据
        function build_emps_table(result){
            totalRecord = result.extend.pageInfo.total;
            currentPage = result.extend.pageInfo.pageNum;
            //翻页的时候需要清空原来表格的数据，不然就会在原来数据的基础上进行追加
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps,function(index,item){
                var checkBoxTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empName);
                var genderId=$("<td></td>").append(item.gender==1?"男":"女");

                var emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.department.deptName);
                /**
                 *   <button class=""><span class="" aria-hidden="true"></span>&nbsp;编辑</button>
                 * @type {*|jQuery}
                 */
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>")
                        .addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",item.empId);
                var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append($("<span></span>")
                        .addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                //为删除按钮添加一个自定义的属性，用来表示要删除员工的id
                deleteBtn.attr("del-id",item.empId);
                var td = $("<td></td>").append(editBtn).append("&nbsp;").append(deleteBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>")
                    .append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderId)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(td)
                    .appendTo("#emps_table tbody");
            });
        }

        //解析显示分页信息
        function build_page_info(result){
            $("#page_info_area").empty();
            $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum
                +"页，总共"
                +result.extend.pageInfo.pages
                +"页，总共"
                +result.extend.pageInfo.total
                +"条记录");
        }




        //解析显示分页条,点击分页条要有相应的动作……
        function build_page_nav(result){
           $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.pageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else{
                firstPageLi.click(function (){
                    console.log("test");
                    to_page(1);
                });
                prePageLi.click(function (){
                    console.log("test");
                    to_page(result.extend.pageInfo.pageNum-1)
                })
            }



            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            if(result.extend.pageInfo.hasNextPage == false){
                lastPageLi.addClass("disabled");
                nextPageLi.addClass("disabled");
            }else{
                lastPageLi.click(function(){
                    console.log("test");
                    to_page(result.extend.pageInfo.pages);
                });
                nextPageLi.click(function(){
                    console.log("test");
                    to_page(result.extend.pageInfo.pageNum+1);
                });
            }





            //添加首页和前一页
            ul.append(firstPageLi).append(prePageLi);

            //1,2,3....遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                //绑定异步请求
                numLi.click(function(){
                    to_page(item);
                })
                ul.append(numLi);
            });

            //添加下一页和末页的提示
            ul.append(lastPageLi).append(nextPageLi);
            //把ul加入到nav中
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }

            //清空表单样式及内容
            function reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }


            //点击新增按钮弹出模态框。
        $("#emp_add_modal_btn").click(function(){
            //清除表单数据（表单重置(表单的数据，表单的样式)）
            reset_form("#empAddModal form");
            // $("#empAddModal form")[0].reset();
            //发出ajax请求，查出部门信息，显示在下拉列表中
                getDepts("#dept_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:'static'
            });
        });


        //查出所有部门信息并显示在下拉列表中
        function getDepts(ele){
            $.ajax({
                url:"${APP_PATH}/depts",
                type: "GET",
                async:false,
                success:function(result){
                    var depts = result.extend.depts;

                    //解决点击新增按钮时，重复添加部门信息的问题
                    $(ele).empty();

                    $.each(depts,function(index,item){
                        var option = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                        option.appendTo(ele);
                    });
                }
            });
        }



        //校验表单数据
        function validate_add_form(){
            //校验用户名
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                // alert("用户名可以是2-5位汉字或者6-16位英文字母的组合");

                show_validate_msg("#empName_add_input","error","用户名可以是2-5位汉字或者6-16位英文字母的组合");

               return false;
            }else{
                // $("#empName_add_input").parent().addClass("has-success");
                // $("#empName_add_input").next("span").text("");

                show_validate_msg("#empName_add_input","success","");
            }
            //校验Email
            var email =$("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                // alert("邮箱不正确");
                show_validate_msg("#email_add_input","error","邮箱不正确");
                return false;
            }else{
                // $("#email_add_input").parent().addClass("has-success");
                // $("#email_add_input").next("span").text("");
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }

        //把校验结果代码提取出来，显示校验结果的提示信息

        function show_validate_msg(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("")
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"== status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        $("#empName_add_input").change(function(){
            //发送ajax请求校验用户名是否可用
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+empName,
                type:"POST",
                success:function(result){
                   if(result.code==100){
                       show_validate_msg("#empName_add_input","success","用户名可用");
                       $("#emp_save_btn").attr("ajax","success");

                   }else{
                       show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                       $("#emp_save_btn").attr("ajax","fail");
                   }
            }
            })
        });
        //点击保存，保存员工
        $("#emp_save_btn").click(function(){
                //1、模态框中填写的表单数据提交给服务器进行保存
                //先对要提交给服务器的数据进行校验
                if(!validate_add_form()){
                    return false;
                };
                if($(this).attr("ajax")=="fail"){
                    console.log($(this));
                    console.log(this);
                    return false;
                }
                //2、发送ajax请求保存员工
                $.ajax({
                    url:"${APP_PATH}/emp",
                    type:"POST",
                    data:$("#empAddModal form").serialize(),
                    success:function (result){
                        // alert(result.msg);
                        if(result.code == 100){
                            //关闭模态框
                            $("#empAddModal").modal('hide');
                            //跳转到最后一页，显示刚刚插入的数据,发送ajax请求显示最后一页数据即可
                            //当给pagehelper传入一个大于总页数的数字时，返回最后一页
                            to_page(totalRecord);
                        }else{
                            //显示失败信息
                            // console.log(result);
                            //有那个字段的错误信息就显示那个字段的
                            if(undefined != result.extend.errorFields.email){
                                //显示邮箱错误信息
                                show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                            }
                            if(undefined != result.extend.errorFields.empName){
                                //显示员工名字的错误信息
                                show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                            }
                        }

                    }
                });
        });
        /*
        * 我们按钮创建之前就绑定了click，所以绑定不上
        * 可以在创建按钮的时候绑定。绑定点击.live()
        * jQuery新版没有live，使用on进行替代
        * */
        $(document).on("click",".edit_btn",function(){
            // alert("edit");
            //1、查出部门信息，并显示部门列表
            getDepts("#dept_update_select");
            //2、查出员工信息，显示员工信息
            getEmp($(this).attr("edit-id"));
            //3、把员工的id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#empUpdateModal").modal({
                backdrop: "static"
            });
        });

        //单个删除
        $(document).on("click",".delete_btn",function(){
            //弹出是否确认删除对话框
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var empId = $(this).attr("del-id");
            // alert($(this).parents("tr").find("td:eq(1)").text());
            if(confirm("确认删除【"+empName+"】吗?")){
                    $.ajax({
                        url:"${APP_PATH}/emp/"+empId,
                        type:"DELETE",
                        success:function (result){
                            alert(result.msg);
                            //回到本页
                           to_page(currentPage);
                        }
                    })
            }else{

            }
        });

        function getEmp(id){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:'GET',
                success:function(result){
                    // console.log(result);
                    var empData = result.extend.emp;
                    $("#empName_update_static").text(empData.empName);
                    $("#email_update_input").val(empData.email);
                    $("#empUpdateModal input[name=gender]").val([empData.gender]);
                    $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }
        $("#emp_update_btn").click(function(){
            //校验Email
            var email =$("#email_update_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if(!regEmail.test(email)){
                show_validate_msg("#email_update_input","error","邮箱不正确");
                return false;
            }else{
                show_validate_msg("#email_update_input","success","");
            }
            //2、发送ajax请求保存更新的员工数据
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function (result){
                    // alert(result.msg);
                    $("#empUpdateModal").modal("hide");
                    to_page(currentPage);
                }

            })
        })
        //完成全选/全不选功能
        $("#chekc_all").click(function (){
            //attr获取checked是undefined;
            //我们这些dom原生的属性：attr获取自定义属性的值
            //prop修改和读取dom原生属性的值
            $(this).prop("checked");
            $(".check_item").prop("checked",$(this).prop("checked"));
            // console.log($(".check_item"));
        })
        $(document).on("click",".check_item",function (){
            //判断当前选择中的元素是否与元素的个数相等
            var flag = $(".check_item:checked").length==$(".check_item").length;
            $("#chekc_all").prop("checked",flag);
        });

        //点击全部删除，就批量删除
        $("#emp_delete_all_btn").click(function (){
            var empNames = "";
            var del_idstr = "";
            $.each($(".check_item:checked"),function (){
                //this
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //去除多于的,
            empNames=empNames.substring(0,empNames.length-1);
            //去除多于的"-"
            del_idstr=del_idstr.substring(0,del_idstr.length-1);
            if(confirm("确认删除【"+empNames+"】吗?")){
                //发送ajax请求
                $.ajax({
                    url:"${APP_PATH}/emp/"+del_idstr,
                    type:"DELETE",
                    success:function (result){
                        alert(result.msg);
                        //回到当前页面
                        to_page(currentPage);
                    }
                })
            }
        });

    </script>
</body>
</html>
