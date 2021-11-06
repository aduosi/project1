<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>showRegisterMess.jsp</title>--%>
<%--</head>--%>
<%--<body bgcolor="lightyellow">--%>
<%--<%@include   file="nav.txt"  %>--%>
<%--<hr>--%>
<%--<jsp:useBean id="user1"  type="mybean.data.Register"--%>
<%--scope="request"/>--%>
<%--<h1 align="center"><jsp:getProperty name="user1" property="backNews"/> </h1>--%>
<%--<table align="center">--%>
<%-- <tr><td>注册的会员名称: </td>--%>
<%--     <td><jsp:getProperty name="user1" property="logname"/></td>--%>
<%-- </tr>--%>
<%-- <tr><td>注册的电子邮件:</td>--%>
<%--     <td><jsp:getProperty name="user1" property="email"/></td>--%>
<%-- </tr>--%>
<%-- <tr><td>年龄:</td>--%>
<%--     <td><jsp:getProperty name="user1" property="age"/></td>--%>
<%-- </tr>--%>
<%--  <tr><td>性别:</td>--%>
<%--     <td><jsp:getProperty name="user1" property="sex"/></td>--%>
<%-- </tr>--%>
<%--  <tr><td>注册的联系电话:</td>--%>
<%--     <td><jsp:getProperty name="user1" property="phone"/></td>--%>
<%-- </tr>--%>
<%--</table>--%>
<%-- <table align="center"><tr><td>您的简历和交友标准：</td></tr>--%>
<%--   <tr><td><textArea name="message" Rows="6" Cols="30">--%>
<%--       <jsp:getProperty name="user1" property="message"/>--%>
<%--       </TextArea>--%>
<%--       </td>--%>
<%--   </tr>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="card-body">
    <div class="container" style="width: 400px;">
        <jsp:useBean id="user1" type="mybean.data.Register" scope="request"/>
        <h3 align="center">
            <jsp:getProperty name="user1" property="backNews"/>
        </h3>
        <div class="form-group">
            <label>姓名:</label>
            <jsp:getProperty name="user1" property="logname"/>
        </div>
        <div class="form-group">
            <label>邮件:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value= <jsp:getProperty name="user1" property="email"/>>
        </div>
        <div class="form-group">
            <label>年龄:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value= <jsp:getProperty name="user1" property="age"/>>
        </div>
        <div class="form-group">
            <label>性别:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value=<jsp:getProperty name="user1" property="sex"/>>
        </div>
        <div class="form-group">
            <label>电话:</label>
            <input type="text"  class="form-control"
                   disabled="disabled" value=<jsp:getProperty name="user1" property="phone"/>>
        </div>
        <div class="form-group">
            <label for="floatingTextarea2">个人简历</label>
            <textarea class="form-control"  disabled="disabled" placeholder="请输入您的简历.." id="floatingTextarea2" style="height: 100px"
                      name="newMessage"> <jsp:getProperty name="user1" property="message"/></textarea>
        </div>
        <div class="form-group" style="text-align: center">
            <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
        </div>
    </div>
</div>
</body>
</html>