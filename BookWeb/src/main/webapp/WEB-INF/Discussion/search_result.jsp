<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<title>書適論壇</title>
</head>

<body>
	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container-fluid" style="margin: 20px 0px">
		<div class="row">
			<!-- sidebar area -->
			<div class="col-2 text-center">
				<h2>書適論壇</h2>
			</div>

			<!-- content area -->
			<div class="col-10" style='text-align: center;'>
				<nav class="navbar navbar-light bg-light justify-content-between">
					<a class="navbar-brand">搜尋貼文關鍵字</a>
					<form class="form-inline" action='search_keyword' method="post">
						<input class="form-control mr-sm-2" type="search"
							placeholder="請輸入關鍵字­" name="keyword">
						<button class="btn btn-outline-primary my-2 my-sm-0" type="submit"
							id="search_keyword">Search</button>
					</form>
				</nav>
				<br>
				
				<h3>搜尋 ${param.keyword} 的結果</h3><br>

				<!-- post and command -->
				<c:forEach var="stored_post" items="${allPost}">
				
					<c:set var="pk" value="${param.keyword}" />
					<c:set var="pt" value="${stored_post.post_title}" />
					<c:set var="pc" value="${stored_post.post_content}" />
					<c:if test="${fn:contains(pt, pk)||fn:contains(pc, pk)}">
					
					<div
						style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
						<p>[member] ${stored_post.post_time}</p>
						<h3>${stored_post.post_title}</h3>
						<p>${stored_post.post_content}</p>

						<form:form method='post' action='add_command'
							modelAttribute="commandBean">
							<div class="input-group mb-3">
								<form:input type="text" class="form-control" id="command_input"
									path="command_content" placeholder="請輸入留言" />
								<form:hidden path="command_time" />
								<form:hidden path="mb_id" />
								<form:hidden path="postBean.post_id"
									value="${stored_post.post_id}" />
								<form:hidden path="postBean.post_title"
									value="${stored_post.post_title}" />
								<form:hidden path="postBean.post_content"
									value="${stored_post.post_content}" />
								<form:hidden path="postBean.mb_id" value="${stored_post.mb_id}" />
								<form:hidden path="postBean.post_time"
									value="${stored_post.post_time}" />
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" id="command_btn"
										type="submit">留言</button>
								</div>
							</div>
						</form:form>

						<c:forEach var="stored_command" items="${allCommand}">
							<c:set var="pi" value="${stored_post.post_id}" />
							<c:set var="ci" value="${stored_command.postBean.post_id}" />
							<c:if test="${pi==ci}">
								<div
									style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
									<p>[member] ${stored_command.command_time}</p>
									<p>${stored_command.command_content}</p>
								</div>
							</c:if>
						</c:forEach>

					</div>
					<br>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>
	
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>