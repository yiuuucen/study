<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/7
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>作品列表</title>
    <link type="text/css" rel="stylesheet" href="/fireworks/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="/fireworks/bgView/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/fireworks/bootstrap-3.3.7/js/bootstrap.js"></script>
</head>
<body>
<table class="table table-condensed">
    <caption>作品列表</caption>
    <thead>
    <tr>
        <th>用户账号</th>
        <th>图片</th>
        <th>作品名称</th>
        <th>手机号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbs">
    <tr>
        <td><img src="${sessionScope.adminInfo.headUrl}" width="100px" height="50px"/></td>
        <td>${sessionScope.adminInfo.account}</td>
        <td>${sessionScope.adminInfo.pwd}</td>
        <td>${sessionScope.adminInfo.phone}</td>
        <td><button type="button" class="btn btn-primary">删除</button></td>
    </tr>
    </tbody>
</table>
</body>
</html>
