<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="import.css">
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
	background-color: beige;
	width: 400px
}

legend {
	text-align: center;
	font-size: 30px;
}

div {
	text-align: center;
	margin: 30px;
	margin-bottom: 10px;
}

p {
	text-align: center;
	margin-top: 0px;
}

button,a{
border:2px solid ;
background-color:orange;
}
</style>
</head>
<body>
	<form action="./Login" method="post">
		<fieldset>
			<legend>會員中心</legend>
			<div>
				<button type="submit" name="mb_inf">會員資訊</button>
				<a href="Modify.jsp">會員修改</a>				
			</div>
			<a href="login.jsp">登出</a>
		</fieldset>
</body>

</html>