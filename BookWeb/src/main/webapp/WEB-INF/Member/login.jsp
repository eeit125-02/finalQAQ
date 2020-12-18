<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- link rel="stylesheet" href="login.css"> -->
<style>
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
body{
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

div {
	text-align: center;
}

.login button{
	margin: auto;
	margin-top: 20px;
	font-size: large;
	background-color: white;
	border-radius: 10px;
	margin-bottom: 10px;
	width: 115px;
}

span {
	font-size: 50px;
}

form{
	margin:auto;
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
	<form action="<c:url value='/login' />" method="post">
		<fieldset>
			<legend>會員登入</legend>
			<div>
				<label>帳號:</label> <input type="text" name="account" id="account"
					 size="12" onblur="">
			</div>
			<div>
				<label>密碼:</label> <input type="password" name="pwd" id="pwd"
					 size="12" >
			</div>
			<div class="login">
				<button type="submit" style="text-decoration: none" name="submit">登入</button>
			</div>
			<div>
				<a href="password.html">忘記密碼?</a> <a href="account.html">忘記帳號?</a>
			</div>
			<hr>
			<div>
				<a href="<c:url value='/toRegiste' />" style="text-decoration: none">新帳號註冊</a>
			</div>
			
		</fieldset>
	</form>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	
	<script>
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
	});
</script>
</body>
</html>