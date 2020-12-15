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

	<!-- body -->
	<div class="container media">
		<label id="test"></label>

		<!-- 內容開始 -->


		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<br>
		<hr>
		<br>

		<div class="row">
			<div class="col-sm-1"></div>


			<div class="col-sm-11">

				<Form action="<c:url value='confirmupdate' />" method="POST">
					<div class="back">
						<h2 class="title">更新書目資訊：</h2>
						<hr>
						<br> <input type="hidden" name="id"
							value="${bookresult.bk_ID}"> <span>書名：</sapn><input
							type="text" name="bookname" value="${bookresult.bk_Name}"><br>
						<br> <span>作者：</sapn><input type="text" name="bookauthor"
								value="${bookresult.bk_Author}"><br> <br> <span>出版社：</sapn><input
									type="text" name="bookpublish" value="${bookresult.bk_Publish}"><br>
									<br> <span>出版日期：</sapn><input type="text" name="bookdate"
										value="${bookresult.bk_Date}"><br> <br>
										<figure>
											<span>內容簡介：</span>
											<div class="context">
												<textarea cols="100" rows="8" name="bookcontent">
														${bookresult.bk_Content}
												</textarea>
											</div>
										</figure>
					</div>
				</Form>
			</div>
			<div class="check">

				<button type="submit" name="confirm"
					class="btn btn-outline-danger btn-sm" value="">確認修改</button>

			</div>

		</div>




		<!-- 內容結束 -->

	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>