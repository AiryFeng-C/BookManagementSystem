<%@ page import="com.example.demo.entity.Books" %>
<%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/27
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>添加书籍</title>
        <style>
            .main{
                background-color: white;
                border-radius: 4px;
                height: 448px;
                width: 720px;
                border: 1px;
                box-shadow: 0px 0px 3px 1px rgb(222 215 215);
                margin: 0 auto;
                margin-top: 90px;
                text-align: center;
             }
            input{
                width: 578px;
                height: 58px;
                border-radius: 4px;
                border: 1px solid #ddd;
                font-size: 23px;
            }
            table{
                margin-left: 19px;
            }
            th,td{
                text-align: left;
            }
            .lab{
                height: 50px;
                width: 50px;
                font-size: 23px;
            }
            h3{
                color: red;
            }
        </style>
    </head>
    <body>
        <form method="post" action="/book/create1" enctype="multipart/form-data">
        <div class="main">
            <h1>添加书籍</h1>
            <table>
                <tr>
                    <th><label for="name" class="lab">名称：</label></th>
                    <td><input type="text" id="name" name="name" value="${book.getName()}" required></td>
                </tr>
                <tr>
                    <th><label for="writer" class="lab">作者：</label></th>
                    <td><input type="text" id="writer" name="writer" value="${book.getWriter()}" required></td>
                </tr>
                <tr>
                    <th><label for="publisher" class="lab">出版社：</label></th>
                    <td><input type="text" id="publisher" name="publisher" value="${book.getPublisher()}" required></td>
                </tr>
                <tr>
                    <th><label for="image" class="lab">图片：</label></th>
                    <td><input type="file" id="image" name="image" required></td>
                </tr>
                <tr>
                    <th><label for="url" class="lab">URL：</label></th>
                    <td><input type="text" id="url" name="url" value="${book.getUrl()}" required></td>
                </tr>
            </table>
            <input type="submit" value=" 保存" style=" background-color: rgba(17,143,255,0.97); border: 1px solid #ddd;">
            <br>
            <h3>${errorInfo}</h3>
        </div>
    </form>
</body>
</html>

