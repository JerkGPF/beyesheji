<%@ page import="entity.student.StudentBasicInformation" %>
<%@ page import="entity.student.LevelExamination" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/5/3
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生考级成绩</title>
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
            <a class="navbar-brand" href="#">教务管理系统</a>
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
                        <li><a href="#">个人信息</a></li>
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
                <li><a href="/optStudent.List">课程管理</a></li>
                <li data-toggle="modal" data-target="#myModal"><a href="#">成绩管理</a></li>
                <li><a href="/query.do">用户管理</a> </li>
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
                        <h1 style="text-align: center;">学生考级成绩</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered">
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
                            Map<StudentBasicInformation,List<LevelExamination>> map = (Map<StudentBasicInformation,List<LevelExamination>>)session.getAttribute("map");
                        %>
                        <%
                            for(Map.Entry<StudentBasicInformation,List<LevelExamination>> entry : map.entrySet()){
                                StudentBasicInformation student = entry.getKey();
                                List<LevelExamination> levelExamination = entry.getValue();
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
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>

        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            信息查询
                        </h4>
                    </div>
                    <div class="modal-body">
                        <li><a href="<%=request.getContextPath()%>/gradeAnalysis.grade">统计分析</a></li>
                        <li><a href="/deanQuery.grade">总库查询</a></li>
                        <li><a href="<%=request.getContextPath()%>/levelExam.List">考级学生名单</a></li>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>

                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </div>
</div>
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
    <%--设置菜单中--%>
    $("#nav li:nth-child(2)").addClass("active")

</script>
</body>
</html>
