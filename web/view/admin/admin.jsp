<%@ page import="entity.User" %>
<%@ page import="java.util.List" %><%--
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
    <title>Title</title>
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
                <li><a href="/dean.level">成绩管理</a></li>
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
                        <h1 class="col-md-5">用户名单管理</h1>
                        <form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;"
                              action="query.do" id="form1" method="post">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入关键字" name="findByName">
                                <span class="input-group-addon btn" id="sub">搜索</span>
                            </div>
                        </form>
                        <button class="btn btn-default col-md-2" style="margin-top: 20px"
                                onClick="location.href='/view/admin/adduser.jsp'">
                            添加用户信息
                            <sapn class="glyphicon glyphicon-plus"/>
                        </button>

                    </div>
                </div>
                <%
                    List<User> users = (List<User>)request.getAttribute("users");
                    if(users != null && users.size() > 0){
                %>
                <table class="table table-bordered">
                    <tr>
                        <th>学号</th>
                        <th>密码</th>
                        <th>姓名</th>
                        <th>身份</th>
                        <th>找回密码凭据</th>
                        <th>最近登录时间</th>
                        <th>最近修改密码时间</th>
                        <th>操作</th>
                    </tr>
                    <%
                        for(User user : users){
                    %>

                    <tr>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getPassword() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getIdentity() %></td>
                        <td><%= user.getFindMMproof() %></td>
                        <td><%= user.getLogin_last_time() %></td>
                        <td><%= user.getPassword_last_changed() %></td>
                        <td>
                            <a href="edit.do?username=<%= user.getUsername()%>">修改</a>/
                            <a href="delete.do?username=<%=user.getUsername()%>" class="delete">删除</a>
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
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $("#nav li:nth-child(3)").addClass("active");
</script>
</body>

</html>
