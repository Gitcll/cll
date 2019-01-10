<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		function find(url){
			
			document.getElementById("name").value="";
			document.getElementById("sex").value="";
			document.getElementById("age").value="";
			document.getElementById("addr").value="";
			document.getElementById("phonenum").value="";
			var page = document.getElementById("page").value;
			var pevery = document.getElementById("pevery").value;
			//alert("更新成功");
			$.ajax({
				type:"post",
				url:url,
				datatype:"json",
				async:false,
				data:{
					"page":page,
					"pevery":pevery
				},
				success:function(data){
					data = eval("("+data+")");
					var html="";
					var id = "";
					//删除表格第一行的内容
					$("#pt tr:not(:first)").remove();
					for(var i = 0; i < data.length;i++){
						html += "<tr id="+i+">";
						$.each(data[i],function(j,val){
							html+="<td>"+val+"</td>";
							if(j == "pid"){
								id += val;
							}
							if(j == "chufagnId"){
								
								html += "<td><a href='javascript:void(0)' onclick=del('DeletePatientServlet?id="+id+"')>删除</a></td>";
								html += "<td><a href='javascript:void(0)' onclick=update('UpdateServlet?id="+id+"')>更新</a></td>";
								
							}
						});
						html+="</tr>";
						id = "";
					}
					$('#first').after(function(){
						return html;
					});
				}
			});
		}
	
		$(function(){
			$("#first").css("background","pink");
			$("h1").css("background","skyblue");
		});
		
		function addUser(url){
			var name = document.getElementById("name").value;
			var sex = document.getElementById("sex").value;
			var age = document.getElementById("age").value;
			var addr = document.getElementById("addr").value;
			var phonenum = document.getElementById("phonenum").value;
			
			$.ajax({
				type:"post",
				async:false,
				url:url,
				data:{
					"name":name,
					"sex":sex,
					"age":age,
					"addr":addr,
					"phonenum":phonenum
					},
				datatype:"json",
				success:function(data){	
				$("p").html(data);
				}
			});
			find("findAllPatient");
			
		}
		
		function del(url){
			$.ajax({
				type:"post",
				async:false,
				url:url,
				datatype:"json",
				success:function(data){
					
					$("p").html(data);
				}
			});
			find("findAllPatient");
		}
		function update(ths) {
			
			document.getElementById("pupdate").style.display="block";
			document.getElementById("cover").style.display="block";
			
			var nid;
			$.ajax({
				type:"post",
				async:false,
				data:{
					"nid":ths
				},
				url:"PateintFindById",
				datatype:"Json",
				success:function(data){
				data = eval("("+data+")");
					for(var i = 0; i < data.length;i++){
						$.each(data[i],function(j,val){
							
							if(j == "pid"){
								document.getElementById("fpid").value = val;
							}
							if(j == "patientName"){
								document.getElementById("fname").value = val;
							}
							if(j == "patientSex"){
								document.getElementById("fsex").value = val;
							}
							if(j == "patientAge"){
								document.getElementById("fage").value = val;
							}
							if(j == "patientAdd"){
								document.getElementById("faddr").value = val;
							}
							if(j == "patientPhoneNum"){
								document.getElementById("fphonenum").value = val;
							}
							if(j == "zhuyuan"){
								document.getElementById("fzhuyuan").value = val;
							}
							if(j == "guahaoId"){
								document.getElementById("fguahaoid").value = val;
							}
							if(j == "chufagnId"){
								document.getElementById("fchufangid").value = val;
							}
						});
					}
				}
			});
		}
		function changePatient(url) {
			var fname = document.getElementById("fname").value;
			var fsex = document.getElementById("fsex").value;
			var fage = document.getElementById("fage").value;
			var faddr = document.getElementById("faddr").value;
			var fphonenum = document.getElementById("fphonenum").value;
			var fzhuyuan = document.getElementById("fzhuyuan").value;
			var nid = document.getElementById("fpid").value;
			$.ajax({
				type:"post",
				async:false,
				url:url,
				data:{
					"fname":fname,
					"fsex":fsex,
					"fage":fage,
					"faddr":faddr,
					"fphonenum":fphonenum,
					"fzhuyuan":fzhuyuan,
					"nid":nid
					},
				datatype:"json",
				success:function(data){	
				$("p").html(data);
				}
			});
			document.getElementById("pupdate").style.display="none";
			document.getElementById("cover").style.display="none";
			find("findAllPatient");
		}
		function back() {
			document.getElementById("pupdate").style.display="none";
			document.getElementById("cover").style.display="none";
			document.getElementById("d1").style.display="none";
		} 
		function add(){
			document.getElementById("d1").style.display="block";
			document.getElementById("cover").style.display="block";
		}
	</script>
	<style type="text/css">
			#pupdate{
				z-index: 101;
				width: 400px;
				height: 400px;
				background-color: rgb(248,248,255);
				position: absolute;
				top:180px;
				right:190px;
				border: 2px groove rgb(10,166,189);
				display: none;
			}
			#pupdate1{
				text-align: right;
				font-family: "微软雅黑";
				width: 300px;
				height: 300px;
				margin-top: 30px;
				margin-right: 95px;
			}
			#titlepatientgai{
				font-family: "微软雅黑";
				margin-right: 20px;
			}
			.changeb{
				margin-right: 20px;
				width: 70px;
				height: 30px;
			}
			#cover{
				z-index: 100;
				width: 100%;
				height: 100%;
				background-color: darkgray;
				filter: alpha(opacity==0.5);
				opacity: 0.5;
				position: absolute;
				top: 0px;
				left: 0px;
				display: none;
			}
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
				heigth:2000px;
				margin:auto;
				padding-top:100px;
				text-align:center;
				background-color:white;
			}
			#dd2{
				width:810px;
				height:100px;
				position:absolute;
				top:600px;
				margin:auto;
				text-align:center;
			}
			#pt{
				margin-left :50px;
				width:700px;
				text-align:center;
			}
			.zhenduan{
				margin-right: 30px;
				width: 60px;
				height: 25px;
			}
	</style>
  </head>
  
  <body onload="find('findAllPatient')" bgcolor="white">
  	<input type="text" id="page" value="${requestScope.ppage}" hidden="hidden">
	<input type="text" id="pevery" value="${requestScope.every}" hidden="hidden">
  <input type="text" id="pid" hidden="hidden">
  <div id="d1">
  		 <h2>请输入用户信息</h2>
		    用户名:<input type="text" id="name" ><br>
		    性&nbsp;&nbsp;&nbsp;别:<input type="text" id="sex" ><br>
		    年&nbsp;&nbsp;&nbsp;龄:<input type="text" id="age" ><br>
		    地&nbsp;&nbsp;&nbsp;址:<input type="text" id="addr" ><br>
		    手机号:<input type="text" id="phonenum" ><br><br><br>
		    <input type="button" value="确定添加" onclick="addUser('AddPatientServlet')">
		    <input type="button" value="返回" onclick="back()">
		    <p></p>
    </div>
    <div id="d2">
	    <h1>患者信息管理</h1>
	    <table cellspacing="0px" border="1px" cellpadding="7px" id="pt">
	    <tr id="first">
	    	<td>ID</td>
	    	<td>用户名</td>
	    	<td>性别</td>
	    	<td>年龄</td>
	    	<td>地址</td>
	    	<td>手机号</td>
	    	<td>住院</td>
	    	<td>挂号号码</td>
	    	<td>处方号</td>
	    	<td colspan="2">操作</td>
	    	
	    </tr>
	    </table>
    <table>
    <div id="dd2">

       <c:if test="${ppage==1}">
       <a>首页</a>
       <a>上一页</a>
       </c:if>
       <c:if test="${ppage!=1}">
       <a href="fen?ppage=1">首页</a>
       <a href="fen?ppage=${requestScope.ppage-1}">上一页</a>
       </c:if>
       <c:forEach var ="everyPage" begin="1" end="${requestScope.pageCount}"> 
          <a href="fen?ppage=${everyPage}">${everyPage}</a>
         </c:forEach>
         
         <c:if test="${ppage==pageCount}">
       <a>下一页</a>
       <a>尾页</a>
       </c:if>  
       
       <c:if test="${ppage !=requestScope.pageCount}">
       <a href="fen?ppage=${requestScope.ppage+1}">下一页</a>
       <a href="fen?ppage=${requestScope.pageCount}">尾页</a>
       </c:if><br>
       <input type="button" value="新增" onclick="add()">
		<input type="button" value="更新" onclick="updateUser()">

    </div>
    </div>
    <div id="pupdate">
			<br><h2 id="titlepatientgai">患者信息修改</h2>
    	<div id="pupdate1">
    		<input type="text" id="fpid" hidden="hidden">
    		用户名: <input type="text" id="fname" name="fname"><br>
     		性 &nbsp;&nbsp;别: <input type="text" id="fsex" name="fsex"><br>
    		年 &nbsp;&nbsp;龄: <input type="text" id="fage" name="fage"><br>
    		地 &nbsp;&nbsp;址: <input type="text" id="faddr" name="faddr"><br>
    		手机号: <input type="text" id="fphonenum" name="fphonenum"><br>
    		住 &nbsp;&nbsp;院: <input type="text" id="fzhuyuan" name="fzhuyuan"><br>
    		挂号码: <input type="text" id="fguahaoid" name="fguahaoid" readonly="readonly"><br>
    		<button class="zhenduan">挂号</button><button class="zhenduan">查看</button><br>
    		处方号: <input type="text" id="fchufangid" name="fchufangid" readonly="readonly"><br>
    		<button class="zhenduan">诊断</button><button class="zhenduan">查看</button><br><br>
    		<input type="button"  class="changeb" value="确定修改" onclick="changePatient('PatientUpdateServlet')">
    		<input type="button" class="changeb" value="返回" onclick="back()">
    	</div>
    </div>
    <div id="cover"></div>
  </body>
</html>

