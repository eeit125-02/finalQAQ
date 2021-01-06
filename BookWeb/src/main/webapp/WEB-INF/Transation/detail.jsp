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
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->


	<!-- body -->

	<div style="text-align: center">
		<h2>二手書圖</h2>
	</div>
	<div class="container">
		<hr>
		<div class="row">
			<div class="col-lg-3">
				<label for="url"></label> <img alt="圖勒?" width="200px"
					height="300px" src="<c:url value='${bookdetail.bk_Pic}'/>">
			</div>
			<div class="col-lg-9">
				<h2>書名:</h2>
				<span>${bookdetail.bk_Name}</span>
				<hr>
				<h4>作者:</h4>
				<span>${bookdetail.bk_Author}</span>
				<hr>
				<h4>出版社:</h4>
				<span>${bookdetail.bk_Publish}</span>
				<hr>
				<h4>出版日:</h4>
				<span> ${bookdetail.bk_Date}</span>
				<hr>
				<h4>價錢:</h4>
				<span>${bookdetail.bk_Price}</span>
			</div>
		</div>
		<!-- 		qaq -->
		<form action="<c:url value='shopping' />" method="get">
			<div>
				<button type="submit" value="${bookdetail.bk_ID}" name="goToCart">直接購買</button>
				<br>

			</div>
			<div>
				<button type="submit" value="${bookdetail.bk_ID}" name="addCart">放入購物車</button>
			</div>
			${same}
		</form>
		<!-- 		qaq -->
		<hr>
		<div class="col-lg-12">
			<textarea rows="20" cols="150" readonly="readonly"
				style="border-style: none;">
			${bookdetail.bk_Content }
			</textarea>
		</div>
	</div>
	<form action="<c:url value='/qaqTest' />" method="get">
		<button type="submit" name="">返回</button>
		<br>
	</form>
	<!-- body -->


	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>