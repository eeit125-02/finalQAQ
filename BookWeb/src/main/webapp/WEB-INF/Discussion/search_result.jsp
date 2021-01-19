<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 引用sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container">
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
							placeholder="請輸入關鍵字" name="keyword">
						<button class="btn btn-outline-primary my-2 my-sm-0" type="submit"
							id="search_keyword">Search</button>
					</form>
				</nav>
				<br>

				<h3>搜尋 ${param.keyword} 的結果</h3>
				<br>

				
				<!-- post and command -->
				<c:forEach var="stored_post" items="${allPost}">

					<c:set var="pk" value="${param.keyword}" />
					<c:set var="pt" value="${stored_post.post_title}" />
					<c:set var="pc" value="${stored_post.post_content}" />
					<c:if test="${fn:contains(pt, pk)||fn:contains(pc, pk)}">
						
						<div
							style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
							<p>${stored_post.memberbean.mb_Name}<br>${stored_post.post_time}</p>
							<h3><strong>${stored_post.post_title}</strong></h3>


							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#show_complete_post${stored_post.post_id}">
								顯示、收攏貼文</button>
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#show_complete_command${stored_post.post_id}">
								顯示、收攏留言</button>

							<!-- show complete post -->
							<div class="collapse"
								id="show_complete_post${stored_post.post_id}">
								<div class="card card-body" style="border-style: none">
									${stored_post.post_content}</div>
							</div>
							<!-- show complete command -->
							<div class="collapse"
								id="show_complete_command${stored_post.post_id}">
								<div class="card card-body" style="border-style: none">


								<div class="input-group mb-3">
									<input type="text" class="form-control"
										id="command_input${stored_post.post_id}" placeholder="請輸入留言" />
									<div class="input-group-append">
										<button class="btn btn-outline-secondary normal_command${stored_post.post_id}"
											id="command_btn${stored_post.post_id}" value="${stored_post.post_id}">留言</button>
									</div>
								</div>

								<div id="show_command${stored_post.post_id}">
									<c:forEach var="stored_command" items="${allCommand}">
										<c:set var="pi" value="${stored_post.post_id}" />
										<c:set var="ci" value="${stored_command.postBean.post_id}" />
										<c:if test="${pi==ci}">
											<div
												style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
												
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

										<input type="text" class="form-control" id="nested_command_input${stored_command.command_id}"  placeholder="回覆   ${stored_command.command_content}" /> 
										<span class="input-group-append">
											<button class="btn btn-outline-secondary nestcommand${stored_post.post_id} " 
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
											
										</c:if>
									</c:forEach>
								</div>

								
								<script>
								$(document).on("click", '.nestcommand${stored_post.post_id}', function(){
									
									if (typeof ($.cookie('Member_ID')) != "undefined") {

										if ($(this).parent().prev().val() =="") {
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
								
									
									
									$(document).on("click", '.normal_command${stored_post.post_id}', function(){
										
										console.log($(this).parent().prev().val())
									
										if (typeof ($.cookie('Member_ID')) != "undefined") {
																			
															if($(this).parent().prev().val()==""){
																swal({title:'請輸入文字'})

																}else{
																			
																	$.ajax({
																		url : '<c:url value="/Dsicussion/add_command_ajax"/>',
																		type : 'POST',
																		data : {new_command : $(this).parent().prev().val(),
																						post_id : $(this).val()},
																		dataType : "json",
																		success : function(new_cb) {
																			$("#show_command"+new_cb.post_id).prepend(
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
																									+ '<input type="text" class="form-control" id="command_input'+new_cb.cb_id+'" placeholder="回覆   '+new_cb.cb_content+'" />'
																									+ ' <span class="input-group-append">'
																									+ '<button class="btn btn-outline-secondary nestcommand'+new_cb.post_id+'" id="nested_command_btn'+new_cb.cb_id+'" value="'+new_cb.cb_id+'">'
																									+ '回覆</button>'
																									+ '</span></div></div></div>'
																									+'<div id="show_nested_command'+new_cb.cb_id+'"></div>'
																			);
																						$('#command_input'+new_cb.post_id).val("");
																		}
																						
																	})
																
														}}else{
															swal({title : '請先登入'})
														}					
													})
								</script>

								</div>
							</div>
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