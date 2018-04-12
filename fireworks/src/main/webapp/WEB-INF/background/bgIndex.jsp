<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/6
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台模板管理系统</title>
    <link type="text/css" rel="stylesheet" href="/fireworks/bgView/css/style.css" />
    <link type="text/css" rel="stylesheet" href="/fireworks/bootstrap-3.3.7/css/bootstrap.css" />
    <script type="text/javascript" src="/fireworks/bgView/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/fireworks/bgView/js/menu.js"></script>
    <script type="text/javascript" src="/fireworks/bootstrap-3.3.7/js/bootstrap.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
    <div class="logo">后台管理系统</div>
    <div class="navigation">
        <ul>
            <li>欢迎您！</li>
            <li><a href="">${sessionScope.adminInfo.account}</a></li>
            <li><a href="">退出</a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="left_menu">
        <ul id="nav_dot">
            <li>
                <h4 class="M1"><span></span>功能管理</h4>
                <div class="list-item none">
                    <a href='javascript:toView(bgIndex)'>管理员信息</a>
                    <a href='javascript:toView(users)'>用户列表</a>
                    <a href='javascript:toView(cases)'>设计列表</a>
                </div>
            </li>

        </ul>
    </div>
    <div class="m-right">

        <div class="main" id="mains">
            <table class="table table-condensed">
                <caption>管理员信息</caption>
                <thead>
                <tr>
                    <th>头像</th>
                    <th>账号</th>
                    <th>密码</th>
                    <th>手机号</th></tr>
                </thead>
                <tbody>
                <tr>
                    <td><img src="${sessionScope.adminInfo.headUrl}" width="100px" height="50px"/></td>
                    <td>${sessionScope.adminInfo.account}</td>
                    <td>${sessionScope.adminInfo.pwd}</td>
                    <td>${sessionScope.adminInfo.phone}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p></div>
<script>navList(12);</script>
<script>
    function toView(urls){
        var mains=$("#mains");
        $.post("/fireworks/bg/"+urls,{},function(data){
            mains.html(data);
        })
    }
</script>
</body>
</html>
