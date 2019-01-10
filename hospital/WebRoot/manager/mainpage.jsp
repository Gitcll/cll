<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainpage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="manager/css/mainwindow.css">
	
  </head>
  
  <body>
    <div id="main">
			<p>&nbsp;<img src="manager/img/hong.jpg" id="hong"> <span style="color: #708090;">医院管理系统</span></p>
			<img src="manager/img/back.jpg" id="back"/>
			<h1 align="center" style="font-size: 65px;">医院管理系统</h1>
			<div id="center">
			<div id="manager">
				<img src="manager/img/manager.png" class="login"/></br>
				<button class="button" onclick="window.location.href='manager/managerlogin.jsp'">管理员登录</button>
			</div>
			<div id="doctor">
				<img src="manager/img/doctor.png" class="login"/></br>
				<button class="button" onclick="window.location.href='manager/doctorlogin.jsp'">医生登录</button>
			</div>
			</div>
		</div>
  </body>
</html>
