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
    background-color: beige;
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

.a10 button{
	margin: auto;
	margin-top: 20px;
	font-size: large;
	background-color: rgb(252, 210, 155);
	border-radius: 10px;
	margin-bottom: 10px;
	width: 115px;
}

span {
	font-size: 50px;
}
</style>
</head>
<body>
	<form action="<c:url value='/login' />" method="post">
		<fieldset>
			<legend>會員登入</legend>
			<div class="a2">
				<label>帳號:</label> <input type="text" name="account" id="account"
					 size="12" onblur="">
			</div>
			<div class="a3">
				<label>密碼:</label> <input type="password" name="pwd" id="pwd"
					 size="12" onblur="">
			</div>
			<div class="a10">
				<button type="submit" style="text-decoration: none" name="submit">登入</button>
			</div>
			<div>
				<a href="password.html">忘記密碼?</a> <a href="account.html">忘記帳號?</a>
			</div>
			<hr>
			<div class="a10">
				<a href="<c:url value='/toRegiste' />" style="text-decoration: none">新帳號註冊</a>
			</div>
			
		</fieldset>
	</form>
</body>
</html>