<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Backloginview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="manager/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			window.onload = function(){
				
			/**
	 * 输入框被点击
	 */
	function onClick(){

		//对函数的第一个参数进行判断
		if (arguments[0]) {
			var obj = arguments[0];
		}else{
			return false;
		}

		//获取.tooltip
		var tooltip = $(obj).siblings('.tooltip');
		//.tooltip如果存在，就滑出
		if (tooltip.length != 0) {
			//对函数第二个参数进行判断
			if (arguments[1]) {
				var text = arguments[1];
			}else{
				text = tooltip.data('text');
			}
			//设置提示框文字
			tooltip.text(text);
			//滑出提示框
			tooltip.animate({left:'120%'});
		};
	}

	/**
	 * 输入框失去焦点
	 */
	function onBlur(){
		//对函数的第一个参数进行判断
		if (arguments[0]) {
			var obj = arguments[0];
		}else{
			return false;
		}
	
		//获取.tooltip
		var tooltip = $(obj).siblings('.tooltip');
		//.tooltip如果存在，就滑入
		if (tooltip.length != 0) {
			tooltip.animate({left:'20%'});
		};
	}

	/**
	 * 表单验证
	 */
	function checkForm(){
		//对函数的第一个参数进行判断
		if (arguments[0]) {
			//获取当前表单
			var form = arguments[0];
		}else{
			return false;
		}

		//验证规则汇总
		var id = new RegExp(/[0-9]{18}/);//匹配数字18次，用于身份证号码匹配
		var password = new RegExp(/\w{6,16}/);//字母6到16次，用于密码匹配
		var chinese = new RegExp(/[^\u4e00-\u9fa5]|^$/);//匹配中文以外的字符，用于真实姓名验证
		var email = new RegExp(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/);//用于邮箱格式验证

		//用户名username验证(同样适用身份证验证)
		if (form.username != undefined && !id.test(form.username.value)) {
			//不符合匹配规则
			onClick($(form.username)[0],'身份证号码不规范，应为18位数字');
			//阻止页面跳转
			return false;
		};

		//密码password验证
		if (form.password != undefined && !password.test(form.password.value)) {
			//不符合匹配规则
			onClick($(form.password)[0],'密码不规范，应为6~16位字母和数字');
			//阻止页面跳转
			return false;
		};

		//用户类型type验证
		if ($(form).find('.option_result').text() == '用户类型') {
			//用户没有勾选
			onClick($('.option_result')[0],'请选择用户类型');
			//阻止页面跳转
			return false;
		};

		//真实姓名realname验证
		if (form.realname != undefined && chinese.test(form.realname.value)) {
			//有非中文字符
			onClick($(form.realname)[0],'姓名不规范');
			//阻止页面跳转
			return false;
		};

		
	
	}


	$(document).ready(function(){
		/**
		 * 展开/收起下拉列表
		 */
		$('.option').click(function(){
			$(this).children('.option_list').slideToggle(100);
			$(this).toggleClass('active');
		});

		/**
		 * 设置option的值
		 */
		$('.option_list li').click(function(){
			//获取选择的值
			var text = $(this).text();
			//设置option的值
			$(this).parent().siblings('.option_result').text(text);
			//如果存在就收起提示栏
			var tooltip = $(this).parent();//原生js的parentNode是属性而不是方法
			if (tooltip.length != 0) {
				onBlur(tooltip[0]);//需要传入原生js对象
			};
		});

		/**
		 * 切换到注册栏
		 */
		$('#register_link').click(function(){
			//滑出#login栏，滑入#register栏
			$('#login').animate({left:'-100%'},400,function(){
				$('#register').animate({left:'50%'});
			});
		});

		/**
		 * 切换到登陆栏
		 */
		$('#login_link').click(function(){
			//滑出#register栏，滑入#login栏
			$('#register').animate({left:'120%'},400,function(){
				$('#login').animate({left:'50%'});
			});
		});

		/**
		 * 登录
		 */
		$('#login_btn').click(function(){
			var $obj = $(this);
			$obj.text('登录中...');
			setTimeout(function(){
				$obj.text('登录');
			},5000);
		});

		/**
		 * 注册
		 */
		$('#register_btn').click(function(){
			var $obj = $(this);
			$obj.text('注册中...');
			setTimeout(function(){
				$obj.text('注册');
			},5000);
		});

		

	});
	}
		</script>
		<style type="text/css">

			
			html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video 
			{
				margin: 0;
				padding: 0;
				border: 0;
				font-size: 100%;
				font: inherit;
				vertical-align: baseline;
			}
			
			article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section 
			{
				display: block;
			}
			
			body {
				line-height: 1;
			}
			
			ol,
			ul {
				list-style: none;
			}
			
			blockquote,
			q {
				quotes: none;
			}
			
			blockquote:before,
			blockquote:after,
			q:before,
			q:after {
				content: '';
				content: none;
			}
			
			table {
				/*border-collapse: collapse;*/
				border-spacing: 0;
			}
			/* #Basic Styles
================================================== */
			
			body {
				background: #87CEFA;
				overflow: hidden;
				font: normal 16px/1.5 Helvetica, "Microsoft Yahei", Arial, sans-serif;
				color: #444;
				-webkit-font-smoothing: antialiased;
				/* Fix for webkit rendering */
				-webkit-text-size-adjust: 100%;
				
			}
			
			input {
				padding: 10px 15px;
				outline: 0;
				border: 0;
				border-radius: 3px;
				width: 200px;
			}
			
			a,
			a:visited {
				color: #333;
				text-decoration: none;
				outline: 0;
			}
			
			a:hover,
			a:focus {
				color: #000;
			}
			/*云层*/
			
			#clouds {
				position: absolute;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
			}
			
			[class^="cloud-"] {
				position: absolute;
				right: 120%;
				width: 200px;
				height: 60px;
				background: white;
				-webkit-border-radius: 200px;
				-moz-border-radius: 200px;
				border-radius: 200px;
			}
			
			[class^="cloud-"]:before,
			[class^="cloud-"]:after {
				content: '';
				position: absolute;
				top: -15px;
				left: 10px;
				width: 100px;
				height: 80px;
				background: #fff;
				-webkit-border-radius: 100px;
				border-radius: 100px;
				-webkit-transform: rotate(30deg);
				-moz-transform: rotate(30deg);
				transform: rotate(30deg);
			}
			
			[class^="cloud-"]:after {
				top: -55px;
				left: auto;
				right: 15px;
				width: 120px;
				height: 120px;
			}
			
			.cloud-1 {
				top: 50px;
				
				animation: moveclouds 30s linear infinite;
			}
			
			.cloud-2 {
				top: 100px;
				opacity: 0.8;
				-webkit-transform: scale(0.8);
				-moz-transform: scale(0.8);
				transform: scale(0.8);
				
				animation: moveclouds 45s linear infinite;
				
				animation-delay: 5s;
			}
			
			.cloud-3 {
				top: 150px;
				opacity: 0.6;
				-webkit-transform: scale(0.6);
				-moz-transform: scale(0.6);
				transform: scale(0.6);
				
				animation: moveclouds 40s linear infinite;
			}
			
			.cloud-4 {
				top: 200px;
				opacity: 0.75;
				-webkit-transform: scale(0.75);
				-moz-transform: scale(0.75);
				transform: scale(0.75);	
				animation: moveclouds 26s linear infinite;
				animation-delay: 8s; 
			}
			
			/*云层移动*/
			
			@-webkit-keyframes moveclouds {
				0% {
					right: -20%;
				}
				100% {
					right: 120%;
				}
			}
			
	
			/* #Content Styles
================================================== */
			/*内容*/
			
			#content {
				width: 100%;
			
			}
			
			.container {
				width: 960px;
				margin: 0 auto;
				text-align: center;
			}
			/*登录/注册*/
			
			#login,
			#register {
				width: 400px;
				height: 380px;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-top: -200px;
				margin-left: -200px;
				background: #F8F8F8;
				border-radius: 10px;
				box-shadow: 0 3px 6px rgba(0, 0, 0, 0.5);
			}
			
			#register {
				left: 120%;
			}
			
			#login_header,
			#register_header {
				height: 60px;
				line-height: 60px;
				font-size: 20px;
				font-weight: bold;
				color: #77CA60;
				background: #FFF;
				border-radius: 10px 10px 0 0;
				-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
				-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
				box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
			}
			
			.icon-home {
				font-size: 30px;
				position: relative;
				top: 3px;
			}
			
			#login_content,
			#register_content {
				height: 200px;
				padding: 30px 20px;
			}
			
			input {
				width: 300px;
				padding: 14px 15px;
				background: #F0F0F0;
				font: normal 16px/1.5 Helvetica, "Microsoft Yahei", Arial, sans-serif;
				color: #444;
			}
			
			span {
				position: relative;
				display: inline-block;
				height: 50px;
				margin-bottom: 30px;
			}
			
			.tip {
				text-indent: 80px;
				-webkit-transition: all .3s ease-in-out;
				-moz-transition: all .3s ease-in-out;
				transition: all .3s ease-in-out;
			}
			
			.tip:focus,
			.tip:active {
				text-indent: 0;
			}
			
			.tip+label {
				position: absolute;
				top: 16px;
				left: 15px;
				-webkit-transition: all .3s ease-in-out;
				-moz-transition: all .3s ease-in-out;
				transition: all .3s ease-in-out;
			}
			
			.tip:focus+label,
			.tip:active+label {
				-webkit-transform: translateY(-40px);
				-moz-transform: translateY(-40px);
				transform: translateY(-40px);
			}
			
			.icon-user,
			.icon-lock {
				position: absolute;
				top: 16px;
				right: 14px;
				color: #999;
			}
			
			.tooltip {
				width: 200px;
				padding: 14px;
				position: absolute;
				left: 20%;
				top: 0;
				right: 0;
				color: #999;
				background: white;
				text-align: left;
				z-index: -1;
				box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
			}
			
			.tooltip:after {
				width: 0;
				height: 0;
				content: "";
				position: absolute;
				right: 100%;
				top: 18px;
				color: #87CEFA;
				border: 8px solid;
				border-right-color: white;
			}
			
			#login_footer,
			#register {}
			
			#login_btn,
			#register_btn {
				width: 100%;
				height: 60px;
				line-height: 60px;
				outline: 0;
				border: none;
				color: white;
				font-weight: bold;
				font-size: 20px;
				background: #77CA60;
				border-radius: 0 0 10px 10px;
				cursor: pointer;
				text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
			}
			
			.ing {
				width: 100%;
				height: 5px;
				position: absolute;
				bottom: 60px;
			}
			
			#register_link,
			#login_link {
				width: 80px;
				display: block;
				margin: 20px auto;
				color: white;
				border-bottom: 1px dashed;
			}
			select{
			fonr-size:20px;
			}
			.select_emp{
				width:300px;
				height:50px;
				border-radius: 3px;
				border:none;
				background:#eee;
				fonr-size:20px;
				font-family: "微软雅黑";
				text-indent: 12px;
			}
		</style>

  </head>
  
  <body>
    <script type="text/javascript" color="255,0,60" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
 <!-- 背景云层 -->
	<div id="header">
        <div id="clouds">
            <div class="cloud-1" data-speed="35000"></div>
            <div class="cloud-2" data-speed="45000" data-delay="15000"></div>
            <div class="cloud-3" data-speed="40000"></div>
            <div class="cloud-4" data-speed="38000" data-delay="20000"></div>
        </div>
	</div><!-- / #header -->

    <div id="content">
        <div class="container">            
            <!-- 登录模块 -->
            <form id="login" method="post" action="/hospital/Emp_loginServlet" onsubmit="return checkForm(this);">
                <div id="login_header"><i class="icon-home"></i>医院内部管理系统</div>
                
                <div id="login_content">
                    <span>
                        <input class="tip" name="username" type="text" maxlength="18" onclick="onClick(this);" onblur="onBlur(this);">
                        <label for="username">账号</label>
                        <i class="icon-user"></i>
                        
                    </span>
                    <span>
                        <input class="tip" name="password" type="password" maxlength="16" onclick="onClick(this);" onblur="onBlur(this);">
                        <label for="password">密码</label>
                        <i class="icon-lock"></i>
                  
                    </span>
                 
                </div>
                <!-- / #login_content -->

                <div id="login_footer">
                    <div class="ing"></div>
                    <button id="login_btn" type="submit">登录</button>
                </div><!-- / #login_footer -->

               
            </form><!-- / #login -->

            <!-- 注册模块 -->
            <form id="register" method="post" action="Emp_RegisteredServlet" onsubmit="return checkForm(this);">
                <div id="register_header"><i class="icon-home"></i>新用户注册</div>
                
                <div id="register_content">
                    <span>
                        <input class="tip" name="realname" type="text" maxlength="4" onclick="onClick(this);" onblur="onBlur(this);">
                        <label for="realname">姓名</label>
                        <i class="icon-user"></i>
                    </span>
                    <span>
                        <input class="tip" name="ID" type="text" maxlength="18" onclick="onClick(this);" onblur="onBlur(this);">
                        <label for="ID">账号</label>
                        <i class="icon-lock"></i>
                      
                    </span>
                    <span>
                        <input class="tip" name="password" maxlength="16" type="password" onclick="onClick(this);" onblur="onBlur(this);">
                        <label for="password">密码</label>
                        <i class="icon-lock"></i>
                       
                    </span>
                </div><!-- / #register_content -->

                <div id="register_footer">
                    <div class="ing"></div>
                    <button id="register_btn" type="submit">注册</button>
                </div><!-- / #register_footer -->

                <div><a id="login_link" href="javascript:void(0);">返回登录</a></div>
            </form><!-- / #register -->

        </div><!-- / .container -->
    </div><!-- / #content-->
	
    <div id="footer">
        
        <div class="container">
        </div>
        <!-- / .container -->
    </div>
    <!-- / #footer -->
  </body>
</html>
