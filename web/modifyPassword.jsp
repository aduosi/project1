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
    <h3 style="text-align: center">修改密码</h3>

    <form action="HandlePassword" method="post">
        <div class="form-group">
            <label for="oldPassword">当前密码：</label>
            <input type="text" name="oldPassword" class="form-control"
                   id="oldPassword" placeholder="请输入原始密码"/>
        </div>

        <div class="form-group">
            <label for="newPassword">新密码：</label>
            <input type="password" name="newPassword" class="form-control"
                   id="newPassword" placeholder="请输入新密码"/>
        </div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" name="g" value="提交">
        </div>
    </form>
</div>
</body>
</html>
