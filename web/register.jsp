<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>会员注册</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body ><!--background="../img/2.jpg" background-size: contain;>-->
<div class="card-body">
<div class="container" style="width: 400px;">
    <center><h3>会员注册</h3></center>
    <form action="${pageContext.request.contextPath}/HandleRegister" method="post">
        <div class="form-group">
            <label for="logname">姓名：</label>
            <input type="text" class="form-control" id="logname"
                    name="logname" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label>密码：</label>
            <input type="text" class="form-control" id="password"
                   name="password" placeholder="请输入密码">
        </div>

        <div class="form-group">
            <label>年龄：</label>
            <input type="text" class="form-control" id="age"
                   name="age" placeholder="请输入年龄">
        </div>

        <div class="form-group">
            <label>邮件：</label>
            <input type="text" class="form-control" id="email"
                   name="email" placeholder="请输入邮件">
        </div>

        <div class="form-group">
            <label>电话：</label>
            <input type="text" class="form-control" id="phone"
                   name="phone" placeholder="请输入电话">
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio"  name="sex" value="男" checked="checked"/>男
            <input type="radio"  name="sex" value="女" />女
        </div>

        <div class="form-group">
            <label>输入您的简历：</label>
            <textarea  class="form-control" placeholder="请输入您的简历" id="floatingText2" style="height: 100px"
                       name="message"></textarea>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary"  type="submit" value="注册"/>
            <input class="btn btn-default"  type="reset" value="重置"/>
            <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
        </div>
    </form>
</div>
</div>
</body>
</html>
