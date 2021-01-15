<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.book.model.BookStoreBean"%>
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
		<h1>請從藏書庫中搜尋書名或者按此<a href="<c:url value='addMyBookA'/>">新增</a>一本書</h1>
	</div>
	<br>
	<div class="container media">


		<form action="<c:url value='/searchBookName'/>" method="post">
			<div>
				<input class="search-bar" type="text" name="searchbk" id="search"
					placeholder="輸入名稱">
				<button class="search-btn">搜尋</button>

			</div>
		</form>
	</div>
	<br>
	<div class="container media">
		<%
			if (request.getParameter("searchbk") != null) {
		%>
		<p>
			<%!List<BookStoreBean> list;%>
			<%!BookStoreBean data;%>
			<%
				data = new BookStoreBean();
			list = (List) request.getAttribute("bookName");
			%>
		
		<form action="<c:url value='/addBook'/>" method="post">
			<c:forEach items="${bookName}" var="v">
			<table border="1" width="100%">
				<tr>
					<th width="70">編號</th>
					<th width="320">書名</th>
					<th width="60">作者</th>
					<th width="60">出版社</th>
					<th width="40">二手價</th>
					<th width="110">數量</th>
					<th width="110">&nbsp;</th>
				</tr>
				<tr height='16'>
					<td>${v.book.bk_ID}</td>
					<td>${v.book.bk_Name}</td>
					<td>${v.book.bk_Author}</td>
					<td>${v.book.bk_Publish}</td>
					<td><INPUT TYPE="TEXT" NAME="${v.book.bk_ID}price"></td>
					<td><INPUT TYPE="TEXT" NAME="${v.book.bk_ID}qty"></td>
					<td><button type="submit" value="${v.book.bk_ID}"
							name="setbk">刊登</button></td>
				</tr>
			</table>
			</c:forEach>
		</form>
		<%
			}
		%>



		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>