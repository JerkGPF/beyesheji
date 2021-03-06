<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/5/3
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
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
            <a class="navbar-brand" href="/query.do">教务管理系统</a>
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
<!--主体-->
<div class="col-md-2"></div>
<div class="col-md-8">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <h1 style="text-align: center;">添加用户</h1>
            </div>
        </div>
        <div>
            <font color="RED">${requestScope.message }</font>
        </div>
        <div class="panel-body">
            <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/addUser.do"
                  id="editfrom"
                  method="post" onsubmit="return check()">
                <div class="form-group">
                    <label for="userID" class="col-sm-2 control-label">用户id</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="username" id="userID"
                        placeholder="请输入用户id">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">登录密码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="password" id="password"
                               placeholder="请输入登录密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" id="userName"
                               placeholder="请输入姓名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="id" class="col-sm-2 control-label">用户身份</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="identity" id="id"
                               placeholder="请输入用户身份" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">密码找回凭据</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="findMMproof" id=""
                               placeholder="请输入找回密码凭据"  >
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
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>

