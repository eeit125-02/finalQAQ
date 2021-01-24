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
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container media">

		<div class="card" style="font-size: 16px">
			<div class="card-header text-center">二手書圖感謝您的購買歡迎再次光臨</div>
			<div class="card-body">
				<h3 class="card-title">交易明細</h3>
				<p class="card-text">日期時間: ${sessionScope.tstime}</p>
				<p class="card-text">交易類別: 信用卡交易</p>
				<p class="card-text">
					交易商品:
					<c:forEach items="${sessionScope.item}" var="v" varStatus="vs">
						<span> ${(vs.index)+1}${v.book.bk_Name} </span>
					</c:forEach>
				</p>
				<p class="card-text">合計: ${sessionScope.total}</p>
			</div>
			<div class="card-footer text-muted">
				<a href="#" class="btn btn-secondary">返回商店</a>
			</div>
		</div>

	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>