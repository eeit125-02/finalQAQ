<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<link rel="stylesheet" href="import.css">
<!-- <link rel="stylesheet" href="import.css"> -->
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
	float : center;
	margin-left: 150px;
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
		<fieldset>
			<legend>會員資料</legend>
			<img src="${pageContext.request.contextPath}/image/${login.mb_pic}" style="width:140px; height: 150px; float: left"/>
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
			<div class="a5">
				<label>性別:</label>
				<p>${login.mb_Sex}</p>
			</div>
			<div class="a6">
				<label>生日:</label>
				<p>${login.mb_Birthday}</p>
			</div>
			<div class="a7">
				<label>地址:</label>
				<p>${login.mb_Address}</p>
			</div>

			<div class="a8">
				<label>電話:</label>
				<p>${login.mb_Tel}</p>
			</div>

			<div class="a9">
				<label>E-mail:</label>
				<p>${login.mb_Mail}</p>
			</div>

			<div class="a10">
				<label>喜好類型:</label><br />
				<p>${login.mb_type}</p>
			</div>
			<br>
			<a href ="<c:url value='/toCity' />">回上一頁</a>
		</fieldset>
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