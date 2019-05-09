<%@ page import="entity.student.StudentBasicInformation" %>
<%@ page import="entity.student.StudentGrade" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/5/3
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>总库查询</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            padding-top: 70px;
        }
    </style>
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
                <li><a href="/query.do">用户管理</a></li>
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
                        <h1 class="col-md-5">总库查询</h1>
                        <form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;"
                              action="<%=request.getContextPath()%>/deanQuery.grade" id="form1" method="post">
                            <div class="col-md-4"></div>
                            <table>
                                <tr>
                                    <td>学年学期:</td>
                                    <td>
                                        <select name="yearTerm" >
                                            <option value=""></option>
                                            <option value="2018秋季">2018秋季</option>
                                            <option value="2018春季">2018春季</option>
                                            <option value="2017秋季">2017秋季</option>
                                            <option value="2017春季">2017春季</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="submit" value="查询"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <c:if test="${sessionScope.map != null }">
                <div>
                    <table class="table table-bordered" >
                        <tr>
                            <th>学年学期</th>
                            <th>学号</th>
                            <th>学生姓名</th>
                            <th>学院</th>
                            <th>专业</th>
                            <th>班级</th>
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
                            Map<StudentBasicInformation,List<StudentGrade>> map =
                                    (Map<StudentBasicInformation,List<StudentGrade>>)session.getAttribute("map");
                            session.removeAttribute("map");
                        %>
                        <%
                            for(Map.Entry<StudentBasicInformation,List<StudentGrade>> entry : map.entrySet()){
                                StudentBasicInformation stu = entry.getKey();
                                List<StudentGrade> studentGrades = entry.getValue();
                                for(StudentGrade student : studentGrades){

                        %>
                        <tr>
                            <td><%= student.getYearTerm()%></td>
                            <td><%= student.getStudentId()%></td>
                            <td><%= student.getStudentName()%></td>
                            <td><%= stu.getAcademy()%></td>
                            <td><%= stu.getProfession()%></td>
                            <td><%= stu.getClassName()%></td>
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
                            }
                        %>
                    </table>
                    </c:if>

                    <div class="panel-footer">
                    </div>
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
                        <li><a href="<%=request.getContextPath()%>/deanQuery.grade">总库查询</a></li>
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
    <script src="/js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        <%--设置菜单中--%>
        $("#nav li:nth-child(2)").addClass("active")

    </script>
</div>
</body>
</html>

