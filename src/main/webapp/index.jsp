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
    以/开始绝对路径，找资源，以服务器的路径为标准（http://localhost:3306）;需要加上项目名
    http://localhost:3306/SSM-GUIGU
    --%>

    <!--引入jquery-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.0.js"></script>
    <!--引入bootStrap样式-->
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</head>
<body>
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
            <button class="btn btn-primary btn-sm"> 新增</button>
            <button class="btn btn-danger btn-sm"> 删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
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
        //1、页面加载完成以后，直接去发送ajax请求，要到分页数据
        $(
            function(){
                $.ajax({
                    url:"${APP_PATH}/emps",
                    data:"pn=1",
                    type:"get",
                    success:function(result){
                        // console.log(result);

                        //解析显示员工信息
                        build_emps_table(result);
                        //解析显示分页信息
                        build_page_info(result);
                        //解释显示分页条
                        build_page_nav(result);
                    }
                });
            });

        //解析显示员工数据
        function build_emps_table(result){
            var emps = result.extend.pageInfo.list;
            $.each(emps,function(index,item){
                var empIdTd=$("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empName);
                var genderId=$("<td></td>").append(item.gender==1?"男":"女");

                var emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.department.deptName);
                /**
                 *   <button class=""><span class="" aria-hidden="true"></span>&nbsp;编辑</button>
                 * @type {*|jQuery}
                 */
                var editBtn = $("<button></button>").addClass("btn btn-primary")
                    .append($("<span></span>")
                        .addClass("glyphicon glyphicon-pencil"))
                    .append("编辑");
                var deleteBtn = $("<button></button>").addClass("btn btn-danger")
                    .append($("<span></span>")
                        .addClass("glyphicon glyphicon-trash"))
                    .append("删除");
                var td = $("<td></td>").append(editBtn).append("&nbsp;").append(deleteBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(empIdTd)
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
            $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum
                +"页，总共"
                +result.extend.pageInfo.pages
                +"页，总共"
                +result.extend.pageInfo.total
                +"条记录");
        }




        //解析显示分页条,点击分页条要有相应的动作……
        function build_page_nav(result){
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            //添加首页和前一页
            ul.append(firstPageLi).append(prePageLi);

            //1,2,3....遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                ul.append(numLi);
            });

            //添加下一页和末页的提示
            ul.append(lastPageLi).append(nextPageLi);
            //把ul加入到nav中
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }
    </script>
</body>
</html>
