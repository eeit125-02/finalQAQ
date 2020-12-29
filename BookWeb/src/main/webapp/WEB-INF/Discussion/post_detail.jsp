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
	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container-fluid" style="margin: 20px 0px">
		<div class="row">
			<!-- side area -->
			<div class="col-2 text-center">
				<h2>書適論壇</h2>
			</div>

			<div class="col-10" style='text-align: center;'>

				<div
					style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
					<p>${PostBean.memberbean.mb_Name}${PostBean.post_time}</p>
					<h3>${PostBean.post_title}</h3>
					<p>${PostBean.post_content}</p>


					<div class="input-group mb-3">
						<input type="text" class="form-control" id="command_input"
							placeholder="請輸入留言" />
						<input type="hidden" name="post_id" id="post_id" value="${PostBean.post_id}" />
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="command_btn"
								type="submit">留言</button>
						</div>
					</div>

					<div id="show_command">
						<c:forEach var="stored_command" items="${CommandBean}">

							<div
								style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
								<p>${stored_command.memberbean.mb_Name}<br>
									${stored_command.command_time}</p>
								<p>${stored_command.command_content}</p>
							</div>

						</c:forEach>
					</div>

								<script>
									$('#command_btn').click(function() {
										$.ajax({
											url : '<c:url value="/Dsicussion/add_command_ajax"/>',
											type : 'POST',
											data : {
												new_command : $("#command_input").val(),
												post_id:$("#post_id").val()
												},
											dataType : "json",
											success : function(new_cb) {
		
												$( "#show_command" ).prepend( 
														'<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">'+
														'<p>'+ new_cb.mb_name +'<br>'+ new_cb.cb_time+'</p>'+
														'<p>'+ new_cb.cb_content+'</p>'+
														'</div>' );
											}
										})
											$('#command_input').val("");
											$('#command_input').attr("placeholder","請輸入留言");
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


