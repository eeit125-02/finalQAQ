<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Document</title>
<!-- <link rel="stylesheet" href="login.css">   -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
/* @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css); */

/* body { */
/* 	font-family: "cwTeXYen", sans-serif; */
/* 	font-weight: 800; */
/* 	line-height: 2; */
/* 	font-size: 18px; */
/* } */

fieldset {
	border-radius: 25px;
	padding: 20px;
	background-color: #F3F3FA;
	width: 400px
}

legend {
	text-align: center;
	font-size: 30px;
}

p {
	margin-top: 5px;
	font-size: 10px
}

input {
	border-top: white;
	border-left: white;
	border-right: white;
	border-bottom: 1px solid gray;
}

.send button {
	font-size: 16px;
	text-align: center;
}

.send {
	margin: 0px;
	text-align: center;
}

span {
	font-size: 10px;
}

.space {
	margin-bottom: 25px;
}

form {
	margin: auto
}

.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container media">
		<br>

		<form action="<c:url value='/registe' />" method="post">
			<fieldset>
				<legend>會員註冊</legend>
				<div>
					<label>帳號:</label> <input type="text" name="account" id="account"
						value="" size="12"> <span id="idsp2" style="color: red;"></span><br />
					<p style="color: gray;">(1.不可空白 2.至少6個字且必須包含英文字母、數字)</p>
				</div>
				<div>
					<label>密碼:</label> <input type="password" name="pwd" id="pwd"
						value="" size="12"> <span id="idsp1" style="color: red;"></span><br />
					<p style="color: gray;">(1.不可空白，2.至少6個字且必須包含英文字母、數字)</p>
				</div>
				<div class="space">
					<label>確認密碼:</label> <input type="password" name="pwd1" id="pwd1"
						value="" size="12"> <span id="idsp9" style="color: red;"></span><br />
				</div>
				<div>
					<label>姓名:</label> <input type="text" id="name1" name="name" size="12" value="">
				</div>
				<br>
				<div class="space">
					<label>性別:</label> <input type="radio" name="sex" id="sex_m"
						onblur="" value="男" checked="checked">男 <input type="radio" name="sex"
						id="sex_g" onblur="" value="女">女 <span id="idsp3"></span>
				</div>
				<div >
					<label>生日:</label> <input type="date" name="birthday" id="birthday"/> 
				</div>
				<br />
				<div>
					<label>E-mail:</label> <input type="email" name="mail" id="mail"
						> <span id="idsp7" style="color: red;"></span><br />
				</div>
				<br>
				<div class="send">
					<button type="button" id="send" class="btn btn-outline-secondary">送出</button>
					<button type="reset" class="btn btn-outline-secondary">清除</button>
				</div>
			</fieldset>
		</form>
	</div>
	<button id="insert">一鍵輸入</button>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
		$('#insert').click(function(){
			$('#account').val("qsxazqoo159");
			$('#pwd').val("aaa111");
			$('#pwd1').val("aaa111");
			$('#name1').val("陳昱豪");
			$('#birthday').val("1994-04-19");
			$('#mail').val("qsxazqoo@gmail.com");
		})
		
		$(document).ready(function() {
			$("#bookWebheader").load("<c:url value='/header'/>");
			$("#bookWebFooter").load("<c:url value='/footer'/>");		
			       //得到当前时间
				var date_now = new Date();
				//得到当前年份
				var year = date_now.getFullYear();
				//得到当前月份
				//注：
				//  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一
				//  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份
				var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
				//得到当前日子（多少号）
				var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
				//设置input标签的max属性
				$("#birthday").attr("max",year+"-"+month+"-"+date);		
		});
		let a1 = false;
		let a2 = false;
		let a3 = false;
		let a4 = false;
		$('#account').blur(function() {
			console.log("test");
			var mb_Account = $('#account').val();
			let mb_Accountlen = mb_Account.length;
			let sp = document.getElementById("idsp2")
			var rex1 = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/
			if (mb_Account == "") {
					a1=false;
				sp.innerHTML = "不可為空白"
			} else if (rex1.test(mb_Account) && mb_Accountlen >= 6) {
				sp.innerHTML = ""
			} else {
					a1=false;
				sp.innerHTML = "格式錯誤"
			}
			let editURL = location.href + "/checkAccount/" + mb_Account;
			$.ajax({
				async : false,
				type : 'POST',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						a1=false;
						sp.innerHTML = "帳號已存在"
							sp.style.color="red";
					} else {
						a1 = true;
						sp.innerHTML = "帳號可使用"
						sp.style.color="green";
					}
				}
			});
		})
		
		$('#mail').blur(function() {
			console.log("test");
			let sp = document.getElementById("idsp7")
			let editURL = "checkMail?mb_Mail=" + $('#mail').val();
			$.ajax({
				async : false,
				type : 'POST',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						a4 =false;
						sp.innerHTML = "信箱已註冊過"
					} else {
						a4 = true;
						sp.innerHTML = "信箱可以使用"
						sp.style.color="green"
					}
				}
			});
		})
		

		$('#pwd').blur(function() {
			let pwd = document.getElementById("pwd").value
			let pwdlen = pwd.length;
			let sp = document.getElementById("idsp1")
			var rex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;
			if (pwd.length >= 6 && rex.test(pwd)) {
				a2 = true;
				sp.innerHTML = "正確"
				sp.style.color="green"
			} else if (pwd == "") {
					a2 = false;
				sp.innerHTML = "密碼不可為空白"
			} else if (pwd.length < 6) {
					a2 = false;
				sp.innerHTML = "密碼不足6碼"
			} else if (pwd != rex.test(pwd)) {
					a2 = false;
				sp.innerHTML = "密碼須包含英文、數字及特殊符號"
			} else {
				sp.innerHTML = "錯誤"
					a2 = false;
			}
		})

		$('#pwd1').blur(function() {
			var pwd = document.getElementById("pwd").value
			let pwd1 = document.getElementById("pwd1").value
			sp = document.getElementById("idsp9")
			if (pwd == pwd1 && pwd1 != "") {
				a3 = true;
				sp.innerHTML = "正確"
				sp.style.color="green"
			} else {
					a3 = false;
				sp.innerHTML = "錯誤"
			}
		})		

		$('#send').click(function() {		
			var mb_Account = $('#account').val();
			var pwd = $('#pwd').val();
			var b = $('#birthday').val();
			var mail = $('#mail').val();
			var name = $('#name1').val();
			console.log(name)
			console.log(mail)
			console.log(mb_Account)
			console.log(pwd)
			console.log(a1)
			console.log(a2)
			console.log(a3)
			console.log(a4)
			console.log(b)
			if (name == "" || mail == "" || mb_Account == "" || pwd =="" || a1 != true || a2 != true || a3 != true || a4 != true || b == "") {
				alert("有資料錯誤");
			} else {
				alert("請至信箱點擊連結後，才完成註冊。")
				$('form').submit();
			}
		})
	</script>
</body>
</html>