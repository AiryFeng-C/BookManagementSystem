<%@ page import="com.example.demo.entity.Books" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/27
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>书籍</title>
    <style>
        .div1{
            background-color:white;
            border-radius: 4px;
            height:283px;
            width:174px;
            border:1px;
            box-shadow: 0px 0px 3px 1px rgb(222, 215, 215);
            float: left;
            margin: 18px;
            font-family: '宋体';
            text-align: center;
        }

        img{
            height: 226.31px;
            width: 174px;
            margin-top:0px;
            border-radius:4px;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%List<Books> list = (List<Books>) request.getAttribute("list");%>
    <%for (Books book:list) { %>
    <a href="/book/detail/<%=book.getId()%>">
    <div class="div1">
        <img src="<%=book.getUrl()%>">
        <h4><%=book.getName()%></h4>
    </div>
    </a>
    <%}%>
</body>
</html>
