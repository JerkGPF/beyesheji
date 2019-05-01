<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/11
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="entity.CourseScheduleShow" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>课表查询</title>
    <style>
        body{
            padding-top: 70px;
        }
    </style>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
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
<div class="col-md-2"></div>
<div class="col-md-8">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <h1 style="text-align: center;">课表查询</h1>
            </div>
        </div>
        <div>
            <font color="RED">${requestScope.message }</font>
        </div>
        <div class="panel-body">
            <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/courseScheduleServlet" method="post">
                <div>
                    学年学期:
                    <select name="yearTerm">
                        <option value=""></option>
                        <option value="2017秋季">2017秋季</option>
                        <option value="2017春季">2017春季</option>
                        <option value="2016秋季">2016秋季</option>
                        <option value="2016春季">2016春季</option>
                    </select>

                    周次：
                    <select name="week">
                        <option value=""></option>
                        <option value="第1周">第1周</option>
                        <option value="第2周">第2周</option>
                        <option value="第3周">第3周</option>
                        <option value="第4周">第4周</option>
                        <option value="第5周">第5周</option>
                        <option value="第6周">第6周</option>
                        <option value="第7周">第7周</option>
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                        <option value="第13周">第13周</option>
                        <option value="第14周">第14周</option>
                        <option value="第15周">第15周</option>
                        <option value="第16周">第16周</option>
                        <option value="第17周">第17周</option>
                        <option value="第18周">第18周</option>
                        <option value="第19周">第19周</option>
                        <option value="第20周">第20周</option>
                    </select>
                    <input type="submit" value="查询"/>
                </div>

            </form>
            <c:if test="${sessionScope.courseScheduleShows != null }">
                <table border="2" cellpadding="0" cellspacing="0">
                    <tr>
                        <th height="50px"></th>
                        <th height="50px">星期一</th>
                        <th height="50px">星期二</th>
                        <th height="50px">星期三</th>
                        <th height="50px">星期四</th>
                        <th height="50px">星期五</th>
                        <th height="50px">星期六</th>
                        <th height="50px">星期日</th>
                    </tr>
                    <%
                        List<CourseScheduleShow> courseScheduleShows = (List<CourseScheduleShow>)session.getAttribute("courseScheduleShows");
                        session.removeAttribute("courseScheduleShows");
                        for(CourseScheduleShow courseScheduleShow : courseScheduleShows){
                    %>
                    <tr>
                        <td align="center" height="100px" width="100px"><%=courseScheduleShow.getJoint() %></td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getMonday() != null){
                            %>
                            <%=courseScheduleShow.getMonday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getMonday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getMonday().getClassplace() %>
                            <%
                                }
                            %>

                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getTuesday() != null){
                            %>
                            <%=courseScheduleShow.getTuesday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getTuesday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getTuesday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getWesneday() != null){
                            %>
                            <%=courseScheduleShow.getWesneday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getWesneday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getWesneday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getThursday() != null){
                            %>
                            <%=courseScheduleShow.getThursday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getThursday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getThursday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getFriday() != null){
                            %>
                            <%=courseScheduleShow.getFriday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getFriday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getFriday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getSaturday() != null){
                            %>
                            <%=courseScheduleShow.getSaturday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getSaturday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getSaturday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
                        <td height="100px" width="150px">
                            <%
                                if(courseScheduleShow.getSunday() != null){
                            %>
                            <%=courseScheduleShow.getSunday().getCourse() %>
                            <br>
                            <%=courseScheduleShow.getSunday().getTeacher() %>
                            <br>
                            <%=courseScheduleShow.getSunday().getClassplace() %>
                            <%
                                }
                            %>
                        </td>
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
