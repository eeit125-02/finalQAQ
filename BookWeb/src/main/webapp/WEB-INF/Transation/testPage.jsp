<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="icon"
	href="${pageContext.request.contextPath}/image/logo1.ico"
	type="image/x-icon" />
<style>
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

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
	});
</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
	
	
	
	
	
	
	
<!-- 	管理者頁面試做 -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-4"> -->
<!-- 				<label for="url"></label> <img alt="圖勒?" width="300px" -->
<%-- 					height="400px" src="<c:url value='${qaq.book.bk_Pic}'/>"> --%>
<!-- 			</div> -->
<!-- 			<div class="col-lg-8"> -->
<!-- 				<h5>賣場編號:</h5> -->
<%-- 				<span> ${qaq.bks_ID}</span> --%>
<!-- 				<hr> -->
<!-- 				<h5>賣家編號:</h5> -->
<%-- 				<span> ${qaq.member.mb_ID}</span> --%>
<!-- 				<hr> -->
<!-- 				<h5>賣家名子:</h5> -->
<%-- 				<span> ${qaq.member.mb_Name}</span> --%>
<!-- 				<hr> -->
<!-- 				<h5>上架時間:</h5> -->
<%-- 				<span> ${qaq.bs_Date}</span> --%>
<!-- 				<hr> -->
<!-- 				<h5>書本價格:</h5> -->
<%-- 				<span> ${qaq.bs_Price}</span> --%>
<!-- 				<hr> -->
<!-- 				<h5>庫存:</h5> -->
<%-- 				<span>${qaq.bs_Num}</span> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	管理者頁面試做 -->
	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>