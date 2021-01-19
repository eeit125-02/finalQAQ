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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
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
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media">
		<!-- body -->

		<FORM action="<c:url value='/QAQbook'/>" method="post">
			<div class="row">
				<div class="col-lg-12">書名: ${bookStore.book.bk_Name}</div>
			</div>
			<BR>
			<div class="row">
				<div class="col-lg-12">作者: ${bookStore.book.bk_Author}</div>
			</div>
			<BR>
			<div class="row">
				<div class="col-lg-12">出版社: ${bookStore.book.bk_Publish}</div>
			</div>
			<BR>
			<div class="row">
				<div class="col-lg-12">出版日期: ${bookStore.book.bk_Date}</div>
			</div>
			<BR>
			<div class="row">
				<div class="col-lg-12">
					價錢 : <INPUT TYPE="TEXT" NAME="price" value="${bookStore.bs_Price}">
				</div>
			</div>
			<BR>
			<div class="row">
				<div class="col-lg-12">
					數量 : <INPUT TYPE="TEXT" NAME="qty" value="${bookStore.bs_Num}">
				</div>
			</div>
			<br>

			<button type="submit" name="updatebk" value="${bookStore.bks_ID}" class="btn btn-outline-secondary">確定修改</button>
		</FORM>



		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>