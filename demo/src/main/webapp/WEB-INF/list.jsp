<%@ page import="com.example.demo.entity.Books" %>
<%@ page import="org.springframework.data.domain.Page" %>
<%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/25
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍信息</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <style>
        .col1{
            width: 190px;
            height: 50px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .col2{
            width: 250px;
            height: 50px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        tr:hover{
            background-color:#f5f5f5;
        }
        .tab{
            margin-right: auto;
            margin-left: auto;
            border-collapse: collapse;
        }
        .main{
            width: 940px;
            height: 500px;
            margin-top: 11px;
            margin-right: auto;
            margin-left: auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="main">
        <p>
            <a href="/book/create" style="margin-left: 835px;">
                <button type="button" class="btn btn-primary">
                   添加书籍
                </button>
            </a>
        </p>
        <table class="tab">
            <tr>
                <th class="col1">ID</th>
                <th class="col1">名称</th>
                <th class="col1">作者</th>
                <th class="col1">出版社</th>
                <th class="col2">操作</th>
            </tr>
            <% Page<Books> booksPage = (Page<Books>) request.getAttribute("pageBook");%>
            <% for (Books books:booksPage) { %>
            <tr>
                <td class="col1"><%=books.getId()%></td>
                <td class="col1"><%=books.getName()%></td>
                <td class="col1"><%=books.getWriter()%></td>
                <td class="col1"><%=books.getPublisher()%></td>
                <td class="col2">
                    <a class="a1" href="/book/delete/<%=books.getId()%>">
                        <button>删除</button>
                    </a>&nbsp;
                    <a class="a1" href="/book/update/<%=books.getId()%>">
                        <button>修改</button>
                    </a>&nbsp;
                </td>
            </tr>
            <%}%>
        </table>
    </div>
        <div style="float: left; margin-left: 20px;">
            <% int totalPage = booksPage.getTotalPages(); %>
            <% int currentPage = booksPage.getNumber(); %>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="/book/findByPage/0">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="/book/findByPage/<%=currentPage - 1 < 0 ? 0:currentPage-1%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><span aria-hidden="true"><%=currentPage+1%></span></li>
                    <li>
                        <a href="/book/findByPage/<%=currentPage + 1 == totalPage ? totalPage-1:currentPage + 1 %>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li>
                        <a href="/book/findByPage/<%=totalPage-1%>">
                            <span aria-hidden="true">尾页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <h3 style="float: left;margin-left: 20px;font-size: 22px;margin-top: 25px;">总共<%=totalPage%>页</h3>
</body>
</html>
