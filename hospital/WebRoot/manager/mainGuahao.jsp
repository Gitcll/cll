<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib     uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>My JSP 'mainGuahaoYY.jsp' starting page</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="tdis is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.11.0.js" charset="utf-8"></script>
	<script type="text/javascript">
		 function find(url){	
			document.getElementById("date").value="";
			document.getElementById("status").value="";
			document.getElementById("grade").value="";
			document.getElementById("visit").value="";		
			var page=document.getElementById("page").value;
			var every=document.getElementById("every").value;
			//分页显示
			$.ajax({
				type:"post",
				url:url,
				datatype:"Json",
				sync:false,
				data:{
					"page":page,
					"every":every
				},
				success:function(data){			
					data=eval("("+data+")");
					var html="";
					var id="";
					//删除除表格第一行的内容
					$("table tr:not(:first)").remove();					
					for(var i = 0;i < data.length;i++){							
						html+="<tr id="+i+">";			
						$.each(data[i],function(j,val){
							html+="<td>"+val+"</td>";					
							if(j=="g_id"){
								id+=val;
							} 
							if(j=="visit"){			
								  html+="<td><a href='javascript:void(0)' onclick=del('delGuahao?id=" +id+"')>删除</a></td>" ;
			        			 //html+="<td><a href='javascript:void(0)' onclick=del('UpdateServlet?id=" +val+"')>更新</a></td>";
							}
						});
						html+="</tr>";	
						id="";
					}
					//html="";
					$("#first").after(function(){
						return html;
					});
				}
			});
		} 		
		$(function(){
			$("#first").css("background","gray");
			$("h1").css("background","skyblue");
		});
		function add(){
			$("#d1").css("display","block");
			$("#d3").css("display","block");
		}
		function exit(){
			$("#d1").css("display","none");	
			$("#d3").css("display","none");
		}
		//增加
	function addGuahao(url){                         
		var date=document.getElementById("date").value;
		var status=document.getElementById("status").value;
		var grade=document.getElementById("grade").value;
		var visit=document.getElementById("visit").value;
		$.ajax({
			type:"post",
			url:url,
			async:false,
			data:{
				"date":date,
				"status":status,
				"grade":grade,
				"visit":visit
			},
			datatype:"json",
			success:function(data){
				$("p").html(data);
			}
		});
		exit();
		find('mainGuahao');
	}	
	//删除
	function del(ths){
		$.ajax({
			type:"post",
			async:false,
			data:{
				"gid":ths
			},
			url:"delGuahao",
			datatype:"json",
			success:function(data){
				$("p").html(data);
			}
		});
		find("mainGuahao");
	} 
	</script>
	<style type="text/css">
		#d1{
			width:500px;
			height:300px;
			background-color:#A9C9E9;
			text-align:center;
			position:absolute;
			top:180px;
			right:140px;
			display:none;
			z-index:101;		
		}
		#d2{
			width:810px;
			height:1000px;
			margin:0px auto;
			padding-top:100px;
			text-align:center;	
			background-color:white;		
		}
		#dd2{
			width:810px;
			height:100px;
			position:absolute;
			top:400px;	
		}
		#d3{
				background-color: #5E5E5E;
				width: 100%;
				height: 100%;
				filter: alpha(opacity == 0.5);
				opacity:0.5;
				display: none;
				position: absolute;
				z-index: 100;
				left: 0px;
				top: 0px;
		}
		table{
			margin-left:75px;
			width:650px;
			line-height:40px;
			text_align:center;			
		}
	</style>
  </head>
  <body onload="find('mainGuahao')">
  	<input type="text"id="page" value="${requestScope.page}" hidden="hidden">
  	<input type="text" id="every" value="${requestScope.every}" hidden="hidden">
  	<input type="text" id="pid" hidden="hidden"> 
	  <div id="d1">
	  	<h2>请输入挂号信息</h2>
	  	挂号日期：<input type="text" id="date"><br>
	  	就诊状态：<input type="text" id="status"><br>
	  	挂号级别：<input type="text" id="grade"><br>
	  	就诊号码：<input type="text" id="visit"><br><br>
	  	<input type="button" value="添加" onclick="addGuahao('addGuahao')">
	  	<input type="button" value="返回" onclick="exit()">
	  	<p></p>
	  </div>
    <div id="d2"> 
	<h1>挂号记录显示</h1>
	<table >
	<tr id="first">
		<td>挂号编号</td>
	    <td>挂号日期</td>
	    <td>就诊状态</td>
	    <td>挂号级别</td>
	    <td>就诊号码</td>
		<td>删除</td>		
		</tr> 
	</table>
	<div id="dd2">
		<c:if test="${page==1}">
			<a>首页</a>
			<a>上一页</a>
		</c:if>
		<c:if test="${page!=1}">
			<a href="pageGuahao?page=1">首页</a>
			<a href="pageGuahao?page=${requestScope.page-1}">上一页</a>
		</c:if>
		<c:forEach var ="everyPage" begin="1" end="${requestScope.pageCount}"> 
		       <a href="pageGuahao?page=${everyPage}">${everyPage}</a>
		   </c:forEach>
		         
		   <c:if test="${page==pageCount}">
		       <a>下一页</a>
		       <a>尾页</a>
		   </c:if>		       
		   <c:if test="${page !=requestScope.pageCount}">
		       <a href="pageGuahao?page=${requestScope.page+1}">下一页</a>
		       <a href="pageGuahao?page=${requestScope.pageCount}">尾页</a>
	       </c:if>
	       <br>
	       <br>
	       <input type="button" value="新增" onclick="add()">
           <input type="button" value="刷新" onclick="find('mainGuahao')">
	</div>
</div>
<div id="d3"></div>
  </body>
</html>
