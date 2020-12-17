<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
</style>
</head>
<body>
	<form action="<c:url value='/adminall' />" method="post">
		<fieldset>
			<legend>會員中心</legend>
			<div>
				<button type="submit" name="inf">會員資訊</button>
			</div>
			<a href="<c:url value='/toLogin' />">登出</a>
		</fieldset>
	</form>
</body>

</html>