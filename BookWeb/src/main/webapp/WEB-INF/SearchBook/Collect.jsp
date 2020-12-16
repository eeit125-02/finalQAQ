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
	<div class="container media">
		<label id="test"></label>

		<!-- 內容開始 -->


		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



			<br>
			<hr>
			<br>
			<div class="collect">
				<a class="btn btn-outline-dark" href="Search.jsp" role="button">搜尋首頁</a>
			</div>
			<br>
			<h3>收藏清單：</h3>
			<br>
		<c:forEach items="${collectresult}" var="row">

			<div class="book">
				<img class="itemcov" alt="" src="${row.getBook().getBk_Pic()}"
					height="190">

				<h3>${row.getBook().getBk_Name()}</h3>

				作者：${row.getBook().getBk_Author()}<br>
				出版社：${row.getBook().getBk_Publish()} ${row.getBook().getBk_ID()} <br>
				出版日期：${row.getBook().getBk_Date()} <br>

				<p>${row.getBook().getBk_Content()}</p>
				<p>${row.getBc_ID()}</p>

				<div class="collect">
					<form name=a1 action="<c:url value='/deletecollect' />" method="get">
					<button type="submit" name="deletebc"
							class="btn btn-outline-danger btn-sm" value="${row.getBc_ID()}">取消收藏</button></form>
				</div>

			</div>
		</c:forEach>

	</div>



	<!-- 內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>