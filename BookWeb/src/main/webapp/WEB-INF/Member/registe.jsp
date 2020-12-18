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
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);

body {
	font-family: "cwTeXYen", sans-serif;
	font-weight: 800;
	line-height: 2;
	font-size: 18px;
}

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

		<form action="<c:url value='/registe' />" method="post" id='aaaaa'>
			<fieldset>
				<legend>會員註冊</legend>
				<div>
					<label>帳號:</label> <input type="text" name="account" id="account"
						value="" size="12" onblur="Checkaccount()"> <span
						id="idsp2"></span><br />
					<p style="color: gray;">(1.不可空白 2.至少6個字且必須包含英文字母、數字)</p>
				</div>
				<div>
					<label>密碼:</label> <input type="password" name="pwd" id="pwd"
						value="" size="12" onblur="Checkpwd()"> <span id="idsp1"></span><br />
					<p style="color: gray;">(1.不可空白，2.至少6個字且必須包含英文字母、數字)</p>
				</div>
				<div class="space">
					<label>確認密碼:</label> <input type="password" name="pwd1" id="pwd1"
						value="" size="12" onblur="Checkpwd1()"> <span id="idsp9"></span><br />
				</div>
				<div>
					<label>姓名:</label> <input type="text" id="name" name="name"
						size="12" value="">
				</div>
				<br>
				<div class="space">
					<label>性別:</label> <input type="radio" name="sex" id="sex_m"
						onblur="" value="男">男 <input type="radio" name="sex"
						id="sex_g" onblur="" value="女">女 <span id="idsp3"></span>
				</div>
<!-- 				<div> -->
<!-- 					<label>生日:</label> <input type="date" name="date" id="date" -->
<!-- 						onblur=""> <span id="idsp4"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
<!-- 				<div> -->
<!-- 					<label>地址:</label> <input type="text" name="address" id="address" -->
<!-- 						onblur=""> <span id="idsp5"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
<!-- 				<div> -->
<!-- 					<label>電話:</label> <input type="text" name="tel" id="tel" onblur=""> -->
<!-- 					<span id="idsp6"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
				<div>
					<label>E-mail:</label> <input type="email" name="mail" id="mail"
						onblur=""> <span id="idsp7"></span><br />
				</div>
				<br>
<!-- 				<div> -->
<!-- 					<label>頭像:</label> <input type="file" name="pic" id="pic" onblur=""> -->
<!-- 					<span id="idsp7"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
<!-- 				<div> -->
<!-- 					<label>喜好類型:</label><br /> <input type="checkbox" name="type" -->
<!-- 						id="type1" value="中">XX <input type="checkbox" name="type" -->
<!-- 						id="type2" value="新">XX <input type="checkbox" name="type" -->
<!-- 						id="type3" value="七">XX <input type="checkbox" name="type" -->
<!-- 						id="type4" value="七">XX <input type="checkbox" name="type" -->
<!-- 						id="type5" value="八">XX<br> <input type="checkbox" -->
<!-- 						name="type" id="type6" value="九">XX <input type="checkbox" -->
<!-- 						name="type" id="type7" value="十">XX <input type="checkbox" -->
<!-- 						name="type" id="type8" value="十1">XX <input -->
<!-- 						type="checkbox" name="type" id="type9" value="二">XX <span -->
<!-- 						id="idsp8"></span><br /> -->
<!-- 				</div> -->
				<br>
				<div class="send">
					<button name="submit" id="submit">送出</button>
					<button type="reset">清除</button>
				</div>
			</fieldset>
		</form>

	</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script >
		$(document).ready(function() {
			$("#bookWebheader").load("<c:url value='/header'/>");
			$("#bookWebFooter").load("<c:url value='/footer'/>");
		});

		let a1 = false;
		let a2 = false;
		let a3 = false;

		$('#account').blur(function() {
			console.log("test");
			let account = document.getElementById("account").value
			let accountlen = account.length;
			let sp = document.getElementById("idsp2")
			var rex1 = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/
			if (account == "") {
				sp.innerHTML = "不可為空白"
			} else if (rex1.test(account) && accountlen >= 6) {
				sp.innerHTML = ""
			} else {
				sp.innerHTML = "格式錯誤"
			}
			let mb_Account = $('#account').val();
			let editURL = location.href + "/checkAccount/" + mb_Account;
			$.ajax({
				async : false,
				type : 'POST',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						sp.innerHTML = "帳號已存在"
					}else {
						sp.innerHTML ="帳號可使用"
							a1 = true;
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
				sp.innerHTML = "正確"
				a2 = true;
			} else if (pwd == "") {
				sp.innerHTML = "密碼不可為空白"
			} else if (pwd.length < 6) {
				sp.innerHTML = "密碼不足6碼"
			} else if (pwd != rex.test(pwd)) {
				sp.innerHTML = "密碼須包含英文、數字及特殊符號"
			} else {
				sp.innerHTML = "錯誤"
			}
		})

		$('#pwd1').blur(function() {
			let pwd = document.getElementById("pwd").value
			let pwd1 = document.getElementById("pwd1").value
			sp = document.getElementById("idsp9")
			if (pwd == pwd1 && pwd1 != "") {
				sp.innerHTML = "正確"
				a3 = true;
			} else {
				sp.innerHTML = "錯誤"
			}
		})

		$('#submit').click(function() {
			if (a1 != true && a2 != true && a3 != true) {
				alert("未填寫正確")	;
			}else {
				$('form').submit();
			}
			
		})
		
	</script>

</body>

</html>