<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Document</title>
<!-- <link rel="stylesheet" href="import.css"> -->
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

.a2 input, .a1 input, .a5 input, .a6 input {
	background-color: rgb(206, 203, 203);
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
		<fieldset>
			<legend>會員資料</legend>
			<div class="a2">
				<label>帳號:</label>
				<p>${login.mb_Account}</p>
			</div>
			<div class="a3">
				<label>密碼:</label>
				<p>${login.mb_Password}</p>
			</div>
			<div class="a1">
				<label>姓名:</label>
				<p>${login.mb_Name}</p>
			</div>
			<br>
			<div class="a5">
				<label>性別:</label>
				<p>${login.mb_Sex}</p>
			</div>
			<div class="a6">
				<label>生日:</label>
				<p>${login.mb_Birthday}</p>
			</div>
			<br />
			<div class="a7">
				<label>地址:</label>
				<p>${login.mb_Address}</p>
			</div>
			<br />
			<div class="a8">
				<label>電話:</label>
				<p>${login.mb_Tel}</p>
			</div>
			<br />
			<div class="a9">
				<label>E-mail:</label>
				<p>${login.mb_Mail}</p>
			</div>
			<br />
			<div class="a10">
				<label>喜好類型:</label><br />
				<p>${login.mb_type}</p>
			</div>
			<br>
			<a href ="<c:url value='/toCity' />">回上一頁</a>
		</fieldset>
</body>

</html>