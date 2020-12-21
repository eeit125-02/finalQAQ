<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/js/jQuery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jQuery/jquery.cookie.js"></script>
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
	
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media">
		<!-- body -->
		<div class="row">

			<!-- Blog Entries Column -->

			<div class="col-md-8">
				<h1 class="my-4">
					  搜尋結果：<small>分類</small>
				</h1>

				<div id="searchList">
					
				</div>
				

				<!-- Pagination -->
				  <ul class="pagination justify-content-center mb-4">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item "><a class="page-link" href="#">1</a></li>
				    <li class="page-item active"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search for..."> 
							<span class="input-group-append">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">分類</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">文學</a></li>
									<li><a href="#">教育</a></li>
									<li><a href="#">家庭</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">廚房</a></li>
									<li><a href="#">學習</a></li>
									<li><a href="#">政府</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Side Widget</h5>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the new
						Bootstrap 4 card containers!</div>
				</div>

			</div>

		</div>
		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script>
		
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
		function loadBookReportList() {
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : location.href + "/getBookReportList",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
					alert('123 ');
				},
				success : function(data) {

					var insertData = "";
					for (let i = 0; i < data.length; i++) {
						insertData +=	"<div class=\"card mb-4\">"
								    + 	"<div class=\"row g-0\">"
								    + 	"<img src=\""+ data[i].br_Pic+ "\">"
								    + 	"<div class=\"col-md-8\">"
								    + 	"<div class=\"card-body\">"
								    + 	"<h5 class=\"card-title\">"+ data[i].br_name+ "</h5>"
								    + 	"<p class=\"card-text\">"+ data[i].br_Content.replace(/<br>/g,"\n")+ "</p>"
								    + 	"<div class=\"d-flex justify-content-between align-items-center\">"
								    + 	"<a href=\""+br_ID+"\">(閱讀全文)</a>"
								    + 	"<small class=\"text-muted\">創建日期：<br>\""+ data[i].br_DateTime+ "\"</small>"
								    + 	"</div>"
								    + 	"</div>"
								    + 	"</div>"
								    + 	"</div>"
								    + 	"</div>"
					}
					$('#bookReportList').html(insertData);
				}
			});
		};
	</script>

</body>
</html>