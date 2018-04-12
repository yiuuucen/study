<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>项目</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
	<script src="/fireworks/static/cenu_js/lib/jquery.pagination.js"></script>
</head>
<body> 
	<div class="my-design">
		<div class="fixleft">
			<div>
				<!-- h5表示姓名 -->
				<h5>${sessionScope.spaceUser.account }</h5>
				<img src="${sessionScope.spaceUser.headUrl }" alt="">
				<!-- h3表示职业 -->
				<h3>${sessionScope.spaceUser.userInfo.profession}</h3>
				<!-- h4表示目前居住地 -->
				<h4>${sessionScope.spaceUser.userInfo.address }</h4>
			</div>
			<div>
				<div>
					<img src="/fireworks/static/cenu_img/design-img/see.png" alt=""><span>项目人气</span></img><em>9247</em>
				</div>
				<div>
					<img src="/fireworks/static/cenu_img/design-img/zan01.png" alt=""><span>得赞数</span></img><em>666</em>
				</div>
				<div>
					<img src="/fireworks/static/cenu_img/design-img/zan02.png" alt=""><span>作品数</span></img><em>123</em>
				</div>
				<div>
					<img src="/fireworks/static/cenu_img/design-img/zan02.png" alt=""><span>----</span></img><em>---</em>
				</div>
			</div>
			<div>
				<h3>擅长爱好</h3>
				<h4>${sessionScope.spaceUser.userInfo.hobby}</h4>
			</div>
			<div>
				<h3>联系方式</h3>
				<h4>QQ:<span>${sessionScope.spaceUser.userInfo.qq}</span></h4>
				<h5>TEL:<span>${sessionScope.spaceUser.phone}</span></h5>
			</div>
			<div>
				<h3>介绍自己</h3>
				<p>${sessionScope.spaceUser.userInfo.idiograph}</p>
			</div>
		</div>
		<div class="nofixright">
			<c:choose>
				<c:when test="${sessionScope.loginUser.id}==${sessionScope.spaceUser.id}">
					<div class="zptop">
						<span><a href="/fireworks/index.jsp">首页</a></span>
						<span><a href="/fireworks/toUser?id=${sessionScope.loginUser.id}">项目</a></span>
						<span><a href="/fireworks/my/make-detail">设计</a></span>
						<span><a href="/fireworks/my/person">个人</a></span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="zptop">
						<span><a href="/fireworks/index.jsp">首页</a></span>
						<span><a href="/fireworks/toUser?id=${sessionScope.spaceUser.id}">项目</a></span>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="zpbottom">
				<div class="zuopin">
					<div class="zp">
						<a href="/fireworks/pn/detail" target="_blank"></a>
						<img src="/fireworks/static/cenu_img/design-img/zp01.png" alt="">
						<!-- <p>设计出心型的烟花，当它在天上绽放的时候，会有很好的视觉效果，可用于情侣之间。</p> -->
						<!-- h3表示作品名 -->
						<h3>heart-心-heart</h3>
						<!-- span表示作者名 -->
						<span><b style="color: #00fff6;">By</b> Cheng hu</span>
						<!-- h5表示作品时间 -->
						<h5>2018-03-24</h5>
						<div class="zp-bottom">
							<!-- 第一个span表示点赞数 -->
							<img src="/fireworks/static/cenu_img/design-img/zan01.png" alt=""><span>35</span>
							<!-- 第二个span表示浏览数 -->
							<img src="/fireworks/static/cenu_img/design-img/see.png" alt=""><span>888</span>
						</div>
						<div class="zp-change">
							<div class="zp-xiugai">修改</div>
							<div class="zp-del">删除</div>
						</div>
					</div>
					
					
				</div>
				<div class="fenye M-box"></div>
			</div>
		</div>
	</div>
	<script>
	
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
		
		changeZp(1,8,'p.createTime');
		function changeZp(pn,pageSize,byThis){
			$.ajax({
				type:"get",
	        	url:"/fireworks/production/findAllProduction",
	        	dataType:"json",
	        	data:{"deleteState":1,"pn":pn,"pageSize":pageSize,"byThis":byThis},
	        	success:function(data){
	        		 /* console.log(data);  */
	        		 $(".zuopin").html('');
	        		 for(var i=0;i<data.length;i++){
	        			var html='<div class="zp"><a href="/fireworks/pn/detail" target="_blank"></a><img style="width: 245px;height: 164px;" src="'+data[i].imgurl+'" alt=""><h3>'+data[i].pro_name+'</h3><span><b style="color: #00fff6;">By</b> '+data[i].user.account+'</span><h5>'+changeTime(data[i].createTime)+'</h5><div class="zp-bottom"><img src="/fireworks/static/cenu_img/design-img/zan01.png" alt=""><span>'+data[i].like_num+'</span><img src="/fireworks/static/cenu_img/design-img/see.png" alt=""><span>'+data[i].view_num+'</span></div><div class="zp-change"><div class="zp-xiugai">修改</div><div class="zp-del">删除</div></div></div>';
	        			$(".zuopin").append(html);
	        		 } 
	        	}
			})
		}
	
		//取得作品数量
		$.ajax({
			type:"get",
	        url:"/fireworks/production/getProCount",
	        dataType:"json",
	        success:function(data){
	        	/* console.log(data); */ 
	        	// 分页的配置
	    		$('.M-box').pagination({
	                totalData:data,
	                showData:6,
	                mode:'fixed',
	                coping:true,
	                isHide:true,
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
	        }
		})
		 

	</script>
</body>
</html>