<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>登录页面</title>
<link rel="stylesheet" href="./layui/css/layui.css">
<script src="./js/jquery-3.3.1.min.js"></script>
</head>
<body onload="createCode()">
	<div class="content">
		<div class="box">

			<div class="pic">
				<img src="./layui/images/123.png"
					style="width: 350px; height: 350px" alt="">
			</div>
			<div class="input">

				<div class="pep">
					<span>后台登录系统</span>
				</div>
				<div class="insert">
					<form id="loginForm" action="user/login" method="post">

						<input type="text" id="name1" name="name" placeholder="请输入客户名称"
							onkeydown="keydown(event);">
						<div class="passed">


							<input type="password" id="password1" name="password"
								placeholder="请输入登录密码" autocomplete="off"
								onkeydown="keydown(event);">
						</div>

						<input type="text" style="width: 100px" id="input1"
							placeholder="请输入验证码" onkeydown="keydown(event);" /> <input
							type="text" onclick="createCode()" readonly="readonly"
							id="checkCode" class="unchanged" style="width: 80px" />

						<button id="btn" onclick="validate();" type="button">登录</button>
					</form>




				</div>
			</div>
		</div>
	</div>
	<script src="./layui/layui.all.js"></script>

</body>
</html>
<script>
	var code; //在全局 定义验证码  
	function createCode() {
		code = "";
		var codeLength =2;//验证码的长度  
		var checkCode = document.getElementById("checkCode");
		var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);//所有候选组成验证码的字符，当然也可以用中文的  

		for (var i = 0; i < codeLength; i++) {

			var charIndex = Math.floor(Math.random() * 10);
			code += selectChar[charIndex];

		}
		//  alert(code);  
		if (checkCode) {
			checkCode.className = "code";
			checkCode.value = code;
		}

	}

	function validate() {
		var inputCode = document.getElementById("input1").value;
		var name = document.getElementById("name1").value;
		var password = document.getElementById("password1").value;
		if (inputCode.length <= 0) {
			alert("请输入验证码！");
		} else if (inputCode != code) {
			alert("验证码输入错误！");
			createCode();//刷新验证码  
		} else if (name.length <= 0 || password.length <= 0 || name.trim() <= 0
				|| password.trim() <= 0) {
			alert("用户名密码不能为空！")
		} else {
			/* document.location.href="index.html"; */
			$("#loginForm").submit();
		}

	}

	function keydown(event) {
		if (event.keyCode == 13) {
			validate();

		}
	}
</script>
<style>
.code {
	background-image: url(code.jpg);
	font-family: Arial;
	font-style: italic;
	color: #AEDD81;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
}

.unchanged {
	border: 0;
}

.content {
	background-color: #f1f7f7 ;
	width: 100%;
	height: 800px;
}

.box {
	width: 800px;
	height: 800px;
	background-color: #f1f7f7 ;
	margin: 0 auto;
	position: relative;
}

.pic {
	width: 300px;
	height: 300px;
	position: absolute;
	top: 100px;
	left: 20px;
}

.input {
	width: 300px;
	height: 350px;
	background-color: #ffffff;
	position: absolute;
	border-radius: 5px;
	right: 50px;
	top: 100px;
}

.pep {
	border-radius: 50%;
	background-color: white;
	position: absolute;
	left: 70px;
	font-size: 27px;
	top: 50px;
	color: #a9a750;
}

.insert {
	position: absolute;
	top: 130px;
	left: 25px;
}

input {
	margin: 10px;
	width: 230px;
	height: 30px;
}

label {
	color: white;
	font-size: 16px;
}

#btn {
	width: 250px;
	height: 40px;
	background-color: #cc6633;
	color: white;
	font-size: 16px;
	border-radius: 5px;
}

#btn-One {
	width: 250px;
	height: 40px;
	background-color: #999966;
	color: white;
	font-size: 16px;
	border-radius: 5px;
	margin-top: 10px;
}

#checkCode {
	position: absolute;
	right: 30px;
	background-color: #ededed;
}
</style>