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

	<div class="container media">
		<!-- body -->



		<form action="<c:url value='/addMyBook'/>" method="post">
			<button type="submit" name="">我要賣東西</button>
			<br>
		</form>
		<form action="<c:url value='/Transation/storeMain' />" method="post">
			<button type="submit" name="">返回</button>
			<br>
		</form>
		<form action="<c:url value='/updateOrDelete'/>" method="post">
			<table border="2" width="100%">
				<tr>
					<th>編號</th>
					<th>書名</th>
					<th>作者</th>
					<th>出版社</th>
					<th>二手價</th>
					<th>數量</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach var="table" items="${myBookList}">
					<tr>
						<td><c:out value="${table.bks_ID}" /></td>
						<td><c:out value="${table.book.bk_Name}" /></td>
						<td><c:out value="${table.book.bk_Author}" /></td>
						<td><c:out value="${table.book.bk_Publish}" /></td>
						<td><c:out value="${table.bs_Price}" /></td>
						<td><c:out value="${table.bs_Num}" /></td>
						<td><button type="submit" value="${table.bks_ID}"
								name="waitupbk">修改</button></td>
						<td><button type="submit" value="${table.bks_ID}"
								name="deletebk">刪除</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>

<%-- <input type="hidden" name="BK_ID" value="${table.bks_ID}"/> --%>

		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>