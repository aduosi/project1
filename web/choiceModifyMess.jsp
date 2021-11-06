<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>修改信息</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<Center>--%>
<%--    &lt;%&ndash;<html>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<BODY>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<%@ include file="nav.txt" %></HEAD>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<hr/>&ndash;%&gt;--%>
<%--    <form action="GetOldMess" name=form>--%>
<%--        <INPUT type=submit value="我要修改注册信息">--%>
<%--    </form>--%>
<%--    <form action="index.jsp" name=form>--%>
<%--        <input type=submit value="我不想修改了">--%>
<%--    </form>--%>
<%--</Center>--%>
<%--</body>--%>
<%--</html>--%>


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
        <%--        <jsp:getProperty name="login" property="backNews"/>--%>
    </h4>
    <p align="left">
        <% if (login.isSuccess() == true) {
        %>    <br>欢迎您:
        <jsp:getProperty name="login" property="logname"/>
        <%--        <br>密码:--%>
        <%--        <jsp:getProperty name="login" property="password"/>--%>
        <%} %>
    </p>
    <div class="form-group">
        <a class="btn btn-info" href="register.jsp" role="button">会员注册</a>
        <a class="btn btn-info" href="login.jsp" role="button">会员登录</a>
        <a class="btn btn-info" href="upload.jsp" role="button">上传照片</a>
        <a class="btn btn-info" href="HandleDatabase" role="button">浏览会员</a>
    </div>
    <div class="form-group">
        <a class="btn btn-info" href="modifyPassword.jsp" role="button">修改密码</a>
        <a class="btn btn-info" href="choiceModifyMess.jsp" role="button">修改信息</a>
        <a class="btn btn-info" href="HandleExit" role="button">退出登录</a>
        <a class="btn btn-info" href="index.jsp" role="button">返回主页</a>
    </div>
    <hr style="width: 340px;" align="left"/>

        <form action="GetOldMess" name=form>
            <div class="form-group">
                <button class="btn btn-primary" type="submit" style="width: 340px;">修改注册信息</button>
            </div>
        </form>
    <div class="form-group">
                <a class="btn btn-default" href="showLoginMess.jsp" role="button" style="width: 340px;">我不想修改了</a>
            </div>
</div>
</body>
</html>