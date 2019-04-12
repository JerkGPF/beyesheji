<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>密码修改</title>
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
<div class="col-md-2"></div>
<div class="col-md-8">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <h1 style="text-align: center;">密码修改</h1>
            </div>
        </div>

        <div>
            <% String tokenValue = new Date().getTime() +""; %>
            <c:set value="<%=tokenValue %>" var="token" scope="session"/>
        </div>

        <div class="panel-body">
            <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/modifyPasswordServlet"
                  id="editfrom"
                  method="post" onsubmit="return check()">
                <div>
                    ${sessionScope.message }
                    <%session.removeAttribute("message"); %>
                </div>
                <div>
                    <input type="hidden" name="token" value="<%=tokenValue %>"/>
                </div>

                <div class="form-group">
                    <label for="oldpassword" class="col-sm-2 control-label">旧密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="oldpassword" id="oldpassword"
                               placeholder="请输入旧密码" value="">
                    </div>
                </div>

                <div class="form-group">
                    <label for="newpassword" class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="newpassword" id="newpassword"
                               placeholder="请输入新密码" value="">
                    </div>
                </div>

                <div class="form-group">
                    <label for="confirmpassword" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="confirmpassword" id="confirmpassword"
                               placeholder="请再一次输入密码" value="">
                    </div>
                </div>

                <div class="form-group" style="text-align: center">
                    <button class="btn btn-default" type="submit">提交</button>
                    <button class="btn btn-default" type="reset">重置</button>
                </div>
            </form>
        </div>

    </div>

</div>
<%--设置菜单中--%>

<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js">$("#nav li:nth-child(3)").addClass("active")</script>
</body>
</html>

