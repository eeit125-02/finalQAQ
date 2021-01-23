<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="icon"
	href="${pageContext.request.contextPath}/image/logo1.ico"
	type="image/x-icon" />
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
	<header class="blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container">
		<!-- 		<h1>我又是測試頁 &gt;.&lt;&quot;</h1> -->
		<!-- body -->
		<c:url var="tempUrl" value="addMyBookB" />
		<form:form method="POST" modelAttribute="newBook" id="form"
			action="${tempUrl}" enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-12">
					<form:label path="bk_Name" for="exampleFormControlInput1">書名</form:label>
					<form:input path="bk_Name" type="text" class="form-control"
						id="ControlInput1" placeholder="必填" required="required" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<form:label path="bk_Author" for="exampleFormControlInput1">作者</form:label>
					<form:input path="bk_Author" type="text" class="form-control"
						id="ControlInput2" placeholder="必填" required="required" />
				</div>
				<div class="form-group col-sm-6">
					<form:label path="bk_Publish" for="exampleFormControlInput1">出版社</form:label>
					<form:input path="bk_Publish" type="text" class="form-control"
						id="ControlInput3" placeholder="必填" required="required" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<form:label path="bk_Pic" for="exampleFormControlFile1">封面照片</form:label>
					<input type="file" class="form-control" id="ControlFile4"
						name="file" />
				</div>
				<div class="form-group col-sm-6">
					<form:label path="bk_Date" for="exampleFormControlFile1">出版日期</form:label>
					<form:input path="bk_Date" type="date" class="form-control-file"
						id="ControlFile5" />
				</div>
			</div>
			<!-- 			測試分隔線!!!!!!!!!!!!!!! -->
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="exampleFormControlInput1">價錢</label> <input
						type="number" name="price" class="form-control" id="ControlInput6"
						placeholder="必填" required="required">
				</div>
				<div class="form-group col-sm-6">
					<label for="exampleFormControlInput1">數量</label> <input
						type="number" name="qty" class="form-control" id="ControlInput7"
						placeholder="必填" required="required">
				</div>
			</div>
			<!-- 				測試結束線!!!!!!!!!!!!!!!! -->
			<div class="row">
				<div class="form-group col-sm-12">
					<form:label path="bk_Content" for="exampleFormControlTextarea1">內容簡介 </form:label>
					<form:textarea path="bk_Content" class="form-control"
						id="ControlInput8" rows="3"></form:textarea>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-7"></div>
				<div class="form-group col-sm-2">
					<button id="send" type="submit" class="btn btn-outline-success">確認新增</button>
				</div>
				<div class="form-group col-sm-2">
					<button id="finish" type="button" class="btn btn-outline-dark">一鍵完成</button>
				</div>
			</div>
		</form:form>
	</div>

	<!-- body -->


	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script type="text/javascript">
		$('.btn.btn-outline-dark').click(function() {
			$('#ControlInput1').val("Spring MVC 動態網站開發實務");
			$('#ControlInput2').val("王憲春");
			$('#ControlInput3').val("資策會");
			var dateControl = document.querySelector('input[type="date"]');
			dateControl.value = '2020-09-22';
			$('#ControlInput6').val(100000);
			$('#ControlInput7').val(33);
			$('#ControlInput8').val("非常重要的東東");

		})
	</script>
</body>
</html>