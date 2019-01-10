<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'emp_index1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<style type="text/css">
			*{
				margin:0;
				padding:0;
			}
			body{
				background:#fff;
			}
			.d1{
				width: 880px;
				height: 560px;
				border: 1px solid gainsboro;
				margin: 100px auto;
				
				padding:10px;
				position: relative;
			}
			.d1 h1{
				text-align: center;
				
			}
			.d2{
				height: 50px;
				line-height:50px;
				background:#fff;
			}
			img{
				width:30px;
				height:18px;
			}
			table{
				margin-top:50px;
				text-align: center;
				margin-left:60px;
			}
			td{
				width:40px;
			}
			
			.emp_btn,#pageSize{
				border:none;
				margin-left:270px;
				margin-top:20px;
				background:skyblue;
				color:#fff;
				border-radius:5px;			
			}
			.emp_btn{
				width:80px;
				height:29px;
			}
			#pageSize{
				margin-left:8px;
				width:110px;
				height:28px;
				
			}
			
	<%----------------------	添加------------------------  --%> 
			.add,.update{
				width:550px;
				height: 550px;
				margin: 0 auto;
				background: #87ceeb;
				opacity:0.9;
				position: absolute;
				display:none;
				top:150px;
				left:120px;
				z-index:101;
			}
			h4{
				text-align:center;
				padding-top:10px;
			}
			
			.emp{
				width:280px;
				margin: 10px auto;
				text-align: right;
				padding-top: 10px;
				
			}
			.text{		
				margin: 6px 0 6px 10px;
			}
			.btn,.update_btn{
				position: absolute;
				bottom:20px;
				left: 260px;
				border: none;
				width: 80px;
				height: 40px;
				color: gray;
				background: gainsboro;
			}
			.emp_div{
				width:100%;
				height:100%;
				filter:alhpa(opacity=50);
				opacity:0.5;
				display:none;
				position:absolute;
				z-index:100;
				left:0;
				top:0;
			}
		
			
	</style>
	
	 <script type="text/javascript">
				
		 $(function(){
			 
				 	$("table tr:odd").css("background","#ccc");
				  	$("table tr:even").css("background","#eee");
			 
			 
		    	$(".emp_add").click(function(){
		    		
		    		$(".emp_div").css("display","block").css("background","gray");
					$(".add").css("display","block");
					$(".emp_exit").css("display","none");
					
				});
		    	
		    	$(".btn").click(function(){
		    		
		    		$(".emp_div").css("display","none").css("background","#fff");
					$(".add").css("display","none");
					$(".text").val("");
					alert("添加成功");
		    	});
		    	
		    	
		    	$(".emp_update").click(function(){
		    		
		    		$(".emp_div").css("display","block").css("background","gray");
					$(".update").css("display","block");
					$(".emp_exit").css("display","none");
					
				});
		    	
				$(".update_btn").click(function(){
		    		
		    		$(".emp_div").css("display","none").css("background","#fff");
					$(".update").css("display","none");
					$(".text").val("");
					alert("修改成功");
		    	});
		    	 
		    	
			 });
		 
		 
		
 	 
	    function find(url)
	    { 
	    	var ppage = $("#ppage").val();
			var every = $("#every").val();
	    	
	    	$.ajax({
	    		
	    		type:"post",
	    		url:url,
	    		datatype:"json",
	    		data:{
	    			"ppage":ppage,
	    			"every":every
	    		},
	    		success:function(data){
	    			
	    			data = eval(data);
	    			
	    			var html="";    
	    			var id = "";
	    			
	    			//删除表格第一行的内容
	    			$("table tr:not(:first)").remove();
	    			
	    		   for(var i = 0; i < data.length;i++)
	    			   {
	    			     html += "<tr id="+i+">"; 
	    			         $.each(data[i],function(j,val){
	    			        	 html+="<td>"+val+"</td>";
	    			        	  
	    			        	 if(j == "e_id"){
	    			        		 id += val;
	    			        	 } 
	    			        	 
	    			        	 if(j == "pos")
    			        		 {
    								  html+="<td><a href='javascript:void(0)'  onclick=del('DeletePatientServlet1?id="+id+"')>删除</a></td>" ;
    			        			  html+="<td><a href='javascript:void(0)'  onclick=update('Emp_UpdateById?id="+id+"')>更新</a></td>";
    			        		 }
	    			         });
	    			        id="";
	    			   html+="</tr>";
	    			 
	    			   }
	    		   $(".first").after(function(){
	    			   return html;
	    			   
	    		   });
	    		}
	    	});
	    }
	    
	    
	

	  
		function update(ths) {
			
			$(".emp_div").css("display","block").css("background","gray");
			$(".update").css("display","block");
			$(".emp_exit").css("display","none");
		
			
			var nid;
			$.ajax({
				type:"post",
				async:false,
				data:{
					"nid":ths
				},
				url:"Emp_UpdateById",
				datatype:"json",
				success:function(data){
					
				data = eval("("+data+")");
				
					for(var i = 0; i < data.length;i++){
						$.each(data[i],function(j,val){	
						
							if(j == "e_id"){
								var e_id = $(".e_id").val(val);
							}
							
							if(j == "username"){
								var username = $(".username").val(val);
							}
							if(j == "userlogin"){
								var userlogin = $(".userlogin").val(val);
							}
							if(j == "userpwd"){
								var userpwd = $(".userpwd").val(val);
							}
							if(j == "hiredate"){
								var hiredate = $(".hiredate").val(val);
							}
							if(j == "sex"){
								var sex = $(".sex").val(val);
							}
							if(j == "age"){
								var age = $(".age").val(val);
							}
							if(j == "education"){
								var education = $(".education").val(val);
							}
							if(j == "addr"){
								var addr = $(".addr").val(val);
							}
							if(j == "iphone"){
								var iphone = $(".iphone").val(val);
							}
							if(j == "d_id"){
								var d_id = $(".d_id").val(val);
							}
							if(j == "q_id"){
								var q_id = $(".q_id").val(val);
							}
							if(j == "usertype"){
								var usertype = $(".usertype").val(val);
							}
							if(j == "pos"){
								var pos = $(".pos").val(val);	
								
							}
						});
					}
				}
			});
		}
		
		function update_btn(url) {
			var e_id = $("#e_id").val();
			var username = $("#username").val();
			var userlogin = $("#userlogin").val();
			var userpwd = $("#userpwd").val();
			var hiredate = $("#hiredate").val();
			var sex = $("#sex").val();
			var age = $("#age").val();
			var education = $("#education").val();
			var addr = $("#addr").val();
			var iphone = $("#iphone").val();
			var d_id = $("#d_id").val();
			var q_id = $("#q_id").val();
			var usertype = $("#usertype").val();
			var pos = $("#pos").val();
			
			$.ajax({
				type:"post",
				async:false,
				url:url,
				data:{
					"e_id":e_id,
					"username":username,
					"userlogin":userlogin,
					"userpwd":userpwd,
					"hiredate":hiredate,
					"sex":sex,
					"age":age,
					"education":education,
					"addr":addr,
					"iphone":iphone,
					"d_id":d_id,
					"q_id":q_id,
					"usertype":usertype,
					"pos":pos
					},
				datatype:"json",
				success:function(data){	
				$("p").html(data);
				
				}
			});
			find("FindAll");
		}
    
    	
    	
    	
    	
    	
    
	    
		 function del(ths){
			var nid;
			$.ajax({
				type:"post",
				async:false,
				data:{
					"nid":ths
				},
				url:"DeletePatientServlet1",
				datatype:"json",
				success:function(data){
					
					$("p").html(data);
				}
			});
			
			find("FindAll");
		}
 
	 
	     function add_emp(url)
	    	{
				
				var username = $(".username").val();
		    	var userlogin = $(".userlogin").val();
		    	var userpwd = $(".userpwd").val();
		    	var hiredate = $(".hiredate").val();
		    	var sex = $(".sex").val();
		    	var age = $(".age").val();
		    	var education = $(".education").val();
		    	var addr = $(".addr").val();
		    	var iphone = $(".iphone").val();
		    	var d_id = $(".d_id").val();
		    	var q_id = $(".q_id").val();
		    	var usertype = $(".usertype").val();
		    	var pos = $(".pos").val();
		    	
	    	$.ajax({
	    		type:"post",
	    		url:url,
	    		datatype:"json",
	    		async:false,
	    		 data:{
	    			  "username":username,
	    			  "userlogin":userlogin,
	    			  "userpwd":userpwd,
	    			  "hiredate":hiredate,
	    			  "sex":sex,
	    			  "age":age,
	    			  "education":education,
	    			  "addr":addr,
	    			  "iphone":iphone,
	    			  "d_id":d_id,
	    			  "q_id":q_id,
	    			  "usertype":usertype,	    			  
	    			  "pos":pos
	    		     }, 
	    		     
	    		success:function(data){
	    			
	    			$("p").html(data);
	    			
	    		}
	    		 
	    	});
	    	
	    	find("FindAll");
	    }

	 </script> 
	 
	 
	 
	 <script type="text/javascript">
	   $(function(){
		   $("#pageSize").change(function(){
			   
			  
			   var pagesize = $(this).val();
			   
			   location.href="findd?everyPage="+pagesize +"&page=1";
			   
		   });
		   
	   });
	
	
	</script>
	
  </head>
  
  <body onload="find('FindAll')">
  <div class="emp_div"></div>
  
   <div class="d1">
    <h1>医务人员管理系统</h1>
   			<input type="text" id="ppage" value="${requestScope.page}" hidden="hidden">
			<input type="text" id="every" value="${requestScope.every}" hidden="hidden">
			 <input type="text" id="pid" hidden="hidden">
  
<!--    		<div class="d2">
			<img src='manager/img/4.bmp' width="25px" height="25px"/>
			
				<input type="button" class="emp_btn emp_add"  value="添加"  style="font-size: 16px;font-family:'仿宋';font-weight: bold;"/>
			          
			
			<img src='manager/img/5.bmp' width="25px" height="25px"/>
			<sup>
				<a href="#"><input type="button" value="删除" class="emp_btn emp_delete"  style="font-size: 16px;font-family:'仿宋';font-weight: bold;"/></a>
			</sup>
			
			<img src='manager/img/6.bmp' width="25px" height="25px"/>
			<sup>
				<input type="button" value="修改" class="emp_btn"  style="font-size: 16px;font-family:'仿宋';font-weight: bold;"/>
			</sup>
			
			<img src='manager/img/7.bmp' width="35px" height="25px"/>
			<sup>
				<a href=""><input type="button" value="挂号" class="emp_btn"  style="font-size: 16px;font-family:'仿宋';font-weight: bold;"/></a>
			</sup><br />
			</div> -->
			
			<table cellpadding="4px" border="1"  cellspacing="0">
				<tr class="first">
					<td>用户编号</td>
					<td>姓名</td>
					<td>登录名</td>
					<td>登录密码</td>
					<td>入职日期</td>
					<td>性别</td>
					<td>年龄</td>
					<td>学历</td>
					<td>地址</td>
					<td>地址</td>
					<td>科室id</td>
					<td>用户权限id</td>
					<td>用户类型</td>
					<td>职称</td>
					<td>删除</td>
					<td>更新</td>
				</tr>
				
		
		</table>
	   	<input type="button" class="emp_btn emp_add"  value="添加用户"  style="font-size: 16px;font-family:'仿宋';font-weight: bold;"/>
					<select id="pageSize">
    					<option selected="selected">请选择面大小</option>
			       		<option value ="1" id="s3">1</option>
			        	<option value ="2" id="s4">2</option>
			         	<option value ="3" id="s5">3</option>
			          	<option value ="4" id="s6">4</option>      
   				 	</select>
<div style="width:250px; height:50px; margin-top:20px">
       <c:if test="${page==1}">
       <a>首页</a>
       <a>上一页</a>
       </c:if>
       <c:if test="${page!=1}">
       <a href="findd?page=1">首页</a>
       <a href="findd?page=${requestScope.page-1}">上一页</a>
       </c:if>
       <c:forEach var ="everyPage" begin="1" end="${requestScope.pageCount}"> 
          <a href="findd?page=${everyPage}">${everyPage}</a>
         </c:forEach>
         
         <c:if test="${page==pageCount}">
       <a>下一页</a>
       <a>尾页</a>
       </c:if>  
       
       <c:if test="${page !=requestScope.pageCount}">
       <a href="findd?page=${requestScope.page+1}">下一页</a>
       <a href="findd?page=${requestScope.pageCount}">尾页</a>
       </c:if>
 </div>
		
		
	 <%-------------------------分页 --------------------%>	
	    <p>当前第${ppage}页/总共${requestScope.pageCount}页</p>
    			
   				 	
   		
</div>



<!-- 	添加用户信息 -->
		<div class="add">	
			<h4>添加用户信息</h4>
			<div class="emp">
				
					<!-- 用户编号:<input type="text" class="text id" name="e_id" id="" value="" /><br /> -->
					用户名字:<input type="text" class="text username" name="username" id="" value="" /><br />
					登录名:<input type="text" class="text userlogin" name="userlogin" id="" value="" /><br />
					登录密码:<input type="text" class="text userpwd" name="userpwd" id="" value="" /><br />
					入职日期:<input type="text" class="text hiredate" name="hiredate" id="" value="" /><br />
					性别:<input type="text" class="text sex" name="sex" id="" value="" /><br />
					年龄:<input type="text" class="text age"  name="age" id="" value="" /><br />
					学历:<input type="text" class="text education" name="education" id="" value="" /><br />
					地址:<input type="text" class="text addr" name="addr" id="" value="" /><br />
					电话:<input type="text" class="text iphone" name="iphone" id="" value="" /><br />
					科室编号:<input type="text" class="text d_id" name="d_id" id="" value="" /><br />
					权限管理:<input type="text" class="text q_id" name="q_id" id="" value="" /><br />
					用户类型:<input type="text" class="text usertype" name="usertype" id="" value="" /><br />
					用户职称:<input type="text" class="text pos" name="pos" id="" value="" /><br />
					<input type="button" onclick="add_emp('Emp_AddServlet')" class="btn" value="添加用户"/>
					<p></p>
			</div>
		</div>
		
	<!-- 	修改用户信息 -->
		<div class="update">	
			<h4>修改用户信息</h4>
			<div class="emp">
				
					用户编号:<input type="text" class="text e_id" name="e_id" id="e_id" value="" /><br />
					用户名字:<input type="text" class="text username" name="username" id="username" value="" /><br />
					登录名:<input type="text" class="text userlogin" name="userlogin" id="userlogin" value="" /><br />
					登录密码:<input type="text" class="text userpwd" name="userpwd" id="userpwd" value="" /><br />
					入职日期:<input type="text" class="text hiredate" name="hiredate" id="hiredate" value="" /><br />
					性别:<input type="text" class="text sex" name="sex" id="sex" value="" /><br />
					年龄:<input type="text" class="text age" id="age" name="age"  value="" /><br />
					学历:<input type="text" class="text education" name="education" id="education" value="" /><br />
					地址:<input type="text" class="text addr" name="addr" id="addr" value="" /><br />
					电话:<input type="text" class="text iphone" name="iphone" id="iphone" value="" /><br />
					科室编号:<input type="text" class="text d_id" name="d_id" id="d_id" value="" /><br />
					权限管理:<input type="text" class="text q_id" name="q_id" id="q_id" value="" /><br />
					用户类型:<input type="text" class="text usertype" name="usertype" id="usertype" value="" /><br />
					用户职称:<input type="text" class="text pos" name="pos" id="pos" value="" /><br />
					<input type="button" onclick="update_btn('Emp_UpdateServlet')" class="update_btn" value="修改用户"/>
					<p></p>
			</div>
		</div>
  </body>
</html>
