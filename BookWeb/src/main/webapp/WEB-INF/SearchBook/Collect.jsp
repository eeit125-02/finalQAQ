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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottle.css">
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

		<!-- 內容開始 -->


		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



			<br><hr><br>
			<div class="collect">
				<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			</div>
			<br>
			<h3>收藏清單：</h3>
			<br><br>
			
<c:forEach items="${collectresult}" var="row">
		<div class="row">
<!--圖片 -->
			<div class="col-sm-2">			
				<img class="itemcov" alt="" src="${row.getBook().getBk_Pic()}" height="190">
			</div>
<!--書名&作者&出版社&簡介-->
			<div class="col-sm-10">
				<h3>
					<form name=a1 action="<c:url value='/bookpage' />" method="get">
					<button type="submit" name="page"class="btn btn-link btn-lg" value="${row.getBook().getBk_ID()}">
							${row.getBook().getBk_Name()}</button></form>
				</h3>
<!-- 				<img alt="書籍資訊" -->
<%-- 							src="${pageContext.request.contextPath}/image/book.png"width="30px"> 作者：${row.getBook().getBk_Author()} ${row.getBc_ID()} --%>
<!-- 				<img alt="書籍資訊" -->
<%-- 							src="${pageContext.request.contextPath}/image/book.png"width="30px"> 出版社：${row.getBook().getBk_Publish()} ${row.getBook().getBk_ID()} --%>
<!-- 				<img alt="書籍資訊" -->
<%-- 							src="${pageContext.request.contextPath}/image/book.png"width="30px"> 出版日期：${row.getBook().getBk_Date()} <br> --%>
							
				｜ 作者：${row.getBook().getBk_Author()} ${row.getBc_ID()}｜  出版社：${row.getBook().getBk_Publish()} ｜  出版日期：${row.getBook().getBk_Date()}｜ <br>				
				<p class="ellipsis"style="padding-top:15px">${row.getBook().getBk_Content()}</p>


		<div class="" id="bookcollectlist">
		
		
		</div>


<!-- 取消收藏按鈕 -->
				<div class="collect">
					<button type="submit" name="deletebc"
							class="btn btn-outline-danger btn-sm"  onclick="a${row.getBc_ID()}();"value="${row.getBc_ID()}">取消收藏</button>
				</div>
			<br><hr>
			</div>
		</div>
		
		
			<script >

			
// 		$('#gocollect').click(function() {
		function a${row.getBc_ID()}() {
			console.log("test");
			let bc_ID = ${row.getBc_ID()};
			console.log(bc_ID);
			let editURL = "collectlist/deletecollect/"+bc_ID;
			console.log(editURL);
			$.ajax({
				async : true,
				type : 'GET',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						alert('刪除成功 ');
						loadBookCollectList();
					}else {
						alert('刪除失敗 ');
					}
				}
			});
		}
	</script>
</c:forEach>

<script>
// 			$(document).ready(function() {
// 				loadBookCollectList();
// 			});			
			
			function loadBookCollectList() {
				let mb_ID=5;
				$.ajax({
					async : false,
					cache : false,
					type : 'POST',
					url : "collectlist/getBookCollectList/"+mb_ID;
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					error : function() {
						alert('123 ');
					},
					success : function(data) {
						var insertData = "<div class="" id=\"bookcollectlist\">";
						for (let i = 0; i < data.length; i++) {
							insertData += "<h3>"+
								+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
								+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
								+data[i].bk_ID+"\">"+data[i].bk_ID+"</button></form>"
								+"</h3>"
								+"｜ 作者："+data[i].bk_Author
								+" ｜  出版社："+data[i].bk_Publish
								+"｜  出版日期："+data[i].bk_Date
								+"<br>"
								+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
								+data[i].bk_Content
								+"</p>"				
					}
					insertData += "</div>"
					$('#bookcollectlist').html(insertData);
					}
				});
			}
			</script>
	</div>

	<!-- 內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>