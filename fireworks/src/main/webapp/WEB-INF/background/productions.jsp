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
            <li><a href="/fireworks/index.jsp">首页</a></li>
        </ul>
    </div>
</div>
<div id="content">
    <div class="left_menu">
        <ul id="nav_dot">
            <li>
                <h4 class="M1"><span></span>功能管理</h4>
                <div class="list-item none">
                    <a href="/fireworks/bg/bgIndex">管理员信息</a>
                    <a href="/fireworks/bg/users">用户列表</a>
                    <a href="/fireworks/bg/productions">设计列表</a>
                </div>
            </li>

        </ul>
    </div>
    <div class="m-right">

        <div class="main" id="mains">
            <table class="table table-condensed">
                <caption>设计列表</caption>
                <thead>
                <tr>
			        <th>用户账号</th>
			        <th>图片</th>
			        <th>作品名称</th>
			        <th>作品说明</th>
			        <th>操作</th>
			    </tr>
                </thead>
                <tbody id="tbs">
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
<script>navList(12);</script>
<script>
    $(function(){
        initProductions(1);
    })
    //作品列表
    function initProductions(pn){
        var tbs=$("#tbs");
        var msg='';
        var pageSize=10;
        var deleteState=1;
        var byThis="p.id";
        $.post("/fireworks/production/findAllProduction",{"deleteState":deleteState,"pn":pn,"pageSize":pageSize,"byThis":byThis},function(data){
        	for(var i=0;i<data.length;i++){
                msg+='<tr><td>'+data[i].user.account+'</td><td><img src="'+data[i].imgurl+'" width="100px" height="50px"/></td>';
                msg+='<td>'+data[i].pro_name+'</td><td>'+data[i].pro_tail+'</td>';
                msg+='<td><button type="button" class="btn btn-primary" onclick="deleteProdution('+data[i].id+','+pn+')">删除</button></td></tr>';
            }
            tbs.html(msg);
        });
    }

    //删除作品
    function deleteProdution(id,pn){
        $.get("/fireworks/production/deleteProduction",{"id":id},function(data){
            if(data==1)
                initProductions(pn);
            else
                alert("服务器故障！")
        })
    }

</script>
</body>
</html>
<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <th>作品说明</th>
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

<script>
    $(function(){
        initProductions(1);
    })
    //作品列表
    function initProductions(pn){
        var tbs=$("#tbs");
        var msg='';
        var pageSize=10;
        var deleteState=1;
        var byThis="p.id";
        $.post("/fireworks/production/findAllProduction",{"deleteState":deleteState,"pn":pn,"pageSize":pageSize,"byThis":byThis},function(data){
            for(var i=0;i<data.length;i++){
                msg+='<tr><td>'+data[i].user.account+'</td><td><img src="'+data[i].headUrl+'" width="100px" height="50px"/></td>';
                msg+='<td>'+data[i].pro_name+'</td><td>'+data[i].pro_tail+'</td>';
                msg+='<td><button type="button" class="btn btn-primary" onclick="deleteProdution('+data[i].id+',pn)">删除</button></td></tr>';
            }
            tbs.html(msg);
        });
    }

    //删除作品
    function deleteProdution(id,pn){
        $.get("/fireworks/production/deleteProduction",{"id":id},function(data){
            if(data==1)
                initProductions(pn);
            else
                alert("服务器故障！")
        })
    }

</script>
</body>
</html> --%>
