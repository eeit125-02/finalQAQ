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
<link rel="stylesheet" href="css/login.css">
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

div {
	margin-left: 50px;
}

form{
	margin:auto;
}
.send button {
	font-size: 16px;
	text-align: center;
}

.send {
	margin: 0px;
	text-align: center;
}

span {
	font-size: 10px;
}

.space {
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<body>
<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
<div class="container media"><br>

	<form action="<c:url value="/confirm" />" method="post">
		<fieldset>
			<legend>會員確認</legend>
			<div>
				<label>帳號:</label>
				<h3 id="mb_Account">${reg_member.mb_Account}</h3>
			</div>
			<div>
				<label>密碼:</label>
				<h3 id="mb_Password">${reg_member.mb_Password}</h3>
			</div>
			<div>
				<label>姓名:</label>
				<h3 id="mb_Name">${reg_member.mb_Name}</h3>
			</div>
			<br>
			<div class="space">
				<label>性別:</label>
				<h3 id="mb_Sex">${reg_member.mb_Sex}</h3>
			</div>
			<div>
				<label>生日:</label>
				<h3 id="mb_Birthday">${reg_member.mb_Birthday}</h3>
			</div>
<!-- 			<br /> -->
<!-- 			<div> -->
<!-- 				<label>地址:</label> -->
<%-- 				<h3 id="mb_Address">${reg_member.mb_Address}</h3> --%>
<!-- 			</div> -->
<!-- 			<br /> -->
<!-- 			<div> -->
<!-- 				<label>電話:</label> -->
<%-- 				<h3 id="mb_Tel">${reg_member.mb_Tel}</h3> --%>
<!-- 			</div> -->
<!-- 			<br /> -->
			<div>
				<label>E-mail:</label>
				<h3 id="mb_Mail">${reg_member.mb_Mail}</h3>
			</div>
			<br />
<!-- 			<div> -->
<!-- 				<label>喜好類型:</label><br /> -->
<%-- 				<h3 id="mb_type">${reg_member.mb_type}</h3> --%>
<!-- 			</div> -->
			<div>
				<button type="button" id="submit1" name="confirm">送出</button>
				<button>
					<a href="<c:url value="/toRegiste" />" />返回
				</button>
			</div>
			<br>
		</fieldset>
	</form>
		</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	
</body>
<script>
		$('#submit1').click(function() {
			window.alert('註冊成功');
			$('form').submit();
		})
	
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
	});	
</script>
</html>