<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
	<script src="/fireworks/static/cenu_js/lib/jquery.pagination.js"></script>
</head>
<body> 
	<div class="person">
		<div class="fixleft">
			<div>
				<!-- h5表示姓名 -->
				<h5>${sessionScope.loginUser.account }</h5>
				<img src="${sessionScope.loginUser.headUrl }" alt="">
				<!-- h3表示职业 -->
				<h3>${sessionScope.loginUser.userInfo.profession}</h3>
				<!-- h4表示目前居住地 -->
				<h4>${sessionScope.loginUser.userInfo.address }</h4>
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
				<h4>${sessionScope.loginUser.userInfo.hobby}</h4>
			</div>
			<div>
				<h3>联系方式</h3>
				<h4>QQ:<span>${sessionScope.loginUser.userInfo.qq}</span></h4>
				<h5>TEL:<span>${sessionScope.loginUser.phone}</span></h5>
			</div>
			<div>
				<h3>介绍自己</h3>
				<p>${sessionScope.loginUser.userInfo.idiograph}</p>
			</div>
		</div>
		<div class="nofixright">
			<div class="zptop">
				<span>首页</span>
				<span>项目</span>
				<span>设计</span>
				<span>个人</span>
			</div>
			<div class="personMsg">
				<img src="/fireworks/static/cenu_img/my-design-img/tou.jpg" alt="">
				<div>
					<span>姓名:</span>
					<input type="text" my-data="name" value="${sessionScope.loginUser.account }">
				</div>
				<div>
					<span>职业:</span>
					<input type="text" my-data="profession" value="${sessionScope.loginUser.userInfo.profession }">
				</div>
				<div>
					<span>居住地:</span>
					<input type="text" my-data="address" value="${sessionScope.loginUser.userInfo.address }">
				</div>
				<div>
					<span>擅长爱好:</span>
					<input type="text" my-data="hobby" value="${sessionScope.loginUser.userInfo.address }">
				</div>
				<div>
					<span>TEL:</span>
					<input type="text" my-data="tel" value="${sessionScope.loginUser.phone }">
				</div>
				<div>
					<span>QQ:</span>
					<input type="text" my-data="qq" value="${sessionScope.loginUser.userInfo.qq }">
				</div>
				<div>
					<span>介绍自己:</span>
					<textarea name=""  cols="30" rows="10" id="idiograph">${sessionScope.loginUser.userInfo.idiograph}</textarea>
				</div>
				<div>
					<span></span>
					<h3 id="tijiao" onclick="tiJaio(${sessionScope.loginUser.id})">提交</h3>
				</div>
			</div>
		</div>
	</div>
	<script>
		
		$(".zptop span").click(function(){
			if($(this).html()=="首页"){
				window.location.href = "/fireworks/index.jsp";
			}else if($(this).html()=="项目"){
				window.location.href = "/fireworks/my/my-design";
			}else if($(this).html()=="设计"){
				window.location.href = "/fireworks/my/make-detail";
			}else if($(this).html()=="个人"){
				window.location.href = "/fireworks/my/person";
			}
		})
		function tiJaio(id){
			var name;
			var profession;
			var address;
			var hobby;
			var tel;
			var qq;
			var idiograph;
			name=$("input[my-data='name']").val();
			address=$("input[my-data='address']").val();
			profession=$("input[my-data='profession']").val();
			hobby=$("input[my-data='hobby']").val();
			tel=$("input[my-data='tel']").val();
			qq=$("input[my-data='qq']").val();
			idiograph=$("#idiograph").val();
			
			$.ajax({
				type:"get",
                url:"/fireworks/updateUser",
                dataType:"json",
                data:{"account":name,"profession":profession,"address":address,"hobby":hobby,"phone":tel,"qq":qq,"idiograph":idiograph,"id":id},
                success:function(data){
                	console.log(data);
                	if(data==1){
                		 location.reload(); 
                	}else if(data==3){
                		alert("该用户名已存在");
                	}
                }
			})
		}
	




	</script>
</body>
</html>