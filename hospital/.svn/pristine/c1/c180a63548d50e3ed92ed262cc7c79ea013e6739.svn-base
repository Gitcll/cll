<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Emp_Ad.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
				* {
		  margin: 0;
		}
		
		.cont {
		  position: relative;
		  
		  width: 100vw;
		  height: 100vh;
		}
		
		.container {
		  position: absolute;
		  margin: auto;
		  
		  width: 100px;
		  height: 100px;
		  
		  top: 50%;
		  left: 50%;
		  
		  transform: translate(-50%, -50%);
		  
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  
		/*   background: #faa; */
		}
		
		.letter {
		/*   background: #aff; */
		  display: inline-block;
		  opacity: 1;
		  transition: font-size 10s ease-out 0s, opacity 10s ease-out 0s;
		}
		
		.letter.large { 
		  font-size: 1000px;
		  opacity: 0;
		}
	</style>
	<script>
	window.onload = function(){
	
		var box = document.getElementsByClassName("box")[0];

		function createLetter(letter) {
		  var container = document.createElement("div");
		  container.className = "container";
		  var el = document.createElement("div");
		  el.className = "letter";
		  el.innerHTML = letter;
		  container.appendChild(el);
		  box.appendChild(container);
		  setTimeout(function(){el.classList.toggle("large");}, 100);
		  setTimeout(function(){container.remove();}, 10*1000);
		}
		
		var letters = ['中', '软', '国', '际'];
		
		
		
		function elementTimer() {
		  setInterval(function() {
		    var str = letters[Math.floor(Math.random() * letters.length)];
		    createLetter(str);
		    console.log("it worked");
		  }, 2000);
		}

		elementTimer();
		}
	</script>
  </head>
  
  <body>
   	<div class="box"></div>
  </body>
</html>
