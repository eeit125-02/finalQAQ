<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
/* 	background-color: #F3F3FA; */
	height: 900px;
	width: 600px;
}


/* legend { */
/* 	text-align: center; */
/* 	font-size: 30px; */
/* } */

/* p { */
/* 	margin-top: 5px; */
/* 	font-size: 10px */
/* } */

/* input { */
/* 	border-top: white; */
/* 	border-left: white; */
/* 	border-right: white; */
/* 	border-bottom: 1px solid gray; */
/* } */

/* .a2 input, .a1 input, .a5 input, .a6 input { */
/* 	background-color: rgb(206, 203, 203); */
/* } */

/* div { */
/* 	float : center; */
/* 	margin-left: 150px; */
/* } */

/* .a11 button { */
/* 	font-size: 16px; */
/* 	text-align: center; */
/* } */

/* .a11 { */
/* 	margin: 0px; */
/* 	text-align: center; */
/* } */

/* .a4 { */
/* 	margin-bottom: 25px; */
/* } */

/* .a5 { */
/* 	margin-bottom: 25px; */
/* } */
.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

p {
	border: solid 1px border-radius:10px
}

.tr1{
background-color:#68b0ab

}

.tr2{
background-color:#e0ece4
}

</style>
</head>

<body>
	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container media">



		<fieldset id="mb_inf1">

			<legend>會員資料</legend>
			<form>
<!-- 				<fieldset style="background-color:white; width:550px; height:700px"> -->
				<div >
					<img src="${login.mb_pic}" style="width: 200px; height: 200px; text-align:center; border-radius: 50%;" />
				</div>
				<br>

				<table class="table" >
					<tr class="tr1">
						<th scope="col" >帳號</th>
						<th scope="col" >密碼</th>
					</tr>
					<tr class="table-light">
						<td>${login.mb_Account}</td>
						<td>${login.mb_Password}</td>
					</tr>

					<tr class="tr2">
						<th scope="col">姓名</th>
						<th scope="col">性別</th>
					</tr>
					<tr class="table-light">
						<td>${login.mb_Name}</td>
						<td>${login.mb_Sex}</td>
					</tr>

					<tr class="tr2">
						<th scope="col">生日</th>
						<th scope="col">電話</th>
					</tr>
					<tr class="table-light">
						<td>${login.mb_Birthday}</td>
						<td>${login.mb_Tel}</td>
					</tr>

					<tr class="tr2">
						<th colspan="2">Email</th>
					</tr>
					<tr class="table-light">
						<td colspan="2">${login.mb_Mail}</td>
					</tr>

					<tr class="tr2">
						<th colspan="2">地址</th>
					</tr>
					<tr  class="table-light">
						<td colspan="2">${login.mb_Address}</td>
					</tr>

					<tr class="tr2">
						<th colspan="2">喜好類型</th>
					</tr>
					<tr  class="table-light">
						<td colspan="2">${login.mb_type}</td>
					</tr>

				</table>




			</form>
		</fieldset>







			<!-- 			<div class="a2"> -->
			<!-- 				<label>帳號:</label> -->
			<%-- 				<p>${login.mb_Account}</p> --%>
			<!-- 			</div> -->
			<!-- 			<div class="a3"> -->
			<!-- 				<label>密碼:</label> -->
			<%-- 				<p>${login.mb_Password}</p> --%>
			<!-- 			</div> -->
			<!-- 			<div class="a1"> -->
			<!-- 				<label>姓名:</label> -->
			<%-- 				<p>${login.mb_Name}</p> --%>
			<!-- 			</div> -->
			<!-- 			<div class="a5"> -->
			<!-- 				<label>性別:</label> -->
			<%-- 				<p>${login.mb_Sex}</p> --%>
			<!-- 			</div> -->
			<!-- 			<div class="a6"> -->
			<!-- 				<label>生日:</label> -->
			<%-- 				<p>${login.mb_Birthday}</p> --%>
			<!-- 			</div> -->
			<!-- 			<div class="a7"> -->
			<!-- 				<label>地址:</label> -->
			<%-- 				<p>${login.mb_Address}</p> --%>
			<!-- 			</div> -->

			<!-- 			<div class="a8"> -->
			<!-- 				<label>電話:</label> -->
			<%-- 				<p>${login.mb_Tel}</p> --%>
			<!-- 			</div> -->

			<!-- 			<div class="a9"> -->
			<!-- 				<label>E-mail:</label> -->
			<%-- 				<p>${login.mb_Mail}</p> --%>
			<!-- 			</div> -->

			<!-- 			<div class="a10"> -->
			<!-- 				<label>喜好類型:</label><br /> -->
			<%-- 				<p>${login.mb_type}</p> --%>
			<!-- 			</div> -->
			<br>
	</div>

	<script>
		$(document).ready(function() {
			$("#bookWebheader").load("<c:url value='/header'/>");

		});
	</script>
</body>

</html>