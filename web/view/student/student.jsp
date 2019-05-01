<%@ page import="entity.OptionalCourse" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/3/25
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>选修课报名</title>
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
<!--侧边栏-->
<div class="container " id="content">
    <div class="row">
        <div class="col-md-2 ">
            <ul class="nav nav-pills nav-stacked" id="nav">
                <li><a href="/studentInquireServlet">信息查询</a></li>
                <li><a href="/view/student/student.jsp">课程管理</a></li>
                <li><a href="/view/student/management/delayapply.jsp">缓考申请</a> </li>
                <li><a href="/view/student/management/freeapply.jsp">免修申请</a> </li>
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
                        <h1 class="col-md-7">所有课程</h1>
                        <form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;"
                              action="<%=request.getContextPath()%>/queryOptionalCourse.optional" id="form1" method="post">
                            <div>
                                <font color="RED">${sessionScope.message }	</font>
                                <%session.removeAttribute("message"); %>
                            </div>
                            <table>
                                <tr>
                                    <td>学年学期:</td>
                                    <td>
                                        <select name="yearTerm" >
                                            <option value=""></option>
                                            <option value="2017秋季">2017秋季</option>
                                            <option value="2017春季">2017春季</option>
                                            <option value="2016秋季">2016秋季</option>
                                            <option value="2016春季">2016春季</option>
                                        </select>
                                    </td>
                                    <td>
                                        <div class="col-md-2"></div>
                                        <input type="submit" value="查询"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <br><br>
                    ${sessionScope.message }
                    <%session.removeAttribute("message"); %>
                    <c:if test="${sessionScope.map != null }">
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>学年学期</th>
                                    <th>课程编号</th>
                                    <th>课程名称</th>
                                    <th>学分</th>
                                    <th>课程类型</th>
                                    <th>任课老师</th>
                                    <th>上课方式</th>
                                    <th>上课时间</th>
                                    <th>是否已报名</th>
                                    <th>操作</th>
                                </tr></thead>
                                <%
                                    Map<OptionalCourse, String> map = (Map<OptionalCourse, String>)session.getAttribute("map");
                                    for(Map.Entry<OptionalCourse, String> entry : map.entrySet()){
                                %>
                                <tr>
                                    <td><%= entry.getKey().getYearTerm() %></td>
                                    <td><%= entry.getKey().getCourseId() %></td>
                                    <td><%= entry.getKey().getCourseName() %></td>
                                    <td><%= entry.getKey().getCredit() %></td>
                                    <td><%= entry.getKey().getCourseType() %></td>
                                    <td><%= entry.getKey().getTeacher() %></td>
                                    <td><%= entry.getKey().getClassWay() %></td>
                                    <td><%= entry.getKey().getClassTime() %></td>
                                    <td><%= entry.getValue() %></td>
                                    <td>
                                        <button class="btn btn-default btn-xs btn-info"
                                                onClick="location.href='<%=request.getContextPath()%>/studentApply.optional?courseId=<%= entry.getKey().getCourseId()%>'">选课
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </c:if>
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
    $("#nav li:nth-child(2)").addClass("active")

</script>
</body>

</html>
