<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Emp_YuYue.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="manager/css/reserve_doc.css"/>
	<link rel="icon" href="client/img/logo/logo64.ico"/>
	<script src="manager/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
			
		
			
			function GetDateStr(AddDayCount) {
		    var dd = new Date();
		    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
		    //var y = dd.getFullYear();
		    var m = dd.getMonth()+1;//获取当前月份的日期
		    var d = dd.getDate();
		    return m+"月"+d+"日";		    
		}
		
		$(function(){
			$(".date1").html(GetDateStr(0));
			$(".date2").html(GetDateStr(1));
			$(".date3").html(GetDateStr(2));
			$(".date4").html(GetDateStr(3));
			$(".date5").html(GetDateStr(4));
			$(".date6").html(GetDateStr(5));
			$(".date7").html(GetDateStr(6));
		});
	
			$(function(){
			$(".week1").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt(new Date().getDay()+0));
			$(".week2").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt(new Date().getDay()+1));
			$(".week3").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt(new Date().getDay()+2));
			$(".week4").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt(new Date().getDay()+3));
			$(".week5").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt(new Date().getDay()+4));
			$(".week6").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt((new Date().getDay()+5)%7));
			$(".week7").html("&nbsp;&nbsp;星期"+"日一二三四五六".charAt((new Date().getDay()+6)%7));
		});
		$(function(){
			  $("tr:even").css("background","#eee");
			    $("tr:odd").css("background","#ccc");
		});
		function yuyue(url) {
			var flag = confirm("确定预约该医生吗？");
	    	if(flag){
	    		$.ajax({
					type:"post",
					url:url,
					datatype:"json",
					success:function(data){
						alert(data);
					}
	    		});
					
	    	}else{
	    	  close();	
	    	}

		}
		</script>
  </head>
  
  <body>
  	  <script type="text/javascript" color="255,0,60" opacity='0.7' zIndex="-1" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
  
    <div class="head">
			<h1><a href=""><img src="manager/img/yuyue/logo.png"/></a></h1>
			
			<ul>
				<li><a href="client/index.jsp">医院首页</a></li>
				<li><a href="#">预约挂号</a></li>
				<li><a href="#">预约指南</a></li>
			</ul>
		</div>
		<div class="contert">
			<div class="contert_top">
				<strong>${doctorname }</strong>
				<span>${doctorzhiwei }</span>
				(<span>${keshiname } (${dept })</span>)<br />
			</div>
			
			<div class="img_left">
				<img src="manager/img/yuyue/img_doc.gif"/>
			</div>
			<div class="img_right">
				<label>性别 : </label><em>${doctorsex }</em><br />
				<label>专长 : </label><em>按摩正骨</em><br />
				<label>简介 : </label><em>妙手怀仁心，何妨我独贫</em>	<br />
				<a href="#">【详细】</a>
			</div>
		
		</div>
		<div class="contert_table">
		<table class="table" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="2">午别</td>
					<td class="date1"></td>
					<td class="date2"></td>
					<td class="date3"></td>
					<td class="date4"></td>
					<td class="date5"></td>
					<td class="date6"></td>
					<td class="date7"></td>
				</tr>
				<tr>
					
					<td class="week1"></td>
					<td class="week2"></td>
					<td class="week3"></td>
					<td class="week4"></td>
					<td class="week5"></td>
					<td class="week6"></td>
					<td class="week7"></td>
				</tr>
				<tr>
					<td>上午</td>
					<td><a onclick="yuyue('YuYueServlet')"><img src="manager/img/yuyue/keyuyue.png"/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
				</tr>
				<tr>
					<td>下午</td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src="manager/img/yuyue/tingzhen.png"/></a></td>
					<td><a href="#"><img src=""/></a></td>
				</tr>
				<tr>
					<td>晚上</td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src=""/></a></td>
					<td><a href="#"><img src="manager/img/yuyue/yuyueyiman.png"/></a></td>
				</tr>
			</table>
		</div>
		<div class="bottom">
			<div class="bottom_top">
				<h4>同科室专家推荐</h4>
			</div>
			<div class="bottom_contert">
				<ul>
					<c:forEach var="li" items="${doctorlist }" begin="1" end="4">
					<li>
						<div class="bottom_ul">
							<div class="bottom_ul_img">
								<img src="manager/img/yuyue/img_doc.gif"/><br />
								<a href="#">${li.username }</a><br />
								<span>${li.k_name }</span>
								<span>${li.pos }</span>
							</div>
							<div class="bottom_ul_span">
								<a href="#">擅长:</a>
								<a href="#">各种疑难杂症</a>
							</div>
						</div>
					</li>
					</c:forEach>
					<!-- <li>
						<div class="bottom_ul">
							<div class="bottom_ul_img">
								<img src="manager/img/yuyue/img_doc.gif"/><br />
								<a href="#">姓名</a><br />
								<span>科室</span>
								<span>职称</span>
							</div>
							<div class="bottom_ul_span">
								<a href="#">擅长:</a>
								<a href="#">12121212121</a>
							</div>
						</div>
					</li>
					<li>
						<div class="bottom_ul">
							<div class="bottom_ul_img">
								<img src="manager/img/yuyue/img_doc.gif"/><br />
								<a href="#">姓名</a><br />
								<span>科室</span>
								<span>职称</span>
							</div>
							<div class="bottom_ul_span">
								<a href="#">擅长:</a>
								<a href="#">12121212121</a>
							</div>
						</div>
					</li>
					<li>
						<div class="bottom_ul">
							<div class="bottom_ul_img">
								<img src="manager/img/yuyue/img_doc.gif"/><br />
								<a href="#">姓名</a><br />
								<span>科室</span>
								<span>职称</span>
							</div>
							<div class="bottom_ul_span">
								<a href="#">擅长:</a>
								<a href="#">12121212121</a>
							</div>
						</div>
					</li>
					<li>
						<div class="bottom_ul">
							<div class="bottom_ul_img">
								<img src="manager/img/yuyue/img_doc.gif"/><br />
								<a href="#">姓名</a><br />
								<span>科室</span>
								<span>职称</span>
							</div>
							<div class="bottom_ul_span">
								<a href="#">擅长:</a>
								<a href="#">12121212121</a>
							</div>
						</div>
					</li> -->
				</ul>
			</div>
			
		</div>
  </body>
</html>
