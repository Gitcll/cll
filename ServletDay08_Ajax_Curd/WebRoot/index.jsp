<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.11.0.js" charset="utf-8"></script>
	 
	 <script type="text/javascript">
	    function find(url)
	    {
	    	document.getElementById("name").value="";
	    	document.getElementById("pwd").value="";  
	    	alert("xx");
	    	$.ajax({
	    		type:"post",
	    		url:url,
	    		datatype:"json",
	    		success:function(data){
	    			data = eval("("+data+")")
	    			var html="";
	    			//删除表格第一行的内容
	    			$("table tr:not(:first)").remove();
	    		   for(var i = 0; i < data.length;i++)
	    			   {
	    			     html += "<tr id="+i+">"; 
	    			         $.each(data[i],function(j,val){
	    			        	 html+="<td>"+val+"</td>";
	    			        	
	    			        	 if(j == "id")
	    			        		 {
	    			  html+="<td><a href='javascript:void(0)' onclick=del('DeleteServlet?id=" +val+"')>删除</a></td>" ;
	    			        		html+="<td><a href='javascript:void(0)' onclick=del('UpdateServlet?id=" +val+"')>更新</a></td>";
	    			        		 }
	    			         });
	    			   html+="</tr>";
	    			  
	    			   }
	    		   $("#first").after(function(){
	    			   return html;
	    		   });
	    		}
	    	});
	    }
	 
	    function addUser(url)
	    {
	    	var name = document.getElementById("name").value;
	    	var pwd = document.getElementById("pwd").value;  
	    	$.ajax({
	    		type:"post",
	    		url:url,
	    		data:{
	    			  "name":name,
	    			   "pwd":pwd
	    		     },
	    		datatype:"json",
	    		success:function(data){
	    			$("p").html(data);
	    		}
	    	});
	    	find("findAll");
	    }
	 
	 </script>
	
	
  </head>
  
  <body onload="find('findAll')">
   <input id="id" type="text" hidden="hidden">
      用户名:<input type="text"  id="name">
      密&nbsp;码<input type="password"  id="pwd">
    <br>
    <input type="button" value="新增" onclick="addUser('AddServlet')">
     <input type="button" value="更新" onclick="updateUser()">
    <p></p>
    <h1>用户页面显示</h1>
    <table>
      <tr id="first">
        <td>ID</td>
        <td>用户名</td>
        <td>密码</td>
        <td>删除</td>
        <td>更新</td>
        </tr>
    </table>
  </body>
</html>
