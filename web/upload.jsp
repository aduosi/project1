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
<body>

<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">请选择要上传的图像文件</h3>
    <p align="center">
    <form action="HandleUpload" method="post"
          enctype="multipart/form-data">
        <div class="form-group" style="text-align: left;">
            <div class="form-group" >
                请选择上传文件： <input type="file" name="upload">
            </div>
            <input class="btn btn-primary" type="submit" value="上传">
            <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
        </div>

    </form>
    </p>
</div>
</body>
</body>
</html>