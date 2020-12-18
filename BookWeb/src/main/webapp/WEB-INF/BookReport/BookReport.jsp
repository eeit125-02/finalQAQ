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
		$("#bookWebheader").load("<c:url value='/header'/>");
		$("#bookWebFooter").load("<c:url value='/footer'/>");
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
		<div class="row">

			<!-- Blog Entries Column -->

			<div class="col-md-8">
				<h1 class="my-4">
					Page Heading <small>Secondary Text</small>
				</h1>

				<div class="card mb-3">
					<div class="row g-0">
					
						<img src="http://placehold.it/200x200" alt="...">
						
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Blog Post -->
				<div class="card mb-4">
					<img class="card-img-left" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a href="#" class="btn btn-primary">Read More →</a>
					</div>
					<div class="card-footer text-muted">
						Posted on January 1, 2020 by <a href="#">Start Bootstrap</a>
					</div>
				</div>


				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="#">←
							Older</a></li>
					<li class="page-item disabled"><a class="page-link" href="#">Newer→</a></li>
				</ul>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-append">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
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
		function loadBookReportList() {

			$
					.ajax({
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

							var insertData = "<div class=\"col-md-8\">";
							for (let i = 0; i < data.length; i++) {
								insertData += "<div class=\"card mb-4\">"
										+ "<img class=\"card-img-top\" src=\""+ data[i].bk_Pic +"alt=\"Card image cap\">"
										+ "<div class=\"card-body\">"
										+ "<h2 class=\"card-title\">"
										+ data[i].br_Name
										+ "</h2>"
										+ "<p class=\"card-text\">"
										+ data[i].br_Content
										+ "</p>"
										+ "<a href=\" URL "+ data[i].br_ +"\" class=\"btn btn-primary\">Read More →</a>"
										+ "</div>"
										+ "<div class=\"card-footer text-muted\">"
										+ "Posted on January 1, 2020 by<a href=\" URL "+ data[i].mb_ID +"\">"
										+ data[i].mb_Name + "</a>" + "</div>"
										+ "</div>"
							}

							insertData += "<ul class=\"pagination justify-content-center mb-4\">"
									+ "<ul class=\"pagination justify-content-center mb-4\">"
									+ "<li class=\"page-item\"><a class=\"page-link\" href=\""+ URL +"\">←Older</a></li>"
									+ "<li class=\"page-item disabled\"><a class=\"page-link\" href=\""+ URL +"\">Newer→</a></li>"
									+ "</ul>" + "</div>"
							$('#bookReportList').html(insertData);
						}
					});
		};
	</script>

</body>
</html>