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
<title>我的賣場</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media">
		<!-- body -->
		<form action="<c:url value='/addMyBook'/>" method="post">
			<button type="submit" class="btn btn-outline-info">我要賣東西</button>
			<br>
		</form>
	</div>
	<br>
	<div class="container">
		<c:choose>
			<c:when test="${not empty myBookList}">
				<form action="<c:url value='/updateOrDelete'/>" method="post">
					<div class="row">
						<div class="col-lg-2">上架時間</div>
						<div class="col-lg-2">書名</div>
						<div class="col-lg-1">作者</div>
						<div class="col-lg-1">出版社</div>
						<div class="col-lg-2">出版日</div>
						<div class="col-lg-1">二手價</div>
						<div class="col-lg-1">數量</div>
						<div class="col-lg-2"></div>
					</div>
					<hr>
					<c:forEach var="v" items="${myBookList}">
						<div class="row">
							<div class="col-lg-2">${v.bs_Date}</div>
							<div class="col-lg-2">${v.book.bk_Name}</div>
							<div class="col-lg-1">${v.book.bk_Author}</div>
							<div class="col-lg-1">${v.book.bk_Publish}</div>
							<div class="col-lg-2">${v.book.bk_Date}</div>
							<div class="col-lg-1">${v.bs_Price}</div>
							<div class="col-lg-1">${v.bs_Num}</div>
							<div class="col-lg-2">
								<button type="submit" value="${v.bks_ID}" name="waitupbk"
									class="btn btn-outline-info" onclick="update(${v.bks_ID})">修改</button>
								<button type="submit" value="${v.bks_ID}" name="deletebk"
									class="btn btn-outline-info" onclick="delete(${v.bks_ID})">刪除</button>
							</div>
						</div>
						<hr>
					</c:forEach>
				</form>
			</c:when>
			<c:otherwise>			
					<h1>您現在並無任何上架商品。</h1>
			</c:otherwise>
		</c:choose>
		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
<script type="text/javascript">

// function dalete(bks_ID) {
// 	$.ajax({
// 		async : false,
// 		type : 'POST',
// 		url : "http://localhost:8080/BookWeb/Transation/tryUpdateDelete",
// 		dataType : "json",
// 		contentType : "application/json;charset=utf-8",
// 		error : function(){
// 			alert("你寫錯囉");
// 		}
// 		success : function(data) {
			
// 		}
// 	})
// }

</script>
</body>
</html>