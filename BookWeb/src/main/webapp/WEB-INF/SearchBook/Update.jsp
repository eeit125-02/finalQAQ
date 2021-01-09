<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
.check{
	text-align: center;
}
.back{
    margin: auto;
    width: 815px;
}
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
<!-- 		<label id="test"></label> -->

		<!-- 內容開始 -->
		<form:form method="POST" modelAttribute="pageresult" enctype="multipart/form-data">

			<div class="back">
				<h2 class="check">更新書目資訊</h2>
				<hr>

				<form:hidden path="bk_ID" />
				<form:hidden path="bk_BookType" />
				<form:hidden path="bk_Price" />

					<div class="form-group">
						<form:label path="bk_Name">書名</form:label>
						<form:input path="bk_Name" class="form-control" placeholder="必填"  required="required"/>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Author">作者</form:label>
							<form:input path="bk_Author" class="form-control"
								placeholder="必填"  required="required"/>
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Translator">譯者</form:label>
							<form:input path="bk_Translator" class="form-control" />
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Publish">出版社</form:label>
							<form:input path="bk_Publish" class="form-control" required="required"
								placeholder="必填" />
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Date">出版日期</form:label>
							<form:input path="bk_Date" class="form-control" type="date" required="required"/>
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Publisher_Place">出版地</form:label>
							<form:input path="bk_Publisher_Place" class="form-control" />
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Pic">封面圖片</form:label>
							<input class="form-control" name="file" type="file" required="required"/>
<%-- 							<form:input path="" class="form-control" type="file" /> --%>
<%-- 							<form:hidden path="bk_Pic" /> --%>
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-5">
							<form:label path="bk_ISBN">ISBN</form:label>
							<form:input path="bk_ISBN" class="form-control" placeholder="必填，請輸入數字組合"  required="required"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						</div>

						<div class="form-group col-md-5">
							<form:label path="bk_Language">語言</form:label>
							<form:input path="bk_Language" class="form-control"/>
							<%-- 	    <form:checkboxes path="bk_Language" /> --%>
							<!--       <label for="inputState">語言</label> -->
							<!--       <select id="inputState" class="form-control"> -->
							<!--         <option selected>繁體中文</option> -->
							<!--         <option>簡體中文</option> -->
							<!--         <option>英文</option> -->
							<!--         <option>日文</option> -->
							<!--         <option>德文</option> -->
							<!--         <option>法文</option> -->
							<!--       </select> -->
						</div>

						<div class="form-group col-md-2">
							<form:label path="bk_Page">頁數</form:label>
							<form:input path="bk_Page" class="form-control"  placeholder="請輸入正整數"  
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						</div>

					</div>
					<form:label path="bk_Content">內容簡介</form:label>
					<form:textarea path="bk_Content" class="form-control" rows="6" />
			</div>
		
			<br>
		<div class="check">
			<button type="submit" class="btn btn-outline-danger btn-sm">確認修改</button>
		</div>
		</form:form>
	</div>

	<!-- 內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>