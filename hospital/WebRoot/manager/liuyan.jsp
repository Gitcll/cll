<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta charset="UTF-8">
		<title></title>
		<script>
		window.onload = function(){

			var oText = document.getElementById('text1'),
				oBtn = document.getElementById('btn'),
				oUl = document.getElementById('ul1'),
				n = 5; //此处可以设置保留条目的数量

			oBtn.onclick = function(){

				if (!oText.value){
					return;
				}

				var oLi = document.createElement('li');
				oLi.innerHTML = oText.value;

				if (oUl.children[0]) {
					oUl.insertBefore(oLi, oUl.children[0]);
				} else {
					oUl.appendChild(oLi);
				}

				if (oUl.children[n]){
					oUl.removeChild(oUl.children[n]);
				}

				oText.value = '';

			}

		}
	</script>
	<style>
		#d{
			width: 780px;
			height:1000px;
			margin: auto;
			background-color:white;
		}
		#d1{
			width: 780px;
			height: 300px;
			background-color: #C0A16B;
			text-align: center;
			position: relative;
		}
		#d2{
			width: 780px;
			height: 800px;
			position: absolute;
			top: 305px;
			font-size: 18px;
		}
		#text1{
			width: 500px;
			height: 150px;
			font-size: 20px;
			font-family: 楷体;
		}
		#btn{
			float: right;
			width: 90px;
			height: 40px;
			position: absolute;
			margin-top: 200px;
			margin-left: 50px;
			border-top-left-radius: 80px;
			border-bottom-right-radius: 80px;
			outline:medium;
			font-family: 楷体;
			font-size: 18px;
			background-image: url(img/bt1.jpg);
		}
	</style>
	</head>
	<body>
		<div id="d">
			<div id="d1">
				<h2>匿名留言板</h2>
				<textarea id="text1"></textarea>
				<input type="button" id="btn" value="发表" />
			</div>	
			<div id="d2">
				<ul id="ul1"></ul>
			</div>
		</div>
	</body>
</html>
