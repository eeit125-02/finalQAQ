<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 引用sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 引用CK Editor -->
<script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>

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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<title>書適圈</title>
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
			<!-- side area -->
			<div class="col-2 text-center">
				<h2>書適論壇</h2>
				
			</div>

			<div class="col-10" style='text-align: center;'>
				<h3>&nbsp; &nbsp; &thinsp; 修改貼文<button id="lazy_input" class="float-right btn btn-warning" style="border-radius:50%; margin-right:40px">press</button></h3><br>
				<div
					style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px; padding-top: 20px">

					<form action="edit_post" method="post" id="form1">

						<input type="hidden" name="edit_post_id" value="${param.edit_post_id}" />
						<input type="hidden" name="edit_post_time" value="${param.edit_post_time}" />

						<div class="form-group row">
							<label for="new_title" class="col-2 text-center h5">貼文標題</label>
							<div class="col-9">
								<input type="text" class="form-control" name="edit_post_title" id="edit_post_title"
									value="${param.edit_post_title}" />
							</div>
						</div>

						<div class="form-group row">
							<label for="new_content" class="col-2 text-center h5">貼文內容</label>
							<div class="col-9">
								<textarea class="form-control" name="edit_post_content" id="edit_post_content" rows="6">${param.edit_post_content}</textarea>
							</div>
						</div>
						
						
						<div class="text-center">
							<button type="submit" id="send_edited_post" class="btn btn-primary">送出貼文</button>
						</div>
					</form>
							
					
						<script>
							CKEDITOR.replace('edit_post_content');
							$('#lazy_input').click(function(){
								$('#edit_post_title').val('[已修改]自動帶入貼文標題');
								CKEDITOR.instances["edit_post_content"].setData('[已修改]自動帶入貼文內容');
							})
						</script>
						
					<script>
						$('#send_edited_post').click(function(){
							if($('#edit_post_title').val()==''||$('#edit_post_content').val()==''){
								swal({title:'請輸入文字'});
								event.preventDefault()
							}else{
								$('#form1').submit();
							}
						})
					</script>

				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
</body>
</html>
