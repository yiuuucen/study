<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>作品集</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
	<script src="/fireworks/static/cenu_js/lib/jquery.pagination.js"></script>
</head>
<body> 
	<div class="design">
		<div class="header">
			<div class="container heade">
				<div class="head-left">
					<ul>
						<li></li>
						<li><a href="/fireworks/index.jsp">首页</a></li>
						<li><a href="">作品集</a></li>
						<li><a href="/fireworks/my/make-detail">我的设计</a></li>
						<li><a href="">关于我</a></li>
					</ul>
				</div>
				<div class="head-right">
					<c:choose>
						<c:when test="${sessionScope.loginUser != null }">
							<img src="${sessionScope.loginUser.headUrl}" alt="">
							<span>${sessionScope.loginUser.account}</span>
							<div class="head-cont">
								<a href="/fireworks/my/person">个人中心</a>
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
		<div class="fixbg"></div>
		<div class="content">
			<div class="container">
				<div class="shaixuan">
					<b>排序</b>
					<span data-val="1">作品时间</span>
					<span data-val="2">点赞数</span>
					<span data-val="3">浏览数</span>
				</div>
				<div class="zuopin">
					<div class="zp">
						<a href="/fireworks/pn/detail.html" target="_blank"></a>
						<img src="/fireworks/static/cenu_img/design-img/zp01.png" alt="">
						<!-- <p>设计出心型的烟花，当它在天上绽放的时候，会有很好的视觉效果，可用于情侣之间。</p> -->
						<!-- h3表示作品名 -->
						<h3>heart-心-heart</h3>
						<!-- span表示作者名 -->
						<span class="gerenMsg"><b style="color: #00fff6;">By</b> Cheng hu</span>
						<!-- h5表示作品时间 -->
						<h5>2018-03-24</h5>
						<div class="zp-bottom">
							<!-- 第一个span表示点赞数 -->
							<img src="cenu_img/design-img/zan01.png" alt=""><span>35</span>
							<!-- 第二个span表示浏览数 -->
							<img src="cenu_img/design-img/see.png" alt=""><span>888</span>
						</div>
					</div>
						
				</div>
				<div class="fenye M-box"></div>
			</div>
		</div>
	</div>
	<script>
		// 每次加载首页，首页的颜色都会随机生成
		$(".header .head-left ul li:nth-child(3)>a").css("color",getRandomColor);

		$(".design .content .zuopin .zp").css("border-color",getRandomColor);


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
		
		//排序功能
		$(".shaixuan span").click(function(){
			console.log($(this).attr("data-val"));
			if($(this).attr("data-val")==1){
				// $(this).css("background","#ffeb3b");
			}else if($(this).attr("data-val")==2){
				// $(this).css("background","#ffeb3b")
			}else if($(this).attr("data-val")==3){
				// $(this).css("background","#ffeb3b")
			}
		})


		$(".gerenMsg").click(function(){
			window.location.href = "/fireworks/my/my-design.html";
			// alert(1);
		})
		// 分页的配置
		$('.M-box').pagination({
			pageCount:56,
            totalData:765,
            showData:8,
            mode:'fixed',
            coping:true,
            homePage:"首页",
            endPage:"尾页",
            keepShowPN:true,
            prevContent:'<',
            nextContent:'>',
            jump:true,
		    callback: function (index) {
		        // $('.now').text(api.getCurrent());
		        // console.log(index);
		        console.log(index.getCurrent());
		    }
		}, function (api) {
    		
		}); 
	</script>
</body>
</html>