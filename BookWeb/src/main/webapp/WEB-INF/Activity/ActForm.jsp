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
	<div class="container media">
		<br>


	<p>&nbsp;</p>
	<hr>
	<div class="center">
		<H1>新增活動資料</H1>
		<form:form method="POST" modelAttribute="actbean" enctype="multipart/form-data">

			<table>
				<tr>
					<td><form:label path="mb_ID">會員帳號:</form:label></td>
					<td><form:input path="mb_ID" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Image">活動圖片:</form:label></td>
					<td><input name="file" type="file" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Name">活動名稱:</form:label></td>
					<td><form:input path="act_Name" /></td>
				</tr>

				<tr>
					<td><label>活動主題:</label></td>
					<td></td>
					<td><form:input path="act_Theme" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Date">活動時間:</form:label></td>
					<td><form:input type="datetime-local" path="act_Date" /></td>
				</tr>

				<tr>
					<td><label>活動地點:</label></td>
					<td><select name="act_Loc">
					<option value="City">縣市</option>
                                <option value="TPH">新北市</option>
                                <option value="TPE">台北市</option>
                                <option value="TYC">桃園市</option>
                                <option value="HSH">新竹縣</option>
                                <option value="HSC">新竹市</option>
                                <option value="MAC">苗栗市</option>
                                <option value="MAL">苗栗縣</option>
                                <option value="TXG">台中市</option>
                                <option value="CWH">彰化縣</option>
                                <option value="CWS">彰化市</option>
                                <option value="NTC">南投市</option>
                                <option value="NTO">南投縣</option>
                                <option value="YLH">雲林縣</option>
                                <option value="CHY">嘉義縣</option>
                                <option value="CYI">嘉義市</option>
                                <option value="TNN">台南市</option>
                                <option value="KHH">高雄市</option>
                                <option value="IUH">屏東縣</option>
                                <option value="PTS">屏東市</option>
                                <option value="ILN">宜蘭縣</option>
                                <option value="ILC">宜蘭市</option>
                                <option value="HWA">花蓮縣</option>
                                <option value="HWC">花蓮市</option>
                                <option value="TTC">台東市</option>
                                <option value="TTT">台東縣</option>
                                <option value="PEH">澎湖縣</option>
                                <option value="GNI">綠島</option>
                                <option value="KYD">蘭嶼</option>
                                <option value="KMN">金門縣</option>
                                <option value="MZW">馬祖</option>
                                <option value="LNN">連江縣</option>
					</select>
					</td>
				</tr>

				<tr>
					<td><form:label path="act_Intro">活動簡介:</form:label></td>
					<td><form:input path="act_Intro" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Guest">活動嘉賓:</form:label></td>
					<td><form:input path="act_Guest" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Pax">活動人數:</form:label></td>
					<td><form:input path="act_Pax" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Rule">活動規則:</form:label></td>
					<td><form:input path="act_Rule" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Tag">活動標籤:</form:label></td>
					<td><form:input path="act_Tag" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Place">活動場所:</form:label></td>
					<td><form:input path="act_Place" /></td>
				</tr>

			</table>
			

			<input type='submit'  value='提交' />
			<input type='reset'  value='還原' />
			<br>
			<br>
			<a href='${pageContext.request.contextPath}/showActs'>回到活動管理</a>
		</form:form>

	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
</body>
</html>