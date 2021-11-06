<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>修改密码</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container" style="width: 400px">
    <jsp:useBean id="password" type="mybean.data.Password" scope="request"/>
        <h3 style="text-align: center">
            <jsp:getProperty name="password" property="backNews"/>
        </h3>
        <div class="form-group">
            <label>修改前密码：</label>
            <input type="text" name="Password" class="form-control"
                   disabled="disabled"
                    value=<jsp:getProperty name="password" property="oldPassword"/>>
        </div>

        <div class="form-group">
            <label>新密码：</label>
            <input type="text" name="Password" class="form-control"
                   disabled="disabled"
                   value=<jsp:getProperty name="password" property="newPassword"/>>
        </div>
        <div class="form-group" style="text-align: center">
            <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
        </div>
</div>
</body>
</html>
