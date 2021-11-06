<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%--<jsp:useBean id="modify" type="mybean.data.ModifyMessage" scope="request"/>--%>
<%--<HEAD></HEAD>--%>
<%--<HTML>--%>
<%--<BODY bgcolor=yellow >--%>
<%--<%@ include file="nav.txt" %>--%>
<%--<hr>--%>
<%-- <jsp:getProperty name="modify" property="backNews"/>,--%>
<%-- 您修改信息如下：--%>
<%-- <table border="1" align="center" class="table table-striped table-hover">--%>
<%--     <thead>--%>
<%--     <tr>--%>
<%--         <th scope="col">新电话</th>--%>
<%--         <th scope="col">新email</th>--%>
<%--         <th scope="col">新性别</th>--%>
<%--         <th scope="col">新年龄</th>--%>
<%--         <th scope="col">新简历</th>--%>
<%--     </tr>--%>
<%--     </thead>--%>

<%-- <tr> --%>
<%--     <td><jsp:getProperty name="modify" property="newPhone"/></td>--%>
<%--     <td><jsp:getProperty name="modify" property="newEmail"/></td>--%>
<%--     <td><jsp:getProperty name="modify" property="newSex"/></td>--%>
<%--         <td><jsp:getProperty name="modify" property="newAge"/></td>--%>
<%--     <td><textarea>--%>
<%--         <jsp:getProperty name="modify" property="newMessage"/>--%>
<%--         </textarea>--%>
<%--     </td>--%>
<%-- </tr>--%>
<%-- </table>--%>

<%--</BODY>--%>
<%--</HTML>--%>

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
        <jsp:useBean id="modify" type="mybean.data.ModifyMessage" scope="request"/>
        <h3 align="center">
            <jsp:getProperty name="modify" property="backNews"/>
        </h3>
        <%--     <td><jsp:getProperty name="modify" property="newPhone"/></td>--%>
        <%--     <td><jsp:getProperty name="modify" property="newEmail"/></td>--%>
        <%--     <td><jsp:getProperty name="modify" property="newSex"/></td>--%>
        <%--         <td><jsp:getProperty name="modify" property="newAge"/></td>--%>
        <%--     <td><textarea>--%>
        <%--         <jsp:getProperty name="modify" property="newMessage"/>--%>
        <%--         </textarea>--%>
        <div class="form-group">
            <label>新电话:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value=<jsp:getProperty name="modify" property="newPhone"/>>
        </div>
        <div class="form-group">
            <label>新email:</label>
            <input type="text"  class="form-control"
                   disabled="disabled" value=<jsp:getProperty name="modify" property="newEmail"/>>
        </div>
        <div class="form-group">
            <label>新性别:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value=<jsp:getProperty name="modify" property="newSex"/>>
        </div>
        <div class="form-group">
            <label>新年龄:</label>
            <input type="text" class="form-control"
                   disabled="disabled" value= <jsp:getProperty name="modify" property="newAge"/>>
        </div>
        <div class="form-group">
            <label for="floatingTextarea2">新简历</label>
            <textarea class="form-control"  disabled="disabled" id="floatingTextarea2" style="height: 100px"
                      name="newMessage"> <jsp:getProperty name="modify" property="newMessage"/></textarea>
        </div>
        <div class="form-group" style="text-align: center">
            <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
        </div>
    </div>
</div>
</body>
</html>