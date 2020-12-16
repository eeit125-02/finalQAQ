<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<fieldset>
			<legend>會員中心</legend>
			<div>
				<a href="<c:url value='/mb_inf' />"><button type="submit" name="mb_inf" value="${account.account}">會員資訊</button></a>
				<a href="<c:url value='/Modify' />">"><button type="submit" name="Modify" value="${account.account}">會員修改</button></a>				
			</div>
			<a href="login.jsp">登出</a>
		</fieldset>
</body>
</html>