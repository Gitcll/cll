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
	<style>
	body{
			background-color: gainsboro;
		}
		section{
		
			display: inline-block;
			position: relative;
			margin: 15% 40% 0% 40%;
		}
		.main{
			height: 100px;
			width: 100px;
			background-color: #f5a560;
			border-radius: 50%;
			z-index: 1;
			position: relative;
			box-shadow: inset -5px -5px 0 #d87d3c,inset 3px 3px 0 1px #d87d3c
		
		}
		.nos{
			border-radius: 50%;
			position: absolute;
			height:80px;
			width: 80px;
			left: 10px;
			top: 10px;
			background-color: #691824;
			opacity: 1;
			z-index: 3;
		
		}
		.two .nos{
			background-color: #ff1493;
		}
		.three .nos{
			background-color: #fbc0c0;
		}
		.four .nos{
			background-color:#76ecdc;
		}
		.hole{
			margin: auto;
			width:30px;
			height: 30px;
			border-radius: 50%;
			background-color: #fff;
			position: absolute;
			z-index: 4;
			left:25px;
			top: 25px;
			box-shadow: inset -3px -2px 0px 1px #d87d3c;
		}
		.one{
			width: 100px;
			position: absolute;
			left: 10px;
			animation: first 4s infinite ;
			
		}
		
		.two{
			width: 100px;
			position: absolute;
			left: 115px;
			animation: second 4s infinite;
		}
		.three{
			width: 100px;
			position: absolute;
			left: 10px;
			top: 105px;
			animation: third 4s infinite ;
		}
		.four{
			width: 100px;
			position: absolute;
			left: 115px;
			top: 105px;
			animation: fourth 4s infinite ;
		}
		h1{
			position: absolute;
			text-align: center;
			font-weight: bold;
			font-family: Arial,tahoma;
			font-style: italic;
			font-size: 38px;
			top: 200px;
			left: 30px;
		}
		@keyframes first {
			0%{
				top: 0px;
				left: 10px;
			}
			25%{
				left: 10px;
			top: 105px;
			}
			50%{
			left: 115px;
			top: 105px;
			}
			75%{
			left: 115px;
			top: 0px;		
			}
			100%{
				top: 0px;
				left: 10px;
			}
		}
		@keyframes second {
			0%{
				top: 0px;
				left: 115px;
			}
			25%{
				left: 10px;
				top: 0px;
			}
			50%{
			left: 10px;
			top: 105px;
			}
			75%{
			left: 115px;
			top: 105px;		
			}
			100%{
				top: 0px;
				left: 115px;
			}
		}
		@keyframes third {
			0%{
			left: 10px;
			top: 105px;
			}
			25%{
			left: 115px;
			top: 105px;
			}
			50%{
			left: 115px;
			top: 10px;
			}
			75%{
			top: 0px;
			left: 10px;	
			}
			100%{
			left: 10px;
			top: 105px;
			}
		}
		@keyframes fourth {
			0%{
			left: 115px;
			top: 105px;
			}
			25%{
			left: 115px;
			top: 0px;
			}
			50%{
			left: 10px;
			top: 0px;
			}
			75%{
			top: 105px;
			left: 10px;	
			}
			100%{
			left: 115px;
			top: 105px;
			}
		}
		@media (max-width:1000px;) {
		  section{
		    margin:30% auto;
		    }
		  }
				
	</style>
  </head>
  
  <body>
  
  <section>
<div class="one">
<div class="main">
<div class="nos">
<div class="hole">	
</div></div></div></div>

<div class="two">
<div class="main">
<div class="nos">
<div class="hole">

</div></div></div></div>
<div class="three">
<div class="main">
<div class="nos">
<div class="hole">
	
</div></div></div></div>
<div class="four">
<div class="main">
<div class="nos">
<div class="hole">
	
</div></div></div></div>
<h1>userlogin...</h1>
</section>
    	
  </body>
</html>
