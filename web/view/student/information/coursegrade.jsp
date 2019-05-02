<%@ page import="entity.student.StudentBasicInformation" %>
<%@ page import="entity.student.StudentGrade" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/11
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>课程成绩</title>
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
                <h1 style="text-align: center;">课程成绩</h1>
            </div>
        </div>
        <div class="panel-body">
            <div class="col-md-2"></div>
            <table border="2" cellpadding="0" cellspacing="0">
                <tr>
                    <th>学年学期</th>
                    <th>学号</th>
                    <th>学生姓名</th>
                    <th>课程编号</th>
                    <th>课程名称</th>
                    <th>成绩</th>
                    <th>绩点</th>
                    <th>学分</th>
                    <th>课程大类</th>
                    <th>修读方式</th>
                    <th>考试性质</th>
                    <th>成绩方式</th>
                    <th>有效</th>
                    <th>备注</th>
                </tr>
                <%
                    List<StudentGrade> studentGrades = (List<StudentGrade>)session.getAttribute("studentGrades");

                %>
                <%
                    for(StudentGrade student : studentGrades){

                %>
                <tr>
                    <td><%= student.getYearTerm()%></td>
                    <td><%= student.getStudentId()%></td>
                    <td><%= student.getStudentName()%></td>
                    <td><%= student.getCourseId()%></td>
                    <td><%= student.getCourseName()%></td>
                    <td><%= student.getScore() %></td>
                    <td><%= student.getGradePoint() %></td>
                    <td><%= student.getCredit() %></td>
                    <td><%= student.getCourseClass() %></td>
                    <td><%= student.getStudyWay() %></td>
                    <td><%= student.getExamWay() %></td>
                    <td><%= student.getGradeWay() %></td>
                    <td><%= student.getEffectivity() %></td>
                    <td><%= student.getRemarks() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

    </div>

</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
