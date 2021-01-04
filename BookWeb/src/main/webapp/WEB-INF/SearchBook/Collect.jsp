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
	
	$(document).ready(function() {
		loadBookCollectList();
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

			<br><hr>
			<div class="collect">
				<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			</div>
			<br>
			<h3>收藏清單：</h3>
			<br><br>
			
		<div class="bookcollectlist" id="bookcollectlist">

		</div>

	</div>


<script>
			
			function loadBookCollectList() {
				$.ajax({
					async : false,
					cache : false,
					type : 'POST',
					url : "collectlist/getBookCollectList/",
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					error : function() {
						alert('請先登入');
						window.location.href("http://localhost:8080/BookWeb/toLogin");
					},
					success : function(data) {
						var insertData = "<div>";
						for (let i = 0; i < data.length; i++) {
							insertData += "<div class=\"row\">"
								+"<div class=\"col-sm-2\">"
								+"<img class=\"itemcov\" alt=\"\" src=\""
								+data[i].bk_Pic
								+"\" width=\"150\">"
								+"</div>"
								+"<div class=\"col-sm-10\">"
								+"<h3>"
								+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
								+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
								+data[i].bk_ID+"\">"+data[i].bk_Name+"</button></form>"
								+"</h3>"
								+"｜ 作者："+data[i].bk_Author
								+data[i].bc_ID
								+" ｜  出版社："+data[i].bk_Publish
								+"｜  出版日期："+data[i].bk_Date
								+"<br>"
								+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
								+data[i].bk_Content
								+"</p>"	
								+"</div>"
								+"</div>"
								+"<div class=\"collect\">"
								+"<button type=\"submit\" class=\"btn btn-outline-danger btn-sm\" onclick=\"deletebc(" + data[i].bc_ID + ");\"value=\""
								+data[i].bc_ID
								+"\">取消收藏</button>"
								+"</div>"
								+"<br>"
								+"<hr>"
					}
					insertData += "</div>"
					$("#bookcollectlist").html(insertData);	
					}
				});
			}
			
			
			
			function deletebc(i){
				let bc_ID = i;
				console.log(i);
				let editURL = "collectlist/deletecollect/"+i;
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

	<!-- 內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>