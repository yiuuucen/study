<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>register</title>
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
                    还没有账户？<a href="/fireworks/login">登录</a>
                </div>
            </div>
        </div>
        <div class="center cl">
            <div class="container">
                <div class="loginform">
                    <form action="" method="get" class="loginRight">
                        <h2>Sign up</h2>
                        <h3><i class="fa fa-user"></i>&nbsp;Username</i></h3>
                        <input type="text" class="name" id="name">
                        <h3><i class="fa fa-phone"></i>&nbsp;Telephone</i></h3>
                        <input type="text" id="tel">
                        <h3><i class="fa fa-unlock-alt"></i>&nbsp;&nbsp;Password</i></h3>
                        <input type="password" class="pwd" id="p1">
                        <h3>Repeat Password</i></h3>
                        <input type="password" class="pwd" id="p2">
                        <button type="button" id="ok">Register</button>
                        <button type="reset">Reset</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="tishi">
            <div class="tishicont">
                <img src="/fireworks/static/cenu_img/icon-error.png" alt="">
                <p>请您填写完整的信息</p>
            </div>
        </div>
    </div>
    <canvas id="canvas" style="position: absolute;top: 0;left: 0;z-index: 0;width: 100%;height: 100%;pointer-events: none;"></canvas>
    <script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
    <script src="/fireworks/static/cenu_js/login.js"></script>
<script>
        //console.log($('#tel').val());
        var name=null;
        var tel=null;
        var p1=null;
        var p2=null;
        function showMsg(tuUrl,message){
            $('.tishi').css('display','block');
            $('.tishicont>img').attr('src',tuUrl);
            $('.tishicont>p').html(message);
        }
        function order(name,tel,p1,p2) {
            if (name == "") {
                showMsg('/fireworks/static/cenu_img/icon-error.png','请您输入名字');
                return false;
            }
            if (p1 == "" ) {
                showMsg('/fireworks/static/cenu_img/icon-error.png','请您输入密码');
                return false;
            }
            if (p2 == "") {
                showMsg('/fireworks/static/cenu_img/icon-error.png','请您再次输入密码');
                return false;
            }
            if (tel.trim().length == 0) {
                showMsg('/fireworks/static/cenu_img/icon-error.png','请输入您的手机号');
                return false;
            }
            if (!(/^1[123456789][0-9]{9}$/).test(tel)) {
                showMsg('/fireworks/static/cenu_img/icon-error.png','请正确输入手机号');
                return false;
            }
            if(p1!=p2){
                showMsg('/fireworks/static/cenu_img/icon-error.png','两次输入的密码不同');
                return false;
            }
            else{
                $.ajax({
                	type:"get",
                    url:"/fireworks/toRegister",
                    dataType:"json",
                    data:{"account":name,"pwd":p1,"phone":tel},
                    success:function(states){
                    	console.log(states); 
                    	
                    	switch(states){
                    	case 1:
                    		showMsg('/fireworks/static/cenu_img/icon-success.png','注册成功');
                    		setTimeout(function(){
                    			window.location.href="/fireworks/login";
                    		},2500);
                    		break;
                    	case 2:
                    		console.log("系统崩溃");
                    		break;
                    	case 3:
                    		alert("用户已存在");
                    		break;
                    	}
                    	
                    },
                    error:function(err){
                    	console.log("ajax调用失败");
                    }
                })
            }
        }
        $('#ok').click(function(){
            name=$('#name').val();
            tel=$('#tel').val();
            p1=$('#p1').val();
            p2=$('#p2').val();

            order(name,tel,p1,p2);
            setTimeout(function(){
                $('.tishi').css('display','none');
            },2000)
        });

//       
</script>
</body>
</html>