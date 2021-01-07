<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<div class="container">
		<!-- body -->
		<div style="text-align: center">
			<h2>二手書圖</h2>
		</div>
		<!-- 搜尋商品欄	 start -->
		<form class="bs-example bs-example-form" role="form"
			action="<c:url value='/qaqSBookName'/>">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<div class="input-group">
						<input type="text" class="form-control" name="sBkNe" placeholder="請輸入書名"> <span
							class="input-group-btn">
							<button type="submit" class="btn btn-outline-secondary">
								<img alt="圖勒?" src='<c:url value="image/qaqsearch.png" />'
									width="20px" height="20px">
							</button>
						</span>
					</div>
				</div>
				<div class="col-lg-4">
					<button type="button" class="btn btn-outline-secondary"
						onclick="storeCheck()">我的賣場</button>
				</div>
			</div>
		</form>
		<br>
		<!-- 搜尋商品欄	end -->
		<!-- 	版面置中 -->

		<!-- 	版面置中 -->
		<div class="row">
			<c:forEach items="${store}" var="v">
				<div class="card col-sm-3" style="margin: 1rem">
					<!-- 圖片跟連結 -->
					<a href="<c:url value='/qaqBookDetail/${v.bks_ID}'/>"> <img
						src="<c:url value=" ${v.book.bk_Pic} " />" class="card-img-top"
						alt="..." style="height: 18rem;">
					</a>
					<!-- 圖片跟連結 -->
					<div class="card-body">
						<!-- 書名連結 -->
						<a href="<c:url value='/qaqBookDetail/${v.book.bk_ID}'/>">${v.book.bk_Name }</a>
						<!-- 書名連結 -->
						<br> <span class="card-text">作者: ${ v.book.bk_Author }</span> <br>
						<span class="card-text">出版社: ${ v.book.bk_Publish }</span> <br> <span
							class="card-text">出版日: ${ v.book.bk_Date }</span> <br> <span
							class="card-text">價錢: ${ v.book.bk_Price }</span> <br>
						<!-- 比價連結 -->
						<a href="<c:url value='/qaqManyPrice?ID=${v.book.bk_ID}'/>">簡介&#149;比價
							$ </a>
						<!-- 比價連結 -->
					</div>
				</div>
			</c:forEach>
		</div>
		<br>
		<!-- 分頁顯示		 -->
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-7">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach items="${store}" begin="1" end="5" varStatus="vs">
							<li class="page-item"><a class="page-link" href="#">${vs.index}</a></li>
						</c:forEach>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- 分頁顯示		 -->
		<!-- 	版面置中 -->

		<!-- 	版面置中 -->



		<!-- body -->
	</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script type="text/javascript">
		function storeCheck() {
			if (typeof ($.cookie('Member_ID')) != "undefined") {
				window.location.href = "//localhost:8080/BookWeb/myStore";
			} else {
				window.location.href = "//localhost:8080/BookWeb/toLogin";
			}
			;
		}
	</script>
</body>
</html>