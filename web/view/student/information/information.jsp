<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/4/8
  Time: 14:07
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
                <li data-toggle="modal" data-target="#myModal"><a href="#">信息查询</a></li>
                <li><a href="/view/student/student.jsp">选课报名</a></li>
                <li><a href="#">业务办理</a></li>
                <li><a href="#">账号密码重置
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
                    <form name="reset" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/studentInformationServlet"
                          id="editfrom"
                          method="post" onsubmit="return check()">
                        <div class="form-group">
                            <label for="userID" class="col-sm-2 control-label">学号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="studentId" id="userID"
                                       value="${requestScope.studentBasicInformation.studentId }" disabled>
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
                                <input type="text" class="form-control" name="gender" id="sex"
                                       placeholder="请输入性别" value="${requestScope.studentBasicInformation.gender }" disabled>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="className" class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="className" id="className"
                                       placeholder="请输入班级" value="${requestScope.studentBasicInformation.className }" disabled>
                            </div>
                        </div>

                    </form>
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
                        <li><a href="<%=request.getContextPath()%>/studentInformationServlet">学籍信息</a></li>
                        <li><a href="/view/student/information/timeTable.jsp">课表查询</a></li>
                        <li><a href="<%=request.getContextPath()%>/studentquery.query">考级查询</a></li>
                        <li><a href="#">成绩查询</a></li>
                        <li><a href="#">考试安排</a></li>
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
    $("#nav li:nth-child(1)").addClass("active")
    <c:if test="${pagingVO != null}">
    if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
        $(".pagination li:last-child").addClass("disabled")
    }
    ;

    if (${pagingVO.curentPageNo} == ${1}) {
        $(".pagination li:nth-child(1)").addClass("disabled")
    }
    ;
    </c:if>

    function confirmd() {
        var msg = "您真的确定要删除吗？！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }

    $("#sub").click(function () {
        $("#form1").submit();
    });
</script>
</body>
</html>
