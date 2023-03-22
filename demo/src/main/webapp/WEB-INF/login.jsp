<%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/30
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <style>
        .div1{
            margin-top: 162px;
            text-align: center;
        }
        input{
            height: 58px;
            width: 434px;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 23px;
        }
        .div2{
           text-align: center;
            color:red;
        }
    </style>
</head>
<body>
<div class="div1">
    <h1>管理员登录</h1>
    <form method="post" action="/login">
        <p>
            <input type="text" id="userName" name="userName" placeholder="用户名" required>
        </p>
        <p>
            <input type="password" id="passWord" name="passWord" placeholder="密码" required>
        </p>
        <p>
            <input type="submit" id="login" name="login" value="登录" style="background-color: rgba(17,143,255,0.97)">
        </p>
    </form>
</div>
<div class="div2">
    <h3>${error}</h3>
</div>
</body>
</html>
