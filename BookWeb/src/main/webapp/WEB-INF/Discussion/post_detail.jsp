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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<title>書適圈</title>
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

	<div class="container">
		<div class="row">
			
			<!-- side area -->
			<div class="col-2 text-center">
				<h2>書適論壇</h2><br><br>
				<button id="lazy_command" class="btn btn-warning" style="border-radius:50%;margin-bottom:10px">command</button><br>
				<button id="lazy_nested_command" class="btn btn-warning" style="border-radius:50%;">nested_command</button>
			</div>

			<div class="col-10" style='text-align: center;'>

				<h3>詳細貼文
				</h3>
				<br>
				<div
					style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
					<p>${PostBean.memberbean.mb_Name}<br>${PostBean.post_time}</p>
					<h3><strong>${PostBean.post_title}</strong></h3>
					<p>${PostBean.post_content}</p>


					<div class="input-group mb-3">
						<input type="text" class="form-control" id="command_input" placeholder="請輸入留言" /> 
						<input type="hidden" name="post_id" id="post_id" value="${PostBean.post_id}" />
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" id="command_btn" value="${PostBean.post_id}"
								type="button" >
								留言
							</button>
						</div>
					</div>

					<div id="show_command">
						<c:forEach var="stored_command" items="${CommandBean}">

							<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">

								<button class="btn btn-link btn-sm float-right" type="submit"
									data-toggle="collapse" 
									data-target="#nested_command${stored_command.command_id}">
									回覆
								</button>

								<p>${stored_command.memberbean.mb_Name}<br>
									${stored_command.command_time}
								</p>
								<p>${stored_command.command_content}</p>
							</div>

							<!-- 	巢狀留言彈出輸入框 -->
							<div class="collapse"
								id="nested_command${stored_command.command_id}">

								<div style="height: 40px">
									<div class=" input-group" style="width: 80%; float: right;">

										<input type="text" class="form-control nc_input" id="nested_command_input${stored_command.command_id}"  placeholder="回覆   ${stored_command.command_content}" /> 
										<span class="input-group-append">
											<button class="btn btn-outline-secondary nestcommand " 
												id="nested_command_btn${stored_command.command_id}" value="${stored_command.command_id}" >
												回覆
											</button>
										</span>
									</div>
								</div>
							</div>
							
								<div id="show_nested_command${stored_command.command_id}"></div>
								<c:forEach var="all_nested_command" items="${AllNestedCommand}">
									
									<c:set var="cid" value="${stored_command.command_id}" />
								<c:set var="ncid" value="${all_nested_command.commandBean.command_id}" />
								<c:if test="${cid==ncid}">
									
									<div style="height: 125px; padding-top: 10px; margin-right: 10px">
											<div style="background-color: #B3D9D9; margin: 0px; padding: 5px; border-radius: 10px; width: 78%; float: right;">
													<p>${all_nested_command.memberbean.mb_Name}<br>${all_nested_command.nested_command_time}</p>
													<p>${all_nested_command.nested_command_content}</p>
											</div>
									</div>
									
									</c:if>
									
								</c:forEach>
							

						</c:forEach>
					</div>


					<script>
					
					$(document).on("click", '#lazy_command', function(){
						$('#command_input').val('自動帶入留言');
					})
					
					$(document).on("click", '#lazy_nested_command', function(){
						$('.nc_input').val('自動帶入巢狀留言');
					})
					
						$(document).on("click", '.nestcommand', function(){
							
							if (typeof ($.cookie('Member_ID')) != "undefined") {

								if ($(this).parent().prev().val() == "") {
									swal({title : '請輸入文字'})

								} else {
									$.ajax({
										url : '<c:url value="/Discussion/add_nested_command_ajax"/>',
										type : 'POST',
										data : {nested_command : $(this).parent().prev().val(),
													  command_id : $(this).val()},
										dataType : "json",
										success:function(new_ncb){
											$('#show_nested_command'+new_ncb.cb_id).prepend(
													'<div style="height: 125px; padding-top: 10px; margin-right: 10px">'
													+ '<div style="background-color: #B3D9D9; margin: 0px; padding: 5px; border-radius: 10px; width: 78%; float: right;">'
													+	'<p>' + new_ncb.mb_name+'<br>'+new_ncb.ncb_time+'</p>'
													+	'<p>' + new_ncb.ncb_content+'</p>'
													+'</div></div>'
											)
										}
								})
										$(this).parent().prev().val("");
						}}else{
							swal({title : '請先登入'})
						}						 
							})
					
						$(document).on("click", '#command_btn', function(){
							
							if (typeof ($.cookie('Member_ID')) != "undefined") {

												if ($('#command_input').val() == "") {
													swal({title : '請輸入文字'})

												} else {

													$.ajax({
														url : '<c:url value="/Dsicussion/add_command_ajax"/>',
														type : 'POST',
														data : {new_command : $("#command_input").val(),
																post_id : $("#post_id").val()},
														dataType : "json",
														success : function(new_cb) {
															$("#show_command").prepend(
																					'<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">'
																							+ '<button class="btn btn-link btn-sm float-right" type="submit" data-toggle="collapse"'
																							+ 'data-target="#nested_command'+new_cb.cb_id+'">回覆</button>'
																							+ '<p>'
																							+ new_cb.mb_name
																							+ '<br>'
																							+ new_cb.cb_time
																							+ '</p>'
																							+ '<p>'
																							+ new_cb.cb_content
																							+ '</p>'
																							+ '</div>'
																							+ '<div class="collapse" id="nested_command'+new_cb.cb_id+'">'
																							+ '<div style="height: 40px">'
																							+ '<div class=" input-group" style="width: 80%; float: right;">'
																							+ '<input type="text" class="form-control nc_input" id="command_input'+new_cb.cb_id+'" placeholder="回覆   '+new_cb.cb_content+'" />'
																							+ ' <span class="input-group-append">'
																							+ '<button class="btn btn-outline-secondary nestcommand" id="nested_command_btn'+new_cb.cb_id+'" value="'+new_cb.cb_id+'">'
																							+ '回覆</button>'
																							+ '</span></div></div></div>'
																							+'<div id="show_nested_command'+new_cb.cb_id+'"></div>');
																}
															})
													$('#command_input').val("");
													$('#command_input').attr(
															"placeholder",
															"請輸入留言");
												}
											}else{
												swal({title : '請先登入'})
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


