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
	<form></form>
	<div style="text-align: center">
		<h2>二手書圖</h2>
	</div>
	<div class="container">
		<hr>
		<c:forEach items="${bookPrices}" var="v" begin="0" end="0">
			<div class="row">
				<div class="col-lg-4">
					<label for="url"></label> <img alt="圖勒?" width="200px"
						height="300px" src="<c:url value='${v.bk_Pic}'/>">
				</div>
				<div class="col-lg-8">
					<h2>書名: ${v.bk_Name}</h2>
					<h4>作者: ${v.bk_Author}</h4>
					<h4>出版社: ${v.bk_Publish}</h4>
					<h4>出版日: ${v.bk_PublishDate}</h4>
				</div>
			</div>
		</c:forEach>
		<div class="row">
			<div class="col-lg-3">賣家</div>
			<div class="col-lg-2">二手價</div>
			<div class="col-lg-2">庫存</div>
			<div class="col-lg-2">上架日期</div>
			<div class="col-lg-3">&nbsp;</div>
		</div>
		<hr>
		<c:forEach items="${bookPrices}" var="v">
			<div class="row">
				<div class="col-lg-3">
					<c:out value="${v.mb_Account}" />
				</div>
				<div class="col-lg-2">
					<c:out value="${v.bs_Price}" />
				</div>
				<div class="col-lg-2">
					<c:out value="${v.bs_Num}" />
				</div>
				<div class="col-lg-2">
					<c:out value="${v.bs_Date}" />
				</div>
				<div class="col-lg-3">
					<button type="submit" class="btn btn-outline-secondary"
					onclick="priceDetail(${v.bks_ID})">查看詳細</button>
				</div>
			</div>
			<hr>
		</c:forEach>
	</div>

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script type="text/javascript">
	function priceDetail(bks_ID) {
		document.forms[0].action="<c:url value='/detail?bks_ID=" + bks_ID + "' />" ;
		document.forms[0].method="post";
		document.forms[0].submit();
	}
	</script>
</body>
</html>