<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 引用sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
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

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
		$("#bookWebFooter").load("<c:url value='/footer'/>");
	});
</script>
<title>書適論壇</title>
</head>
<body>

	<%
		response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	%>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container-fluid" style="margin: 20px 0px">
		<div class="row">
			<!-- side area -->
			<div class="col-2 text-center">
				<h2>書適論壇</h2>
			</div>

			<div class="col-8" style='text-align: center;'>

				<h3>詳細貼文</h3>
				<br>
				<div
					style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
					<p>${PostBean.memberbean.mb_Name}<br>${PostBean.post_time}</p>
					<h3>${PostBean.post_title}</h3>
					<p>${PostBean.post_content}</p>


					<div class="input-group mb-3">
						<input type="text" class="form-control" id="command_input"
							placeholder="請輸入留言" /> <input type="hidden" name="post_id"
							id="post_id" value="${PostBean.post_id}" />
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="command_btn"
								type="button" data-toggle="modal"
								data-target="#exampleModalCenter">留言</button>
						</div>
					</div>

					<!-- 彈出登入提示框 -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">提醒</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">請先登入會員</div>
							</div>
						</div>
					</div>

					<div id="show_command">
						<c:forEach var="stored_command" items="${CommandBean}">

							<div
								style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">

								<button class="btn btn-link btn-sm float-right" type="submit"
									data-toggle="collapse"
									data-target="#nested_command${stored_command.command_id}">回覆</button>

								<p>${stored_command.memberbean.mb_Name}<br>
									${stored_command.command_time}
								</p>
								<p>${stored_command.command_content}</p>
							</div>

							<!-- 	巢狀留言彈出輸入框 -->
							<div class="collapse"
								id="nested_command${stored_command.command_id}">
								
								<div class=" input-group" >

								<input type="text" class="form-control" id="command_input"
									placeholder="回覆   ${stored_command.command_content}" /> 
								<input type="hidden" name="command_id"
									id="post_id" value="${stored_command.command_id}" />
								<span class="input-group-append">
									<button class="btn btn-outline-secondary " id="nested_command_btn"
										type="button" data-toggle="modal"
										data-target="#exampleModalCenter">回覆</button>
								</span>
								
								</div>
								
							</div>

						</c:forEach>
					</div>

					<script>
						$('#command_btn')
								.click(
										function() {
											if ('${loginUser.mb_ID}' !== '') {
												$(
														'#command_btn${stored_post.post_id}')
														.removeAttr(
																'data-toggle data-target')

												if ($(
														'#command_input${stored_post.post_id}')
														.val() == "") {
													swal({
														title : '請輸入文字'
													})

												} else {

													$
															.ajax({
																url : '<c:url value="/Dsicussion/add_command_ajax"/>',
																type : 'POST',
																data : {
																	new_command : $(
																			"#command_input")
																			.val(),
																	post_id : $(
																			"#post_id")
																			.val()
																},
																dataType : "json",
																success : function(
																		new_cb) {

																	$(
																			"#show_command")
																			.prepend(
																					'<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">'
																							+ '<p>'
																							+ new_cb.mb_name
																							+ '<br>'
																							+ new_cb.cb_time
																							+ '</p>'
																							+ '<p>'
																							+ new_cb.cb_content
																							+ '</p>'
																							+ '</div>');
																}
															})
													$('#command_input').val("");
													$('#command_input').attr(
															"placeholder",
															"請輸入留言");
												}
											}
										})
					</script>

				</div>
				<br>



			</div>

		</div>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
</body>
</html>


