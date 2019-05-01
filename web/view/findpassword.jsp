<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/3/25
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码找回</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/login_background.css">
</head>
<body>
<!-- 找回密码页面 -->
<div class="container">
    <div class="row row-centered">
        <div class="well col-md-4 col-centered hover">
            <h2 class="row-centered">密码找回</h2>
            <div>
                <% String tokenValue = new Date().getTime() +""; %>
                <c:set value="<%=tokenValue %>" var="token" scope="session"/>
            </div>
            <form action="<%=request.getContextPath()%>/findPasswordServlet" method="post">
                <div>
                    ${sessionScope.message }
                </div>
                <input type="hidden" name="token" value="<%=tokenValue%>"/>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" ><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" id="userid" name="username" placeholder="请输入用户ID" value="${sessionScope.username }"/>
                    <%session.removeAttribute("message"); %>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" ><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="text" class="form-control" id="password" name="idCard" placeholder="请输入凭据" />
                </div>
                <br>
                <div>
                    凭据默认是身份证或护照
                </div>
                <br/>
                <a href="<%=request.getContextPath() %>/view/login.jsp" class="btn btn-warning col-md-4">返回登录</a>
                <div class="col-md-4"></div>
                <button type="submit"  class="btn btn-success col-md-4">找回密码</button>
            </form>
        </div>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery-3.2.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
