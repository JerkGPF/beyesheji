<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/3/25
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>信息查询</title>
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
            <a class="navbar-brand" href="/teacherInquireServlet">教务管理系统</a>
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
                        <li><a href="/teacherInquireServlet">个人信息</a></li>
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
                <li><a href="/teacherInformationServlet">个人信息</a></li>
                <li><a href="/view/teacher/information/courseinformation.jsp">课程信息</a></li>
                <li><a href="/view/teacher/grade.jsp">成绩录入</a></li>
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
                        <h1 style="text-align: center;">个人信息</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/teacherInquireServlet"
                          id="editfrom"
                          method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="userID" class="col-sm-2 control-label">教师编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="teacherId" id="userID"
                                       value="${requestScope.teacher.teacherId}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="teacherName" id="userName"
                                       placeholder="请输入姓名" value="${requestScope.teacher.teacherName }">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sex" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="gender" id="sex"
                                       placeholder="请输入性别" value="${requestScope.teacher.gender }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="politicStatus" class="col-sm-2 control-label">政治面貌</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="politicstatus" id="politicStatus"
                                       placeholder="" value="${requestScope.teacher.politicstatus }" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Nation" class="col-sm-2 control-label">民族</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nation" id="Nation"
                                       placeholder="" value="${requestScope.teacher.nation }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nativePlace" class="col-sm-2 control-label">籍贯</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nativeplace" id="nativePlace"
                                       placeholder="" value="${requestScope.teacher.nativeplace }" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="academy" class="col-sm-2 control-label">学院</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="academy" id="academy"
                                       placeholder="" value="${requestScope.teacher.academy }" disabled>
                            </div>
                        </div>
                    </form>
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
    $("#nav li:nth-child(1)").addClass("active")

</script>
</body>
</html>
