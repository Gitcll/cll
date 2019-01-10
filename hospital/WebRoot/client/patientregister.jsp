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
		<link rel="stylesheet" type="text/css" href="css/container_style.css"/>
		<link rel="icon" href="img/favicon.ico" type="img/favicon.ico" />
		<link rel="shortcut icon" href="img/favicon.ico" type="img/favicon.ico" />
		<script type="text/javascript" src="js/container.js"></script>
		<script type="text/javascript" >
		
		function rand(){
			var time = new Date().getTime();
			var img = document.getElementById("img");
			img.src = "/hospital/yanzhengmaServlet?time"+time;
		}
		</script>
	</head>
	<body>
  <script type="text/javascript" color="255,0,60" opacity='0.7' zIndex="-1" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<div class="centent">
	<div class="login_logo">
	
	<!--<span>注册</span>-->
</div>
	<div class="container">
		<ul>
			<li>
				<span>注册</span>
				<!--<em><a href="#">x</a></em>-->
			</li>
			<li>
				<form action="/hospital/PatientRegisterServlet">
					
					<input type="text" name="username" class="text_ipone text" placeholder="姓名" value="" /><br /><br />
					<input type="text" name="userlogin" class="text_ipone text" placeholder="可识别的用户名" value="" /><br />
					<input type="text" name="yanzhengma" class=" text_pass text" style="width:160px"  placeholder="验证码" value="" style=""/>
					<img id="img" src = "/hospital/yanzhengmaServlet"  style="margin-top:12px"><a href="javascript:rand();">看不清</a><br>
					
					<input type="text" name="sex" class="text_user text" placeholder="性别" value="" /><br />
					
					<input type="password" name="pwd" class="text_pass text" placeholder="密码" value="" /><br />
					
					<input type="submit" name="" class="btn2" value="注册" /><br />
				</form>
			</li>
			<li>
				<strong class="account">已有账号?<a href="login.jsp">&nbsp;登录</a></strong>
				<strong class="disclaimer">同意<a href="http://www.qyer.com/htmlpages/member.html">会员条款</a>和<a href="http://www.qyer.com/htmlpages/exemption.html">免责声明</a></strong>
			</li>
		</ul>
	</div>
</div>


<div id="footer">
			<div class="footer_contact">
				<ul>
					<strong>|&nbsp;&nbsp;<span>关于我们</span></strong>
					<li>
						<a href="#">医院简介</a>
					</li>
					<li>
						<a href="#">联系我们</a>
					</li>
					<li>
						<a href="#">合作伙伴</a>
					</li>
				</ul>
				<ul>
					<strong>|&nbsp;&nbsp;<span>加入我们</span></strong>
					<li>
						<a href="#">招聘职位</a>
					</li>
				</ul>
				<ul>
					<strong>|&nbsp;&nbsp;<span>网站条款</span></strong>
					<li>
						<a href="#">会员条款</a>
					</li>
					<li>
						<a href="#">社区指南</a>
					</li>
					<li>
						<a href="#">版权声明</a>
					</li>
					<li>
						<a href="#">免责声明</a>
					</li>
				</ul>
				<ul>
					<strong>|&nbsp;&nbsp;<span>帮助中心</span></strong>
					<li>
						<a href="#">新手上路</a>
					</li>
					<li>
						<a href="#">使用帮助</a>
					</li>
					<li>
						<a href="#">网站地图</a>
					</li>
					<li>
						<a href="#">旅行工具</a>
					</li>
				</ul>
				<ul>
					<strong>|&nbsp;&nbsp;<span>关注我们</span></strong>
					<li>
						<a href="#">新浪</a>
					</li>
					<li>
						<a href="#">人人</a>
					</li>
					<li>
						<a href="#">google</a>
					</li>
					<li>
						<a href="#">facebook</a>
					</li>
				</ul>
				<div class="footer_statement">
					<!--<a href="index.html"><img src=" img/logo_gray_r.png"/></a>-->
					<p>2004-2018 © 中软医院® qyer.com All rights reserved. Version v5.57
						<a href="#"> 京ICP备12003524号</a> 京公网安备11010102001935  京ICP证140673号 
						<a href="#">营业执照 </a>
						<a href="#"> 经营许可证 </a>
						<br />
						
					</p>
					
				</div>
				
			</div>
			
		</div>
	
	</body>
</html>
