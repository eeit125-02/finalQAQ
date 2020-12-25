<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="memberbean.*"
	import="member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
<!-- <link rel="stylesheet" href="import.css"> -->
<style>
/* @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css); */
/* body { */
/* 	font-family: "cwTeXYen", sans-serif; */
/* 	font-weight: 800; */
/* 	line-height: 2; */
/* 	font-size: 16px; */
/* } */
/* .btn-box { */
/* 	display: inline-block; */
/* 	vertical-align: middle; */
/* 	width: 40px; */
/* 	height: 20px; */
/* 	border-radius: 100px; */
/* 	background-color: #ccc; */
/* 	box-shadow: 0px 3px 0px rgba(0, 0, 0, .13) inset; */
/* } */

/* .btn-box .btn { */
/* 	display: inline-block; */
/* 	width: 20px; */
/* 	height: 20px; */
/* 	border-radius: 50%; */
/* 	background-color: #fff; */
/* 	margin-left: 0; /*動畫從ml為0開始*/ */
/* 	transition: .5s; */
/* 	box-shadow: 1px 2px 5px rgba(0, 0, 0, .3); */
/* } */

/* .checkbox { */
/* 	position: absolute; */
/* 	opacity: 0; */
/* } */

/* .checkbox:checked+.btn-box { */
/* 	background-color: #8f8; */
/* } */

.checkbox:checked+.btn-box .btn { 
	margin-left: 20px; 
 } 

fieldset {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: #F3F3FA;
	width: 1100px
}

.a tr, .a td, .a th {
	text-align: center;
	border: 5px solid white;
	border-radius: 20px;
}

form {
	margin: auto
}

button {
	margin-right: 10px;
}

legend {
	text-align: center;
	font-size: 18px;
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
		<br>
		<form action="<c:url value='/delete' />" method="post">
			<fieldset>
				<legend>會員清單</legend>
				<table class="a" width="100%">
					<tr>
						<th>帳號</th>
						<th>密碼</th>
						<th>姓名</th>
						<th>註冊日期</th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach items="${memberall}" var="u">
						<tr>
					<input type="hidden" id="${u.getMb_Account()}" value="${u.getMb_Account()}"/>
							<td>${u.getMb_Account()}</td>
							<td>${u.getMb_Password()}</td>
							<td>${u.getMb_Name()}</td>
							<td>${u.getMb_Date()}</td>
							<td><button type="submit" name="delete"
									class="btn btn-outline-secondary" value="${u.getMb_ID()}"
									onclick="confirmChoice( )">
									刪除
									<button type="submit" name="update"
										class="btn btn-outline-secondary" value="${u.getMb_Account()}"
										onclick="confirmChoice( )">修改</td>
							<td>
								<button type="button" id="colume">狀態</button>
								<span id="a50"></span>
								</td>
						</tr>
					</c:forEach>
				
				</table>
				
				<a href="<c:url value='/toAdmin'/>">返回</a>
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
		
		$("#colume").click(function(){
			let mb_Account = $("#"+${u.getMb_Account()}).val();
			let sp = $("#a50");
			let editURL = location.href + "/checkColume/" + mb_Account;
			$.ajax({
				async : false,
				type : 'POST',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(abc) {
					console.log(abc)
					if (abc == true) {
						sp.text("正常");
					} else {
						sp.text("停權");
					}
				}
			});	
		})
	</script>
</body>

</html>