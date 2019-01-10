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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	<script type="text/javascript" src="js/jquery-1.11.0.js" charset="utf-8"></script>
	 
	 <script type="text/javascript">
	    function find(url)
	    {	
	    	   $("tr").css("width","100px");
			   $("tr").css("height","40px");
			   $("tr").css("background","#FFD700");
		      document.getElementById("chu_date").value="";
		      document.getElementById("diagnosis").value="";  
		      document.getElementById("content").value="";
		      var page = document.getElementById("page").value;
		      var every = document.getElementById("every").value;
	    	$.ajax({
	    		type:"post",
	    		url:url,
	    		datatype:"json",
	    		async:false,
	    		data:{
	    			"page":page,
	    			"every":every
	    		},
	    		success:function(data){
	    			data = eval("("+data+")");
	    			var html="";
	    			var ddd = "";
	    			$("table tr:not(:first)").remove();
	    		   for(var i = 0; i < data.length;i++)
	    			   {
	    			     html += "<tr id="+i+">"; 
	    			         $.each(data[i],function(j,val){
	    			        	 html+="<td>"+val+"</td>";
	    			        	if(j == "c_id"){
	    			        		ddd += val;	
	    			        	}
	    			        	 if(j == "content")
	    			        		 {
	    			  html+="<td><a href='javascript:void(0)' onclick=del('DelChuFangServlet?id=" +ddd+"')>删除</a></td>";
	    			        		 }
	    			         });
	    			   html+="</tr>";
	    			  	ddd ="";
	    			   }
	    		   $("#first").after(function(){
	    			   return html;
	    		   });
	    		}
	    	});
	    }
	 	function add()
	 	{
				$("#d1").css("display","block");
	 	}
	 	function exit()
	 	{
		 		$("#d1").css("display","none");
	 	}
	    function addChuFang(url)
	    {	
	    	var chu_date = document.getElementById("chu_date").value;
	    	var diagnosis = document.getElementById("diagnosis").value;  
	    	var content = document.getElementById("content").value;  
	    	$.ajax({
	    		type:"post",
	    		url:url,
	    		async:false,
	    		data:{
	    			   "chu_date":chu_date,
	    			   "diagnosis":diagnosis,
	    			   "content":content
	    		     },
	    		datatype:"json",
	    		success:function(data){
	    			$("p").html(data);
	    		}
	    	});
	    	exit();
	    	find("UpdateChuFangServlet");
	    }
	    function del(ths)
	    {	
	    	$.ajax({
	    		type:"post",
	    		async:false,
	    		data:{
	    			  "cid":ths,
	    		     },
	    		url:"DelChuFangServlet",
	    		datatype:"json",
	    		success:function(data){
	    			$("p").html(data);
	    		}
	    	});
	    	find("UpdateChuFangServlet");
	    }
	 </script>
	<style type="text/css">
		#d1{
				width: 300px;
				height: 350px;
				background-color: aquamarine;
				text-align: center;
				display: none;
				position:absolute;
				left: 300px;
			    top:230px;
			    z-index: 95;
		}
		#d2{
			width: 800px;
				height: 600px;
				background-color: #5F9EA0;
				text-align: center;
				position: absolute;
				top: 100px;
				left: 3px;
		}
		#dd2{
			width:810px;
			height:100px;
			position:absolute;
			top:600px;
		}
		.table{
			margin-left :75px;
			width:650px;
			line-height:40px;
			text-align:center;
		}
	</style>
  </head>
  <body onload="find('UpdateChuFangServlet')">
        <input type="text" id="page" value="${requestScope.page }" hidden="hidden">
		<input type="text" id="every" value="${requestScope.every }" hidden="hidden">
		<input type="text" id="pid" hidden="hidden">
		  <div id="d1">
		  <h2>增加处方信息页面</h2>
		      开方日期:<input type="text"  id="chu_date"><br><br>
		      诊断结果:<input type="text"  id="diagnosis"><br><br>
		      治疗药品:<input type="text"  id="content"><br><br>
	    <br>
	    <input type="button" value="确定添加" onclick="addChuFang('AddChuFangServlet')">
	     <input type="button" value="返回" onclick="exit()">
	    <p></p>
	    </div>
	   <div id="d2">
	   <h1>处方信息页面显示</h1>
		   <table class="table" border="1px" cellpadding="0" cellspacing="0">
		     <tr id="first">
		       <td>ID</td>
		       <td>开方日期</td>
		       <td>诊断结果</td>
		       <td>治疗药品</td>
		       <td>删除</td>
		     </tr>
		   </table>
		    <div id="dd2">
		   <c:if test="${page==1}">
		       <a>首页</a>
		       <a>上一页</a>
		   </c:if>
		   <c:if test="${page!=1}">
		       <a href="PageChuFangServlet?page=1">首页</a>
		       <a href="PageChuFangServlet?page=${requestScope.page-1}">上一页</a>
		   </c:if>
		   <c:forEach var ="everyPage" begin="1" end="${requestScope.pageCount}"> 
		       <a href="PageChuFangServlet?page=${everyPage}">${everyPage}</a>
		   </c:forEach>
		         
		   <c:if test="${page==pageCount}">
		       <a>下一页</a>
		       <a>尾页</a>
		   </c:if>  
		       
		   <c:if test="${page !=requestScope.pageCount}">
		       <a href="PageChuFangServlet?page=${requestScope.page+1}">下一页</a>
		       <a href="PageChuFangServlet?page=${requestScope.pageCount}">尾页</a>
	       </c:if>
	       <br>
			  <input type="button" value="新增" onclick="add()">
			  <input type="button" value="刷新" onclick="find('UpdateChuFangServlet')">
		</div>
  </body>
</html>