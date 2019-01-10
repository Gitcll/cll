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
			   $("tr").css("background","pink");

			  document.getElementById("name").value="";
		      document.getElementById("num").value="";
		      document.getElementById("unit").value="";  
		      document.getElementById("descp").value="";  
		      document.getElementById("price").value=""; 
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
	    			data = eval("("+data+")")
	    			var html="";
	    			var ddd = "";
	    			//删除表格第一行的内容
	    			$("table tr:not(:first)").remove();
	    		   for(var i = 0; i < data.length;i++)
	    			   {
	    			     html += "<tr id="+i+">"; 
	    			         $.each(data[i],function(j,val){
	    			        	 html+="<td>"+val+"</td>";
	    			        	if(j == "mid"){
	    			        		ddd += val;	
	    			        	}
	    			        	 if(j == "price")
	    			        		 {
	    			        		
	    			  html+="<td><a href='javascript:void(0)' onclick=del('DeleteServlet?id=" +ddd+"')>删除</a></td>";
	    			  html+="<td><a href='javascript:void(0)' onclick=updata('FindMedicineById?id=" +ddd+"')>更新</a></td>";
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
				$("#d3").css("display","block");
	 	}
	 	
	 	function exit()
	 	{
		 		$("#d1").css("display","none");
				$("#d3").css("display","none");
	 	}
	 	function exit2()
	 	{
		 		$("#d3").css("display","none");
				$("#d4").css("display","none");
	 	}
	    function addMedicine(url)
	    {	
	    	
	    	var name = document.getElementById("name").value;
	    	var num = document.getElementById("num").value;
	    	var unit = document.getElementById("unit").value;  
	    	var descp = document.getElementById("descp").value;  
	    	var price = document.getElementById("price").value;  
	    	
	    	$.ajax({
	    		type:"post",
	    		url:url,
				async:false,
	    		data:{
	    			  "name":name,
	    			   "num":num,
	    			   "unit":unit,
	    			   "descp":descp,
	    			   "price":price
	    		     },
	    		datatype:"json",
	    		success:function(data){
	    			$("p").html(data);
	    		}
	    	});
	    	exit();
	    	find("FindAllMedicine");
	    	
	    }
	    function del(ths)
	    {	
			var mid;
	    	$.ajax({
	    		type:"post",
	    		async:false,
	    		data:{
	    			  "mid":ths,
	    		     },
	    		url:"DeleteMedicine",
	    		datatype:"json",
	    		success:function(data){
	    			$("p").html(data);
	    		}
	    	});
	    	
	    	find("FindAllMedicine");
	    }
	    function updata(url)
	    {

	    	document.getElementById("d3").style.display="block";
 			document.getElementById("d4").style.display="block";
		 		
		 		var mid;
		 		$.ajax({
		 			type:"post",
		 			async:false,
		 			url:url,
		 			datatype:"Json",
		 			success:function(data){
		 				data = eval("("+data+")");
		 				for(var i=0;i<data.length;i++)
		 					{
		 						$.each(data[i],function(j,val){
		 							
		 							if(j == "mid")
	 								{
	 									document.getElementById("mid").value = val;
	 								
	 								}
		 							if(j == "mname")
	 								{
	 									document.getElementById("mname").value=val;
	 								}
		 							if(j == "num")
	 								{
		 								document.getElementById("mnum").value = val;
	 								}
		 							if(j == "unit")
	 								{
	 									document.getElementById("munit").value=val;
	 								}
		 							if(j == "descp")
	 								{
	 									document.getElementById("mdescp").value=val;
	 								}
		 							if(j == "price")
	 								{
	 									document.getElementById("mprice").value=val;
	 								}
		 						});
		 					}
		 			}
		 		
		 			
		 			
		 		});
	    }
	    function changedata(url)
 		{

 			var mid = document.getElementById("mid").value;
 			var mname = document.getElementById("mname").value;
 			var mnum = document.getElementById("mnum").value;
 			var munit = document.getElementById("munit").value;
 			var mdescp = document.getElementById("mdescp").value;
 			var mprice = document.getElementById("mprice").value;
 			
 			$.ajax({
 				
 				async:true,
 				usr:url,
 				data:{
 					"mid":mid,
 					"mname":mname,
 					"mnum":mnum,
 					"munit":munit,
 					"mdescp":mdescp,
 					"mprice":mprice
 				},	
 				datatype:"Json",
 				success:function(data){
 					alert(data);
 					$("p").html(data);
 				}
 				
 			});
 			document.getElementById("d3").style.display="none";
 			document.getElementById("d4").style.display="none";
 			//find("FindAllMedicine");
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
			background-color:white;
			text-align:center;
		}
		#dd2{
			width:810px;
			height:100px;
			position:absolute;
			top:600px;
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
		#d4{
			width:500px;
			height:300px;
			background-color:#A9C9E9;
			text-align:center;
			position:absolute;
			top:180px;
			right:140px;
			
			display:none;
			z-index:102;
		}
		.table{
			margin-left :75px;
			width:650px;
			line-height:40px;
			text-align:center;
			
			
		}
	</style>
	
  </head>
  
  <body onload="find('FindAllMedicine')">
		
		<input type="text" id="page" value="${requestScope.page }" hidden="hidden">
		<input type="text" id="every" value="${requestScope.every }" hidden="hidden">
		<input type="text" id="pid" hidden="hidden">
		
		  <div id="d1">
		 <h2>请输入药品信息</h2>
		      药名:<input type="text"  id="name"><br>
		      数量:<input type="text"  id="num"><br>
		      单位:<input type="text"  id="unit"><br>
		      备注:<input type="text"  id="descp"><br>
		      价格:<input type="text"  id="price"><br>   
	    <br>
	    <input type="button" value="确定添加" onclick="addMedicine('AddMedicine')">
	     <input type="button" value="返回" onclick="exit()">
	    <p></p>
	    </div>
	    <div id="d4">
		  
	    <h2>请修改药品信息</h2>
		      编号:<input type="text"  id="mid"><br>
		      药名:<input type="text"  id="mname"><br>
		      数量:<input type="text"  id="mnum"><br>
		      单位:<input type="text"  id="munit"><br>
		      备注:<input type="text"  id="mdescp"><br>
		      价格:<input type="text"  id="mprice"><br>   
	    <br>
	    <input type="button" value="确定修改" onclick="changedata('UpdataMedicine')">
	     <input type="button" value="返回" onclick="exit2()">
	    <p></p>
	    </div>
		
	   <div id="d2">
	   <h1>药品页面显示</h1>
		   <table class="table" border="1px" cellpadding="0" cellspacing="0">
		     <tr id="first">
		       <td>ID</td>
		       <td>药品名称</td>
		       <td>库存</td>
		       <td>单位</td>
		       <td>备注</td>
		       <td>价格（元）</td>
		       <td colspan="2">操作</td>
		     </tr>
		   </table>
	   <div id="dd2">
		   <c:if test="${page==1}">
		       <a>首页</a>
		       <a>上一页</a>
		   </c:if>
		   <c:if test="${page!=1}">
		       <a href="PageMedicineServlet?page=1">首页</a>
		       <a href="PageMedicineServlet?page=${requestScope.page-1}">上一页</a>
		   </c:if>
		   <c:forEach var ="everyPage" begin="1" end="${requestScope.pageCount}"> 
		       <a href="PageMedicineServlet?page=${everyPage}">${everyPage}</a>
		   </c:forEach>
		         
		   <c:if test="${page==pageCount}">
		       <a>下一页</a>
		       <a>尾页</a>
		   </c:if>  
		       
		   <c:if test="${page !=requestScope.pageCount}">
		       <a href="PageMedicineServlet?page=${requestScope.page+1}">下一页</a>
		       <a href="PageMedicineServlet?page=${requestScope.pageCount}">尾页</a>
	       </c:if>
	       <br>
			   <input type="button" value="新增" onclick="add()">
			   <input type="button" value="刷新" onclick="">
		</div>
    	</div>
    	 <div id="d3"></div>
    	
  </body>
</html>
