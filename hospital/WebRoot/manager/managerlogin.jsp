<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doctorlogin.jsp' starting page</title>
    
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
			<div id="doclogin">
			<img src="manager/img/magpage.jpg" id="docimg">
			<hr style="margin-top: -4px;" />
			<table align="center" cellspacing="15px">
				<tr>
					<td>账号:</td>
					<td><input type="text" name="user" id="user" value="" / placeholder="请输入账号" style="height: 20px; width: 180px;"></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="pwd" id="pwd" value="" placeholder="请输入密码" style="height: 20px; width: 180px;"/></td>
				</tr>
				<tr>
				<td colspan="2">
					<input type="button" id="" class="button" value="登录"/>
					<input type="button" id="" class="button" value="返回主选单" onclick="window.location.href='manager/mainpage.jsp'"/>
				</td>
				</tr>
			</table>
			</div>
		</div>
  </body>
</html>
