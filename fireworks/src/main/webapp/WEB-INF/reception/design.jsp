<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<a href="/fireworks/logout">退出</a>
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
						<span class="gerenMsg"><b style="color: #00fff6;">By</b><a href="">Cheng hu</a></span>
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

		var timer1;
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
			create(1,8,"p.createTime");
			if($(this).attr("data-val")==1){
				// $(this).css("background","#ffeb3b");
				$.ajax({
				type:"get",
			    url:"/fireworks/production/getProCount2",  
			    dataType:"json",
			    success:function(data){	
			    	// 分页的配置
					$('.M-box').pagination({
						pageCount:(data/8),
			            totalData:data,
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
					       // console.log(index.getCurrent());
					        create(index.getCurrent(),8,"p.createTime");
					    }
					}, function (api) {
			    		
					}); 
			    }
			})
			}else if($(this).attr("data-val")==2){
				create(1,8,"p.like_num");
				$.ajax({
					type:"get",
				    url:"/fireworks/production/getProCount2",  
				    dataType:"json",
				    success:function(data){	
				    	// 分页的配置
						$('.M-box').pagination({
							pageCount:(data/8),
				            totalData:data,
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
						       // console.log(index.getCurrent());
						        create(index.getCurrent(),8,"p.like_num");
						    }
						}, function (api) {
				    		
						}); 
				    }
				})	
			}else if($(this).attr("data-val")==3){
				create(1,8,"p.view_num");
				$.ajax({
					type:"get",
				    url:"/fireworks/production/getProCount2",  
				    dataType:"json",
				    success:function(data){	
				    	// 分页的配置
						$('.M-box').pagination({
							pageCount:(data/8),
				            totalData:data,
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
						       // console.log(index.getCurrent());
						       create(index.getCurrent(),8,"p.view_num");
						    }
						}, function (api) {
				    		
						}); 
				    }
				})	  
			}
		})


		$(".gerenMsg").click(function(){
			window.location.href = "/fireworks/my/my-design.html";
			// alert(1);
		})
		//作品生成初始化
		create(1,8,'p.createTime');
		function create(pn,pageSize,byThis){
			$.ajax({
				type:"get",
		        url:"/fireworks/production/findAllProduction2",
		        data:{"deleteState":1,"pn":pn,"pageSize":pageSize,"byThis":byThis},
		        dataType:"json",
		        success:function(data){
		        	$(".zuopin").html('');
	        		 for(var i=0;i<data.length;i++){
	        			var html='<div class="zp"><a href="/fireworks/production/showProduction?id='+data[i].id+'" target="_blank"></a><img style="width: 245px;height: 164px;" src="'+data[i].imgurl+'" alt=""><h3>'+data[i].pro_name+'</h3><span><b style="color: #00fff6;">By</b><a style="position: relative;height: 30px;margin: 0 0 0 20px;color: #000;" href="/fireworks/toUser?id='+data[i].user_id+'"> '+data[i].user.account+'</a></span><h5>'+changeTime(data[i].createTime)+'</h5><div class="zp-bottom"><img src="/fireworks/static/cenu_img/design-img/zan01.png" alt=""><span>'+data[i].like_num+'</span><img src="/fireworks/static/cenu_img/design-img/see.png" alt=""><span>'+data[i].view_num+'</span></div><div class="zp-change"></div></div>';
	        			$(".zuopin").append(html);
	        		 } 
		        }
			})
		}
		$.ajax({
			type:"get",
	        url:"/fireworks/production/getProCount",  
	        dataType:"json",
	        success:function(data){
	        	// 分页的配置
				$('.M-box').pagination({
					pageCount:(data/8),
		            totalData:data,
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
				       // console.log(index.getCurrent());
				       //作品生成初始化
				
				       create(index.getCurrent(),8,'p.createTime');
				    }
				}, function (api) {
		    		
				});
	        }
		})
		
		
		
		
		//将时间戳换成日期
		function changeTime(time){
			var date = new Date(time);
			Y = date.getFullYear() + '-';
			M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
			D = date.getDate()<10 ? '0'+date.getDate():date.getDate()+'';
			h = date.getHours() + ':';
			m = date.getMinutes() + ':';
			s = date.getSeconds(); 
			return Y+M+D+' '+h+m+s;
			//console.log(Y+M+D+h+m+s);
		}
		
		
	</script>
</body>
</html>