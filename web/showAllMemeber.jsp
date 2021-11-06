<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>用户一览</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>
<%@ page import="mybean.data.ShowBypage" %>
<jsp:useBean id="show" type="mybean.data.ShowBypage" scope="session"/>
<div class="container" style="width: 1000px;">
    <h3 style="text-align: center">用户信息列表</h3>
    <div class="form-group" style="text-align: right">
        <a class="btn btn-primary" href="showLoginMess.jsp" role="button">返回</a>
    </div>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>会员名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话</th>
            <th>email</th>
            <th>简历</th>
            <th>照片</th>
            <jsp:getProperty name="show" property="presentPageResult"/>
        </tr>
    </table>
    <br/>
    <table width="1000px">
        <tr>
            <td width="100px">
                <form action="HandleDatabase" method="post">
                    <input type="hidden" name="showPage" value="<%=show.getShowPage()-1 %>">
                    <input type="submit" name="g" value="前一页"/>
                </form>
            </td>
            <td width="100px">
                <form action="HandleDatabase" method="post">
                    <input type="hidden" name="showPage" value="<%=show.getShowPage()+1 %>">
                    <input type="submit" name="g" value="后一页"/>
                </form>
            </td>
            <td width="200px">
                <form action="HandleDatabase" method="post">
                    输入页码 <input type="text" name="showPage" size="5"/>
                    <input type="submit" name="g" value="提交"/>
                </form>
            </td>
            <td width="600px" align="right">
                <div class="form-group">
                    每页最多显示
                    <jsp:getProperty name="show" property="pageSize"/>
                    条
                    当前显示
                    <jsp:getProperty name="show" property="showPage"/>
                    页
                    共
                    <jsp:getProperty name="show" property="pageAllCount"/>
                    页
                </div>
            </td>
        </tr>

    </table>


</div>
</body>
</html>
