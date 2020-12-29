<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
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
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container">
		<div class="media">
			<img id="BkPic" src="<%=request.getAttribute("bkPic")%>"
				class="w-25 p-3" alt="...">
			<div class="media-body">
				<h5 class="mt-0">
					書名：
				</h5>
				<p class="mt-0">
					作者：</p>
				<p class="mt-0">
					出版社：</p>
				<p class="mt-0">
					評分：分
				</p>
			</div>
		</div>
		<label for="message-text" class="col-form-label">心得:</label>
		<textarea class="form-control" style="height: 350px;" readonly></textarea>
		<br>
	</div>
	
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
       	$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
   	</script>
</body>
</html>