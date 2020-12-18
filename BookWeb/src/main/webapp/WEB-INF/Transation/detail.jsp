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



		<jsp:useBean id="bookdetail" class="com.web.book.model.BookBean" scope="request" />
		<form method="POST">
			<div>
				<label for="url"></label> <img alt="xx" width="200px" height="300px"
					src="<jsp:getProperty name="bookdetail" property="bk_Pic" />">
			</div>
			<div>
				<label for="bk_Name">書名</label>
				<jsp:getProperty name="bookdetail" property="bk_Name" />
			</div>
			<div>
				<label for="bk_Author">作者</label>
				<jsp:getProperty name="bookdetail" property="bk_Author" />
			</div>
			<div>
				<label for="bk_Publish">出版社</label>
				<jsp:getProperty name="bookdetail" property="bk_Publish" />
			</div>
			<div>
				<label for="bk_Content">描述: </label>
				<jsp:getProperty name="bookdetail" property="bk_Content" />
			</div>

			<div>
				<input type="submit" value="放入購物車" name="">
			</div>
		</form>
		
		
		<form action="<c:url value='/Transation/storeMain' />" method="get">
			<button type="submit" name="">返回</button>
			<br>
		</form>



		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>