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
<title>新增活動資料</title>
</head>

<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
		<br>


		<p>&nbsp;</p>
		<hr>
		<div class="center">
			<H1>新增報名資料</H1>
			<form:form method="POST" modelAttribute="ajb" enctype="multipart/form-data">

				<table>

					<tr>
						<td><label>會員帳號:${loginUser.getMb_Account()}</label></td>
<%-- 						<td><input type="hidden" name="mb_Account" value="${member.mb_Account}" /></td> --%>
					<form:input type="hidden" path="member.mb_Account" value="${loginUser.getMb_Account()}"/>
					</tr>

                    <tr>
						<td><label>活動名稱:${act_Name}</label></td>
<%-- 						<td><input type="hidden" name="act_Name" value="${act.act_Name}" /></td> --%>
					</tr>

                    <tr>
						<td><label>會員姓名:${loginUser.getMb_Name()}</label></td>
<%-- 						<td><input type="hidden" name="mb_Name" value="${member.mb_Name}" /></td> --%>
					</tr>

					<tr>
						<td><form:label path="member.mb_Mail">email:</form:label></td>
						<td><form:input path="member.mb_Mail" value="${loginUser.getMb_Mail()}"/></td>
					</tr>

					<tr>
						<td><form:label path="member.mb_Tel">聯絡電話:</form:label></td>
						<td><form:input path="member.mb_Tel" value="${loginUser.getMb_Tel()}"/></td>
					</tr>


					<tr>
						<td><form:label path="join_Pax">報名人數:</form:label></td>
						<td><form:input path="join_Pax" /></td>
					</tr>

				</table>


				<input type='submit' value='提交' />
				<input type='reset' value='還原' />
				<br>
				<br>
			</form:form>
				<a href='${pageContext.request.contextPath}/showActs'>繼續探索活動</a>


		</div>
		<!-- body -->

		<!-- footer -->
		<footer class="container py-5" id="bookWebFooter"></footer>
		<!-- footer -->
</body>
</html>