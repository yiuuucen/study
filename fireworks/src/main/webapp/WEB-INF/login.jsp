<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
    <link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
    <link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
    <link rel="stylesheet" href="/fireworks/static/cenu_css/font-awesome.css">
</head>
<body>
    <div class="login cl">
        <div class="header cl">
            <div class="container">
                <div class="headl">
                    <a href="/fireworks/index.jsp"><img src="/fireworks/static/cenu_img/logo.png" alt=""></a>
                </div>
                <div class="headr">
                    还没有账户？<a href="/fireworks/register">免费注册</a>
                </div>
            </div>
        </div>
        <div class="center cl">
            <div class="container">
                <div class="loginform">
                    <form class="loginRight">
                        <h2>Sign in</h2>
                        <h3><i class="fa fa-user"></i>&nbsp;Username</i></h3>
                        <input type="text" class="name">
                        <h3><i class="fa fa-unlock-alt"></i>&nbsp;&nbsp;Password</i></h3>
                        <input type="password" class="pwd">
                        <div class="zhuangtai" style="opacity:0">
                            <input type="checkbox"> Remember
                        </div><!--zhuangtai/-->
                        <button type="button" id="login">Login</button>
                        <button type="reset">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <canvas id="canvas" style="position: absolute;top: 0;left: 0;z-index: 0;width: 100%;height: 100%;pointer-events: none;"></canvas>
    <script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
    <script src="/fireworks/static/cenu_js/login.js"></script>
    <script>
    	var name=null;
    	var pwd=null;
    	
    	$("#login").click(function(){
    		name=$(".name").val();
        	pwd=$(".pwd").val();
    	/* 	console.log(name) */
    		 $.ajax({
            	type:"get",
                url:"/fireworks/toLogin",
                dataType:"json",
                data:{"account":name,"pwd":pwd},
                success:function(states){
                	 console.log(states); 
                	if(name==''||pwd==''){
                		alert("账号密码不能为空");
                	}else{
                		/*  1去到主页 、2 去到管理系统主页 、3用户名或密码错误 、4 账号或密码不能为空  */
                    	if(states==1){
                    		window.location.href="/fireworks/index.jsp"; 
                    	}else if(states==2){
                    		
                    	}else if(states==3){
                    		alert("用户名或者密码错误");
                    	}else if(states==4){
                    		alert("账号密码不能为空");
                    	}
                	}
                },
                error:function(err){
                	console.log("ajax调用失败");
                }
            }) 
    	})
    	
    </script>
</body>
</html>