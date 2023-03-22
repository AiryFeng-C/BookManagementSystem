<%@ page import="com.example.demo.entity.Books" %><%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/26
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详情</title>
    <style>
        .main{
            background-color: white;
            border-radius: 4px;
            height: 416px;
            width: 312px;
            border: 1px;
            box-shadow: 0px 0px 3px 1px rgb(222 215 215);
            margin: 0 auto;
            vertical-align: middle;
            font-family: '黑体';
            text-align:center;
            margin-top: 98px;
        }

        img{
            height: 250.31px;
            width: 312px;
            margin-top:0px;
            border-radius:4px;
        }
        a{
            text-decoration: none;
            color: dodgerblue;
        }
    </style>
</head>
<body>
<%Books book = (Books) request.getAttribute("book");%>
<%String url = book.getUrl(); %>
<%String filename =url.substring(7);  %>
<div class="main">
    <a href="http://localhost:8080<%=book.getUrl()%>" target="_blank"><img src=<%=book.getUrl()%>></a>
    <h4>名称：<%=book.getName()%></h4>
    <h4>作者：<%=book.getWriter()%></h4>
    <h4>出版社：<%=book.getPublisher()%></h4>
    <h4><a href="/book/download/<%=filename%>">下载图片</a></h4>
</div>
</body>
</html>
