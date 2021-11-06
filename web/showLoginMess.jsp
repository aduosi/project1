<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body ><!--background="../img/2.jpg" background-size: contain;>-->

<%--<%@include file="nav.txt" %>--%>
<%--<hr>--%>
<div class="container" style="width: 400px;">
    <jsp:useBean id="login" type="mybean.data.Login" scope="session"/>
    <h4 align="left">
<%--        <jsp:getProperty name="Login" property="backNews"/>--%>
    </h4>
    <p align="left">
        <% if (login.isSuccess() == true) {
        %>    <br>欢迎您:
        <jsp:getProperty name="login" property="logname"/>
<%--        <br>密码:--%>
<%--        <jsp:getProperty name="Login" property="password"/>--%>
        <%} %>
    </p>
    <div class="form-group">
    <form action="HandleDatabase" method="post" name="form" display="inline-block"><br>
        <a class="btn btn-info" href="register.jsp" role="button">会员注册</a>
        <a class="btn btn-info" href="login.jsp" role="button">会员登录</a>
        <a class="btn btn-info" href="upload.jsp" role="button">上传照片</a>
        <input type="hidden" value="1" name="showPage" size="6"/>
        <input class="btn btn-info" type="submit" value="浏览会员" name="submit"/>
    </form>
    </div>
    <div class="form-group">
        <a class="btn btn-info" href="modifyPassword.jsp" role="button">修改密码</a>
        <a class="btn btn-info" href="choiceModifyMess.jsp" role="button">修改信息</a>
        <a class="btn btn-info" href="HandleExit" role="button">退出登录</a>
        <a class="btn btn-info" href="index.jsp" role="button">返回主页</a>
    </div>
</div>
</body>
</html>