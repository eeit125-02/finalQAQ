<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<!-- <link rel="stylesheet" href="import.css">   -->
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
	margin: auto;
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

form {
	margin: auto;
}

input {
	border-top: white;
	border-left: white;
	border-right: white;
	border-bottom: 1px solid gray;
}

.a2 input, .a1 input, .a5 input, .a6 input {
	background-color: rgb(206, 203, 203);
}

div {
	margin-left: 50px;
}

.a11 {
	text-align: center;
}

.a11 input {
	font-size: 16px;
	text-align: center;
	border: 1px solid rgb(206, 203, 203);
	background-color: rgb(233, 162, 115);
	border-radius: 15px;
}

span {
	font-size: 10px;
}

.a5 {
	margin-bottom: 25px;
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
			<form:form method="POST" modelAttribute="MemberBean" enctype="multipart/form-data">
			<fieldset>
				<legend>會員個資</legend>
				<div class="a2">
					<label>帳號:</label>
					<p>${account}</p>
				</div>
				<div class="a5">
					<label>性別:</label> 
					<form:radiobutton value="男" path="mb_Sex" />男 
					<form:radiobutton value="女" path="mb_Sex" />女
					 <span id="idsp3"></span>
				</div>
				<div class="a6">
					<label>生日:</label> <form:input type="date" path="mb_Birthday" value="${mb_inf.mb_Birthday}"/> 
					<span id="idsp4"></span><br />
				</div>
				<br />
				<div class="a7">
					<label>地址:</label> 
					<form:input type="text" id="address" value="${mb_inf.mb_Address}" path="mb_Address" /> <span id="idsp5"></span><br />
				</div>
				<br />
				<div class="a8">
					<label>電話:</label> <form:input type="text" id="tel" value="${mb_inf.mb_Tel}" path="mb_Tel" />
					<span id="idsp6"></span><br />
				</div>
				<br />
				<div class="a9">
					<label>E-mail:</label> 
					<form:input type="email" id="mail" path="mb_Mail" value="${mb_inf.mb_Mail}"/> 
					<span id="idsp7"></span><br />
				</div>
				<div> 
					<label>頭像:</label> <input type="file" name="pic" id="pic" onblur=""> 
					<span id="idsp7"></span><br /> 
				</div>
				<br />
				<div class="a10">
					<label>喜好類型:</label><br /> 
					<form:checkbox  id="type1" value="文學創作" path="mb_type" />文學創作 
					<form:checkbox  id="type2" value="圖文漫畫" path="mb_type" />圖文漫畫 
					<form:checkbox  id="type3" value="商業/理財" path="mb_type" />商業/理財<br> 
					<form:checkbox  id="type4" value="人文/社會" path="mb_type" />人文/社會 
					<form:checkbox  id="type5" value="藝術/生活" path="mb_type"/>藝術/生活
					<form:checkbox  id="type6" value="旅遊/飲食" path="mb_type"/>旅遊/飲食 <br>
					<form:checkbox  id="type7" value="親子/童書" path="mb_type"/>親子/童書 
					<form:checkbox  id="type8" value="學習/考用" path="mb_type"/>學習/考用 
					<form:checkbox  id="type9" value="醫療/科學" path="mb_type"/>醫療/科學
					<span id="idsp8"></span><br />
				</div>
				<br>
				<div class="a11">
					<button type="submit">送出</button>
					<button type="reset">清除</button>
				</div>
			</fieldset>
		</form:form>
	</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script>
		$(document).ready(function() {
			$("#bookWebheader").load("<c:url value='/header'/>");
			$("#bookWebFooter").load("<c:url value='/footer'/>");
		});

		function Checkpwd() {
			let pwd = document.getElementById("pwd").value
			let pwdlen = pwd.length;
			let sp = document.getElementById("idsp1")
			var rex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;
			if (pwd.length >= 6 && rex.test(pwd)) {
				sp.innerHTML = "正確"
			} else if (pwd == "") {
				sp.innerHTML = "密碼不可為空白"
			} else if (pwd.length < 6) {
				sp.innerHTML = "密碼不足6碼"
			} else if (pwd != rex.test(pwd)) {
				sp.innerHTML = "密碼須包含英文、數字及特殊符號"
			} else {
				sp.innerHTML = "錯誤"
			}
		}

		function Checkpwd1() {
			let pwd = document.getElementById("pwd").value
			let pwd1 = document.getElementById("pwd1").value
			sp = document.getElementById("idsp9")
			if (pwd == pwd1 && pwd1 != "") {
				sp.innerHTML = "正確"
			} else
				sp.innerHTML = "錯誤"

		}
	</script>
</body>

</html>

</body>
</html>