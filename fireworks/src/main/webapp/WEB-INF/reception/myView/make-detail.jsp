<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>作品设计</title>
	<link rel="shortcut icon" href="/fireworks/static/cenu_img/hh.ico">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/reset.css">
	<link rel="stylesheet" href="/fireworks/static/cenu_css/style.css">
	<script src="/fireworks/static/cenu_js/jquery-3.2.1.min.js"></script>
	<script src="/fireworks/static/cenu_js/index.js"></script>
	<style type="text/css">
		#cavs{
			border: 1px solid #CC6600;   
			border-radius:25px;
			box-shadow: 10px 10px 5px #888888;
			margin: 0 0 0 25%;
		}
		#kuang{
			width:800px;
			height: 50px;
			margin: 20px auto;	
			border-radius:25px;
			box-shadow: 10px 10px 5px #888888;	
		}
		#k1{
			float: left;
			margin-left: 43px;
		}
		.button {
		    background-color: #F9D448; /* 土黄色 */
		    border: none;
		    color: white;
		    padding: 6px 15px;
		    text-align: center;
		    border-radius:25px;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 16px;
		    margin: 4px 2px;
		    cursor: pointer;
		    -webkit-transition-duration: 0.4s; /* Safari */
		    transition-duration: 0.4s;
		}
		.button2:hover {
	    	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
		}
		</style>
</head>
<body> 
	<div class="make-detail">
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
			<div class="zpdetail">
				 <form enctype="multipart/form-data" method="post"  action="/fireworks/addProduction"> 
					<div>
						<span>作品名:</span>
						<input type="text" placeholder="你的作品名"
						name="pro_name">
					</div>
					<div>
						<span>作品(上传一张你设计好的图):</span>
						<input type="file" name="filename">
					</div>
					<div>
						<span>作品介绍:</span>
						<textarea name="pro_tail" id="zpIntr" cols="30" rows="10"></textarea>
					</div>
					<div>
						<span></span>
						<input  type="submit" value="保存">
					</div>
				</form> 
			</div>
			<h3>你也可以用下面的画图工具绘出你喜欢的烟花样式</h3>
			<canvas id="cavs" width="600" height="342" style=""></canvas>
			<br>
			<div id="kuang">
				<div id="k1">
					<input type="color" id="color" class="button button2">
				</div>
				<div id="k1">
					<input type="button" value="下载" id="xiazai" class="button button2">
				</div>
				<div id="k1">
					<input type="button" value="撤销" id="chexiao" class="button button2">
				</div>
				<div id="k1">
					<input type="button" value="清屏" id="qingping" class="button button2">
				</div>
				<div id="k1">
					<input type="button" value="橡皮" id="xpc" class="button button2">
				</div>
				<div id="k1">
					<input class="button button2" type="range" id="cuxi" value="3" min="0" max="10">
				</div>
			</div>
		</div>
	</div>
	<script>
		var canvas;
		var context;
		var img1=[];
		var canX;
		var canY;
		// 应该左边有固定宽度，鼠标起始位置就应该减去这段宽度
		var mouseadd=$(window).width()*0.25;

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
		
		
		$(function(){
			canvas = $('#cavs')[0];
			context = canvas.getContext('2d');
			canX=canvas.offsetLeft;
			canY=canvas.offsetTop;
			var paint=Object.create(Line);
			context.lineCap="round";
			context.lineJoin="round";
			$('#Line').click(function(event) {
				context.lineWidth = $('#thickness').val();
				paint=Object.create(Line);
				context.strokeStyle = $("#color").val();
				console.log(paint);
			}); 
			$('#xpc').click(function(event) {
				context.lineWidth = $('#thickness').val();
				paint=Object.create(xpc);
				context.strokeStyle = "#FFF";
				console.log(paint);
			});
			$('#qingping').click(function(event) {
				 context.clearRect(0,0,canvas.width,canvas.height);
				
			});
			$('#chexiao').click(function() {
				context.putImageData(img1.pop(),0,0);
			});
			paint.draw();
			$("#xiazai").click(function(event) {
				xiazai.draw();
			});
		});
		var Line={
			name:"line",
			draw:function(){
				var painting = false;
				var p_x;
				var p_y;
				console.log(context.strokeStyle);
				$('#cavs').mousemove(function(e){
					if(painting===true){
						var x = e.pageX-mouseadd;
						var y = e.pageY;
						context.lineTo(x-canX,y-canY);
						context.stroke();
					}
				});
				$('#cavs').mousedown(function(e){
					painting = true;
					p_x = e.pageX-mouseadd;
					p_y = e.pageY;
					context.beginPath();
					context.moveTo(p_x-canX,p_y-canY);
					$('#cavs').css('cursor','pointer');
					
					var imgData=context.getImageData(0,0,canvas.width,canvas.height);
					
					img1.push(imgData);
				});
				$('#cavs').mouseup(function(e){
					painting = false;
					context.closePath();
					$('#cavs').css('cursor','');
					
				});
				$('#cavs').mouseleave(function(e){
					painting = false;
					context.closePath();
					$('#cavs').css('cursor','');
				});
				$("#color").change(function(event) {
					context.strokeStyle = $(this).val();
				});
				$("#cuxi").change(function(event) {
					context.lineWidth = $(this).val();
				});
			}
		}
		var xpc={
			name:"xpc",
			draw:function(){
				var painting = false;
				var p_x;
				var p_y;
				console.log(context.strokeStyle);
				ontext.lineWidth = $("#cuxi").val();
				$('#cavs').mousemove(function(e){
					if(painting===true){
						var x = e.pageX;
						var y = e.pageY;
						context.lineTo(x-canX,y-canY);
						context.stroke();
					}
				});
				$('#cavs').mousedown(function(e){
					painting = true;
					 p_x = e.pageX;
					 p_y = e.pageY;
					 context.beginPath();
					context.moveTo(p_x-canX,p_y-canY);
					$('#cavs').css('cursor','pointer');
				
					var imgData=context.getImageData(0,0,canvas.width,canvas.height);
				
					img1.push(imgData);
				});
				$('#cavs').mouseup(function(e){
					painting = false;
					context.closePath();
					$('#cavs').css('cursor','');
				});
				$('#cavs').mouseleave(function(e){
					painting = false;
					context.closePath();
				});
				$("#cuxi").change(function(event) {
					context.lineWidth = $(this).val();
				});
			}
		}

		var xiazai={
			draw:function(){
			
				var type = 'png';
				var imgData = $('#cavs')[0].toDataURL(type);
				
				 var _fixType = function(type) {
				 	type = type.toLowerCase().replace(/jpg/i, 'jpeg');
				 	var r = type.match(/png|jpeg|bmp|gif/)[0];
				 	return 'image/' + r;
				 };
				
				imgData = imgData.replace(_fixType(type),'image/octet-stream');
				
				 var saveFile = function(data, filename){
				 	var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
				 	save_link.href = data;
				 	save_link.download = filename;

				 	var event = document.createEvent('MouseEvents');
				 	
				 	event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
				 	save_link.dispatchEvent(event);
				 };
				
				var filename = 'yanhua' + (new Date()).getTime() + '.' + type;
				// download
				saveFile(imgData,filename);
		  }
		}

	</script>
</body>
</html>