<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
</head>
<body>
	<div class="index">
		<div class="header">
			<div class="container heade">
				<div class="head-left">
					<ul>
						<li></li>
						<li><a href="">首页</a></li>
						<li><a href="/fireworks/pn/design">作品集</a></li>
						<c:choose>
							<c:when test="${sessionScope.loginUser != null }">
								<li><a href="/fireworks/toUser?id=${sessionScope.loginUser.id}">我的设计</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/fireworks/login">我的设计</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="">关于我</a></li>
					</ul>
				</div>
				<div class="head-right">
				<c:choose>
					<c:when test="${sessionScope.loginUser != null }">
						<img src="${sessionScope.loginUser.headUrl}" alt="">
						<span>${sessionScope.loginUser.account}</span>
						<div class="head-cont">
							<a href="/fireworks/toMys/${sessionScope.loginUser.id}">个人中心</a>
							<a href="">退出</a>
						</div>
					</c:when>
					<c:otherwise>
						<ol>
							<li><a href="/fireworks/login">登录</a></li>
							<li><a href="/fireworks/register">注册</a></li>
						</ol>
					</c:otherwise>
				</c:choose>
					
				</div>
			</div>
		</div>
		<div class="content">
			<div class="container">
				<div class="left">
					<div class="banner">
					    <div class="tup">
					        <ul>
					            <li><a href="/fireworks/static/cenu_html/FullCircleFirework.html" target="_blank"></a></li>
					            <li><a href="/fireworks/static/cenu_html/PlanetCircleFirework.html" target="_blank"></a></li>
					            <li><a href="/fireworks/static/cenu_html/DoubleFullCircleFirework.html" target="_blank"></a></li>
					            <li><a href="/fireworks/static/cenu_html/makeCircleFirework.html" target="_blank"></a></li>
					            <li><a href="/fireworks/static/cenu_html/HeartFirework.html" target="_blank"></a></li>					        
					        </ul>
					    </div>
					    <div class="ann">
					        <ul>
					            <li><a href="/fireworks/static/cenu_html/FullCircleFirework.html" target="_blank">1</a></li>
					            <li><a href="/fireworks/static/cenu_html/PlanetCircleFirework.html" target="_blank">2</a></li>
					            <li><a href="/fireworks/static/cenu_html/DoubleFullCircleFirework.html" target="_blank">3</a></li>
					            <li><a href="/fireworks/static/cenu_html/makeCircleFirework.html" target="_blank">4</a></li>
					            <li><a href="/fireworks/static/cenu_html/HeartFirework.html" target="_blank">5</a></li>			         
					        </ul>
					    </div>
					</div>
				</div>
				<div class="right">
					<h3>INTRODUCE</h3>
					<p>烟花又称花炮、烟火、焰火，中国劳动人民较早发明，常用于盛大的典礼或表演中，而现代全中国以及到全世界唯一能在同天同活动里施放烟花的活动则为跨年（除夕夜）活动。</p>
					<p>此网站主要服务于所有爱好烟花者，在这里，你可以任意设计出你喜欢的烟花形状，也可以看到许多好的烟花设计。JOIN US</p>
				</div>
			</div>
		</div>
	</div>
	<script>

		var timer1;
		// 每次加载首页，首页的颜色都会随机生成
		$(".header .head-left ul li:nth-child(2)>a").css("color",getRandomColor);
		// 获取屏幕高度-head-foot
		var h= $(window).height();
		$(".content").height(h-70);

		$(".head-right img").mouseover(function(){
			$(".head-right .head-cont").css("display","block");
		})
		$(".head-right .head-cont").mouseover(function(){
			clearInterval(timer1);
		})
		$(".head-right img").mouseout(function(){
			clearInterval(timer1);
			timer1=setInterval(function(){
			$(".head-right .head-cont").css("display","none");
			},2000)
		})
		$(".head-right .head-cont").mouseout(function(){
			clearInterval(timer1);
			timer1=setInterval(function(){
			$(".head-right .head-cont").css("display","none");
			},2000)
		})
		//banner图效果
		function change_banner(num){
		    //获取当前显示图片的索引；
		    //让下一张图片显示

		    var li_index = $(".tup li:visible").index();
		    var next_li_index=li_index+1;
		    if(next_li_index==$('.tup li').length){
		        next_li_index=0
		    };
		    $('.ann li').removeClass('dActive');
		    $('.ann li').eq(next_li_index).addClass('dActive');
		    $(".tup li").hide();
		    $(".tup li").eq(next_li_index).fadeIn(0);

		};

		//轮播初始化图片
		$('.tup li').hide();
		$('.tup li').eq(0).fadeIn(0);
		$('.ann li').removeClass('dActive');
		$('.ann li').eq(0).addClass('dActive');

		//悬浮事件
		var ann_interval=null;

		    $('.ann li').mouseover(function(){
		        clearInterval(ban_interval);
		        clearInterval(ann_interval);
		        var an_index=$(this).index();
		        $('.ann li').removeClass('dActive');
		        $('.ann li').eq(an_index).addClass('dActive');
		        $('.tup li').hide();
		        $('.tup li').eq(an_index).fadeIn(0);
		    })
		    $('.ann li').mouseleave(function(){
		        clearInterval(ban_interval);
		        clearInterval(ann_interval);
		        //这个定时器一直忘了清除，导致浪费3个小时！！！
		        ann_interval=setInterval('change_banner()',3000);
		    })
		    var ban_interval=setInterval('change_banner()',3000);
	</script>
</body>
</html>