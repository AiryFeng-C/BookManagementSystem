<%--
  Created by IntelliJ IDEA.
  User: 16704
  Date: 2022/11/30
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>默认页</title>
    <style>
        .header {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            text-align: center;
            box-shadow: 0px 0px 0px 1px rgb(222, 215, 215);
            background-color: rgba(22,45,84,0.8);
            color:white;

        }
        li h3,li a{
            text-align: center;
            text-decoration: none;
            color: white;
        }
        .item:hover {
            background-color: rgba(9,24,84,0.8);
        }
        .left {
            list-style-type: none;
            margin-top:10px;
            padding: 0;
            height: 600px;
            width: 152px;
            background-color: rgba(22,45,84,0.8);
            float: left;
        }
        .div1{
            margin-top:0px;
            padding: 0;
            height: 600px;
            width: 152px;
            box-shadow: 0px 0px 0px 1px rgb(222, 215, 215);
            float: left;
            margin-left: 0px;
        }

        .item{
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            text-align: center;
            border-bottom: 1px solid #ddd;
            margin-top: 1px;
        }
        .right{
            height: 600px;
            width: 1095px;
            float: left;
            background-color: white;
            border: medium none;
        }
        .div2{
            height: 600px;
            width: 1095px;
            float: left;
            box-shadow: 0px 0px 0px 1px rgb(222, 215, 215);
        }
        .footer1{
            margin: 0 auto;
            width: 100%;
            height: 5px;
            text-align: center;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
  <ul class="header">
      <li class="title">
          <h3>资源管理</h3>
      </li>
  </ul>
  <div class="div1">
   <ul class="left" style="margin: 0;">
       <li class="item">
           <a href="/book/list1" target="tar"><strong>书籍展示</strong></a>
       </li>
       <li class="item">
           <a href="/book/findByPage/0" target="tar"><strong>书籍管理</strong></a>
       </li>
   </ul>
  </div>
  <div class="div2">
    <iframe class="right" src="/book/list1" name="tar" frameborder="0"></iframe>
  </div>
  <div class="footer1">
  </div>
</body>
</html>
