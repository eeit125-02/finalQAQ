<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' />
<meta charset="UTF-8">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />	

<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>  

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
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>
<title>書適圈</title>
</head>

<body>

	<!-- header -->
	<header class=" blog-header " id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
		<br>


		<p>&nbsp;</p>
		<hr>
		<div style="text-align:center">
			<H1>新增報名資料</H1>
			<form:form method="POST" modelAttribute="ajb" enctype="multipart/form-data" id="showAlert">
			<hr>
			<br>
			  <fieldset>
			  <form>
				
					<div class="form-group">
					<label>會員帳號:${loginUser.mb_Account}</label>
					<form:input type="hidden" path="member.mb_Account" value="${loginUser.mb_Account}"/>
					</div>
				
					<div class="form-group">     
					<label>活動名稱:${act_Name}</label>				
					</div>
				

                	<div class="form-group">
					<label>會員姓名:${loginUser.getMb_Name()}</label>
					</div>

					<div class="form-group">
					
					<label >email:</label>
					<form:input path="member.mb_Mail" value="${loginUser.getMb_Mail()}"/>
					</div>

					<div class="form-group">
					<form:label path="member.mb_Tel">聯絡電話:</form:label>
					<form:input path="member.mb_Tel" value="${loginUser.getMb_Tel()}"/>
					</div>



				<hr>
				<input type='reset' class="btn btn-primary" value='還原' />
				<button id="cools" class="btn btn-primary" type='button' onclick='cool()' >提交</button>
	
				</form>
				</fieldset>
				</form:form>
				</div>
				
				<br>
				<br>
				<a href='${pageContext.request.contextPath}/showActs'>繼續探索活動</a>
				</div>



		<!-- body -->

		<!-- footer -->
		<footer class="container py-5" id="bookWebFooter"></footer>
		<!-- footer -->
</body>



<script>

	function cool(){
		console.log("12222")
				
		Swal.fire({
			  title: '您已報名成功囉!已寄出活動資訊到您的信箱',
			  width: 600,
			  padding: '3em',
			  background: '#fff url(/images/trees.png)',
			  backdrop: `
			    rgba(0,0,123,0.4)
			    left top
			    no-repeat
			  `
			})
				
		  $('#showAlert').submit();
			
	}


</script>

</html>