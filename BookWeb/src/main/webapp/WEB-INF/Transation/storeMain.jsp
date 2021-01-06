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
<!-- 偷偷放購物車QAQ start -->
	<br>
		<a href="<c:url value='/shopping' />"><img alt="wtf..."
			src="${pageContext.request.contextPath}/image/shoppingCart.png"
			width="30px" height="30px"></a>
<!-- 偷偷放購物車QAQ end -->
	<br>
	<div class="container media">
		<form action="<c:url value='/qaqTest'/>" method="get">
			<button type="submit" name="">QAQ</button>
		</form>
	</div>
<!-- 	<br> -->
<!-- 	<div class="container media"> -->
<%-- 		<form action="<c:url value='/boobplay'/>" method="get"> --%>
<!-- 			<button type="submit" name="">按了會爆炸</button> -->
<!-- 		</form> -->
<!-- 	</div> -->
	<br>
	<div class="container media">
		<span style="color: red;">${same}</span>
		<form action="<c:url value='/myStore'/>" method="get">
			<button type="submit" name="">我的清單</button>
		</form>
	</div>
	<br>
	<div class="container media">
		<form action="<c:url value='/detail'/>" method="get">
			<table border="1" width="130%">
				<tr>
					<th>&nbsp;</th>
					<th>圖片</th>
					<th>名字</th>
					<th>作者</th>
				</tr>
				<c:forEach var="table" items="${bookstore}" begin="0" end="20">
					<tr>
						<th><button type="submit" value="${table.book.bk_ID}"
								name="selectbk">檢視</button></th>
						<td><img alt="XX" src="<c:out value="${table.book.bk_Pic}"/>"
							width="50px" height="50px"></td>
						<td><c:out value="${table.book.bk_Name}" /></td>
						<td><c:out value="${table.book.bk_Author}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>



		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>