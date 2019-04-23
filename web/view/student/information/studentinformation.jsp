<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/8
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学籍信息</title>
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
                <h1 style="text-align: center;">学籍信息</h1>
            </div>
        </div>
        <div>
            <font color="RED">${requestScope.message }</font>
        </div>
        <div class="panel-body">
            <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/studentInformationServlet"
                  id="editfrom"
                  method="post" onsubmit="return check()">
                <div class="form-group">
                    <label for="userID" class="col-sm-2 control-label">学号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="studentId" id="userID"
                               readonly="readonly" value="${requestScope.studentBasicInformation.studentId }" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="userName" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="studentName" id="userName"
                               placeholder="请输入姓名" value="${requestScope.studentBasicInformation.studentName }">
                    </div>
                </div>

                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="gender" id="sex" readonly="readonly"
                               placeholder="请输入性别" value="${requestScope.studentBasicInformation.gender }" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="className" class="col-sm-2 control-label">班级</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="className" id="className" readonly="readonly"
                               placeholder="请输入班级" value="${requestScope.studentBasicInformation.className }" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="grade" class="col-sm-2 control-label">入学时间</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="grade" id="grade" readonly="readonly"
                               placeholder="请输入入学时间" value="${requestScope.studentBasicInformation.grade }" >
                    </div>
                </div>

                <div class="form-group">
                    <label for="academy" class="col-sm-2 control-label">所属学院</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="academy" id="academy"
                               placeholder="请输入所属学院" value="${requestScope.studentBasicInformation.academy}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="profession" class="col-sm-2 control-label">所学专业</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="profession" id="profession"
                               placeholder="请输入所学专业" value="${requestScope.studentBasicInformation.profession }">
                    </div>
                </div>

                <div class="form-group">
                    <label for="campus" class="col-sm-2 control-label">所在校区</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="campus" id="campus"
                               placeholder="请输入所在校区" value="${requestScope.studentBasicInformation.campus }">
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone" class="col-sm-2 control-label">联系电话</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="phone" id="phone"
                               placeholder="请输入联系电话" value="${requestScope.studentBasicInformation.phone}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="homeAddress" class="col-sm-2 control-label">家庭地址</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="homeAddress" id="homeAddress"
                               placeholder="请输入家庭地址" value="${requestScope.studentBasicInformation.homeAddress}">
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

