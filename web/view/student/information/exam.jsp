<%@ page import="entity.ExamArrange" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/11
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>考试安排</title>
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
            <a class="navbar-brand" href="/studentInquireServlet">教务管理系统</a>
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
                        <li><a href="/studentInquireServlet">个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/logoutServlet">注销</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!--主体-->
<div class="col-md-1"></div>
<div class="col-md-10">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <h1 style="text-align: center;">考试安排</h1>
            </div>
        </div>
        <div class="panel-body">
            <div class="col-md-10"></div>
            <form action="<%=request.getContextPath()%>/examArrangeServlet"  method="post">
                <div>
                    学年学期:
                    <select name="yearTerm">
                        <option value=""></option>
                        <option value="2017秋季">2017秋季</option>
                        <option value="2017春季">2017春季</option>
                        <option value="2016秋季">2016秋季</option>
                        <option value="2016春季">2016春季</option>
                    </select>
                    <input type="submit" value="查询"/>
                </div>
            </form>
            <c:if test="${sessionScope.examArranges != null }">
                <div class="col-md-2"></div>
                <table border="2" cellpadding="0" cellspacing="0">
                    <tr>
                        <th>学年学期</th>
                        <th>学号</th>
                        <th>学生姓名</th>
                        <th>考试课程</th>
                        <th>考试形式</th>
                        <th>考试日期</th>
                        <th>考试时间</th>
                        <th>考试周次</th>
                        <th>考试校区</th>
                        <th>考试地点</th>
                        <th>考试座位号</th>
                    </tr>
                    <%
                        List<ExamArrange> examArranges = (List<ExamArrange>)session.getAttribute("examArranges");
                        session.removeAttribute("examArranges");
                    %>
                    <%
                        for(ExamArrange examArrange : examArranges){

                    %>
                    <tr>
                        <td><%= examArrange.getYearTerm()%></td>
                        <td><%= examArrange.getStudentId()%></td>
                        <td><%= examArrange.getStudentName()%></td>
                        <td><%= examArrange.getExamCourse()%></td>
                        <td><%= examArrange.getExamWay()%></td>
                        <td><%= examArrange.getExamDate() %></td>
                        <td><%= examArrange.getExamTime() %></td>
                        <td><%= examArrange.getExamWeek() %></td>
                        <td><%= examArrange.getExamCampus() %></td>
                        <td><%= examArrange.getExamplace() %></td>
                        <td><%= examArrange.getExamSeatNum() %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </c:if>
        </div>

    </div>

</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
