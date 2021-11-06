<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%--<HEAD></HEAD>--%>
<%--<HTML><BODY bgcolor=pink>--%>
<%--<%@ include file="nav.txt" %>--%>
<%--<hr>--%>
<%--<CENTER> --%>
<%--<jsp:useBean id="register" type="mybean.data.Register" scope="request"/>--%>
<%--<jsp:getProperty property="backNews" name="register"/>--%>
<%--<h1 align="center">欢迎--%>
<%--<jsp:getProperty property="logname" name="register"/>--%>
<%--来到修改信息页面</h1>--%>
<%--<h1 align="center">以下是您曾注册信息，您可以修改这些信息</h1>--%>
<%--<form action="HandleModifyMess" method="post">--%>
<%--<table><tr><td>性别：<jsp:getProperty property="sex" name="register"/></td>--%>
<%--			<td>--%>
<%--				<input type=radio name="newSex" checked="checked" value="男">男--%>
<%--				<input type=radio name="newSex" value="女">女--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--   <tr><td>年龄:</td><td><Input type=text name="newAge"--%>
<%--          value=<jsp:getProperty name="register"  property="age"  />  ></td></tr>--%>
<%--   <tr><td>联系电话:</td><td><Input type=text name="newPhone"--%>
<%--          value=<jsp:getProperty name="register"  property="phone"  />  ></td></tr>--%>
<%--   <tr><td>电子邮件:</td><td><Input type=text name="newEmail"--%>
<%--           value=<jsp:getProperty name="register"  property="email"  />></td></tr>  --%>
<%--  </table>--%>
<%--  <table>--%>
<%--   <tr><td>个人简历：</td></tr>--%>
<%--   <tr>--%>
<%--      <td><TextArea name="newMessage" Rows="6" Cols="30">--%>
<%--            <jsp:getProperty name="register" property="message"/>--%>
<%--         </TextArea></td>--%>
<%--   </tr>--%>
<%--   <tr><td><Input type=submit name="g" value="提交修改"></td></tr>--%>
<%--   <tr><td><Input type=reset value="重置"></td> </tr>--%>
<%-- </table>--%>
<%-- </form></CENTER>--%>
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
        <jsp:useBean id="register" type="mybean.data.Register" scope="request"/>
        <h4 align="center">欢迎
            <jsp:getProperty property="logname" name="register"/>
            来到修改信息页面</h4>
        <form action="HandleModifyMess" method="post">
            <div class="form-group">
                <label for="age">年龄:</label>
                <input type="text" class="form-control" id="age" name="newAge"
                       value=<jsp:getProperty name="register"  property="age"  />>
            </div>
            <div class="form-group">
                <label for="email">邮件:</label>
                <input type="text" class="form-control" id="email" name="newEmail"
                       value=<jsp:getProperty name="register"  property="email" />>
            </div>

            <div class="form-group">
                <label for="phone">电话:</label>
                <input type="text" class="form-control" id="phone" name="newPhone"
                       value=<jsp:getProperty name="register"  property="phone"  />>
            </div>
            <div class="form-group">
                <label>性别:<jsp:getProperty property="sex" name="register"/></label>
                <input type="radio" name="newSex" value="男" checked="checked"/>男
                <input type="radio" name="newSex" value="女"/>女
            </div>


            <div class="form-group">
                <label for="floatingTextarea2">个人简历</label>
                <textarea class="form-control" placeholder="请输入您的简历.." id="floatingTextarea2" style="height: 100px"
                          name="newMessage"> <jsp:getProperty name="register" property="message"/></textarea>
            </div>

            <div class="form-group" style="text-align: center">
                <input class="btn btn-primary" type="submit" name="g" value="提交修改"/>
                <input class="btn btn-default" type="reset" value="重置"/>
                <a class="btn btn-default" href="showLoginMess.jsp" role="button">返回</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>