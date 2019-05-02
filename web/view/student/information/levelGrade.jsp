<%@ page import="entity.student.StudentBasicInformation" %>
<%@ page import="entity.student.LevelExamination" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/11
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考级查询</title>
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
                <h1 style="text-align: center;">考级查询</h1>
            </div>
        </div>
        <div class="panel-body">
            <div class="col-md-1"></div>
            <table border="2" cellpadding="0" cellspacing="0">
                <tr>
                    <th>学年学期</th>
                    <th>学号</th>
                    <th>学生姓名</th>
                    <th>考级课程</th>
                    <th>考级时间</th>
                    <th>总成绩</th>
                    <th>学生院系</th>
                    <th>班级名称</th>
                    <th>专业</th>
                    <th>准考证号</th>
                    <th>听力成绩</th>
                    <th>阅读成绩</th>
                    <th>写作成绩</th>
                    <th>口语成绩</th>
                </tr>
                <%
                    StudentBasicInformation student = (StudentBasicInformation)session.getAttribute("student");
                    List<LevelExamination> levelExamination = (List<LevelExamination>)session.getAttribute("levelExamination");
                %>
                <%
                    for(LevelExamination stu : levelExamination){

                %>
                <tr>
                    <td><%= stu.getYearTerm()%></td>
                    <td><%= stu.getStudentId()%></td>
                    <td><%= student.getStudentName()%></td>
                    <td><%= stu.getLevelEaxmCourse()%></td>
                    <td><%= stu.getEaxmTime()%></td>
                    <td><%= stu.getGrade() %></td>
                    <td><%= student.getAcademy() %></td>
                    <td><%= student.getClassName() %></td>
                    <td><%= student.getProfession() %></td>
                    <td><%= stu.getExamId() %></td>
                    <td><%= stu.getListenGrade() %></td>
                    <td><%= stu.getReadingGrade() %></td>
                    <td><%= stu.getWritingGrade() %></td>
                    <td><%= stu.getSpokenGrade() %></td>
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
