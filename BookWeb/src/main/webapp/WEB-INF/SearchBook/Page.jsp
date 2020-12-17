<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book_message2.css">
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
	<div class="container">
		<label id="test"></label>

		<!-- 		內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


		<br>
		<hr>
		<br>
		<div class="collect">
			<a class="btn btn-outline-dark" href="Search.jsp" role="button">搜尋首頁</a><br>
			<br> 			
			<form name=a3 action="<c:url value='/collectlist' />" method="get"><button type="submit" name="list"
					class="btn btn-outline-dark" value="5">收藏清單</button></form>
			<!-- value=會員ID -->
		</div>

		<div class="row">
			<div class="col-sm-5">

				<p class="s-corner">
					<img class="mainpic" alt="" src="${pageresult.bk_Pic}" height="390">
				</p>
				<div class="detail">
					<h6>詳細資訊：</h6>
					<p>
						ISBN：${pageresult.bk_ISBN}<br> 頁數：${pageresult.bk_Page}<br>
					</p>

				</div>

				<div class="detail">
					<h6>相關書評連結：</h6>
					<ul>
						<li>連結1</li>
						<li>連結2</li>
						<li>連結3</li>

					</ul>
				</div>



			</div>
			<div class="col-sm-7">

				<div class="back">
					<h2 class="title">${pageresult.bk_Name}</h2>
					<hr>
					<br>
					<h5>作者：${pageresult.bk_Author}</h5>
					<h5>出版社：${pageresult.bk_Publish}</h5>
					<h5>出版日期：${pageresult.bk_Date}</h5>
					<br>
					<figure>
						<h5>內容簡介：</h5>
						<p>${pageresult.bk_Content}</p>
					</figure>

					<div class="collect">
						<form name=a1 action="<c:url value='/pagecollect' />" method="get">
						<img alt="點選收藏" src="${pageContext.request.contextPath}/image/heartred.png" id="heart" width="25px">
						<button type="submit" name="pagecollect"
								class="btn btn-outline-danger btn-sm"
								value="${pageresult.bk_ID}">收藏本書</button></form> 
						
						<form name=a2 action="<c:url value='/updatebook' />" method="get">
						<button type="submit" name="update" class="btn btn-outline-info btn-sm"
								value="${pageresult.bk_ID}">修改書訊</button></form>

					</div>


				</div>




				<div class="detail">
					<h6>二手拍賣連結：</h6>
					<ul>
						<li>連結1</li>
						<li>連結2</li>
						<li>連結3</li>
					</ul>
					<div class="follow">
						＊有二手書時通知我 <img alt="加入追蹤" src="${pageContext.request.contextPath}/image/heartwhite.png" id="heart"
							width="25px">
					</div>

				</div>


			</div>
		</div>

	</div>




	<!-- 		內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>