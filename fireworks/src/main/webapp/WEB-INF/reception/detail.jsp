<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>作品详情</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
	<script src="/fireworks/static/cenu_js/lib/jquery.pagination.js"></script>
</head>
<body> 
	<div class="detail">

		<div class="fixleft">
			<div>
				<!-- h5表示姓名 -->
				<h5>${requestScope.proInfo.user.account}</h5>
				<img src="/fireworks/static/cenu_img/my-design-img/tou.jpg" alt="">
				<!-- h3表示职业 -->
				<h3>${requestScope.userInfo.profession}</h3>
				<!-- h4表示目前居住地 -->
				<h4>${requestScope.userInfo.address}</h4>
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
				<h4>${requestScope.userInfo.hobby}</h4>
			</div>
			<div>
				<h3>联系方式</h3>
				<h4>QQ:<span>${requestScope.userInfo.qq}</span></h4>
				<h5>TEL:<span>${requestScope.proInfo.user.phone}</span></h5>
			</div>
			<div>
				<h3>介绍自己</h3>
				<p>${requestScope.userInfo.idiograph}</p>
			</div>
		</div>
		<div class="nofixright">
			<h3>作品详情</h3>
			<div class="zpdetail">
				<div>
					<span>作品名:</span>
					<h3>${requestScope.proInfo.pro_name}</h3>
				</div>
				<div>
					<span>作品：</span>
					<img src="${requestScope.proInfo.imgurl}" alt="">
				</div>
				<div>
					<span>作品介绍:</span>
					<p>${requestScope.proInfo.pro_tail}</p>
				</div>
				<div>
					<span>作品时间:</span>
					<em>${requestScope.proInfo.createTime}</em>
				</div>
				<!-- <div>
					<span></span>
					<div>删除</div>
				</div> -->
			</div>
		</div>
	</div>
	<script>


	</script>
</body>
</html>