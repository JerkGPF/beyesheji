<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.student.OptionalCourse" %>
<%@ page import="java.util.Map" %>
<%@ page import="entity.student.StudentGrade" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/5/9
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>成绩录入</title>
        <style>
            body{
                padding-top: 70px;
            }
        </style>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
    </head>
<body>

<!--导航栏-->
<nav class="navbar navbar-default navbar-fixed-top  " role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/teacherInquireServlet">教务管理系统</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.name },您好！ <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/teacherInquireServlet">个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/logoutServlet">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--侧边栏-->
<div class="container " id="content">
    <div class="row">
        <div class="col-md-2 ">
            <ul class="nav nav-pills nav-stacked" id="nav">
                <li><a href="/teacherInquireServlet">个人信息</a></li>
                <li><a href="/view/teacher/information/courseinformation.jsp">课程信息</a></li>
                <li><a href="#">成绩录入</a></li>
                <li><a href="<%=request.getContextPath()%>/view/student/modify/modifypassword.jsp">账号密码重置
                    <sapn class="glyphicon glyphicon-repeat pull-right"/>
                </a></li>
                <li><a href="/logoutServlet">退出系统
                    <sapn class="glyphicon glyphicon-log-out pull-right"/>
                </a></li>
            </ul>
        </div>
        <!--主体-->
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 class="col-md-5">学生成绩录入</h1>
                    </div>
                </div>
                <%
                    List<Course> courses = (List<Course>)request.getAttribute("courses");
                    if(courses != null && courses.size() > 0){
                %>
                <table class="table table-bordered">
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>课程编号</th>
                        <th>课程名称</th>
                        <th>分数</th>
                        <th>操作</th>
                    </tr>
                    <%
                        for(Course course : courses){
                    %>
                    <tr>
                        <td><%= course.getStudentId() %></td>
                        <td><%= course.getStudentName() %></td>
                        <td><%= course.getCourseId() %></td>
                        <td><%= course.getCourseName() %></td>
                        <td><%= course.getScore() %></td>
                        <td>
                            <a href="edit.do?username=<%= course.getStudentId()%>">修改</a>/
                            <a href="delete.do?username=<%=course.getStudentId()%>" class="delete">录入</a>
                        </td>
                    </tr>

                    <%
                        }
                    %>
                </table>
                <%
                    }
                %>
                <div class="panel-footer">
                </div>
            </div>

        </div>

    </div>
</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
    <%--设置菜单中--%>
    $("#nav li:nth-child(3)").addClass("active")

</script>
</body>
</html>
