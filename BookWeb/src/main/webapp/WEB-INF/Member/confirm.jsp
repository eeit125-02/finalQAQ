<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<link rel="stylesheet" href="login.css">
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

div {
	margin-left: 50px;
}

.a11 button {
	font-size: 16px;
	text-align: center;
}

.a11 {
	margin: 0px;
	text-align: center;
}

span {
	font-size: 10px;
}

.a4 {
	margin-bottom: 25px;
}

.a5 {
	margin-bottom: 25px;
}
</style>
</head>

<body>
	<%-- 	<jsp:useBean id="reg_member" class="model.MemberBean" scope="session" /> --%>
	<!-- 	<form action="Register" method="post"> -->
	<form action="<c:url value="/confirm" />" method="post">
		<fieldset>
			<legend>會員確認</legend>
			<div class="a2">
				<label>帳號:</label>
				<p>${reg_member.mb_Account}</p>
			</div>
			<div class="a3">
				<label>密碼:</label>
				<p>${reg_member.mb_Password}</p>
			</div>
			<div class="a1">
				<label>姓名:</label>
				<p>${reg_member.mb_Name}</p>
			</div>
			<br>
			<div class="a5">
				<label>性別:</label>
				<p>${reg_member.mb_Sex}</p>
			</div>
			<div class="a6">
				<label>生日:</label>
				<p>${reg_member.mb_Birthday}</p>
			</div>
			<br />
			<div class="a7">
				<label>地址:</label>
				<p>${reg_member.mb_Address}</p>
			</div>
			<br />
			<div class="a8">
				<label>電話:</label>
				<p>${reg_member.mb_Tel}</p>
			</div>
			<br />
			<div class="a9">
				<label>E-mail:</label>
				<p>${reg_member.mb_Mail}</p>
			</div>
			<br />
			<div class="a10">
				<label>喜好類型:</label><br />
				<p>${reg_member.mb_type}</p>
			</div>
			<div class="a11">
				<button type="submit" name="confirm">送出</button> 
				<button><a href="<c:url value="/toRegiste" />" />返回</button>
			</div>
			<br>
		</fieldset>
			</form>
</body>

</html>