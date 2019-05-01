<%--
 Created by IntelliJ IDEA.
  User: 10403
  Date: 2019/3/25
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
  <head>
    <title>用户登录</title>
    <!-- Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/login_background.css">
  </head>
  <body>
  <div class="container">
    <div class="row row-centered">
      <div class="well col-md-4 col-centered hover">
        <h2 class="row-centered">欢迎登录教务管理系统</h2>
        <div>
          <% String tokenValue = new Date().getTime() +""; %>
          <c:set value="<%=tokenValue %>" var="token" scope="session"/>
        </div>
        <form action="<%=request.getContextPath()%>/loginservlet" method="post">
          <div>
            <font color="RED">${sessionScope.message }	</font>
            <%session.removeAttribute("message"); %>
          </div>
          <input type="hidden" name="token" value="<%=tokenValue%>"/>
          <div class="input-group input-group-md">
            <span class="input-group-addon" ><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
            <input type="text" class="form-control" id="userid" name="username" placeholder="请输入用户ID" value="${sessionScope.username }"/>
          </div>
          <div class="input-group input-group-md">
            <span class="input-group-addon" ><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
          </div>
          <br/>
          <a href="findpassword.jsp" class="btn btn-warning col-md-4">找回密码</a>
          <div class="col-md-4"></div>
          <button type="submit"  class="btn btn-success col-md-4">登录</button>
        </form>
      </div>
    </div>
  </div>
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
  <script src="../js/jquery-3.2.1.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
