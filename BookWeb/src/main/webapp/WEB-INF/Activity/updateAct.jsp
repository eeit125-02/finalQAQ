<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
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
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
<meta charset="UTF-8">
<title>MVC</title>
<script type="text/javascript">
	function confirmDelete(act_Name) {
		var result = confirm("確定刪除此筆記錄(活動名稱:" + act_Name + ")?");
		if (result) {
			document.forms[0].finalDecision.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate(act_Name) {
		var result = confirm("確定送出此筆記錄(活動名稱:" + act_Name + ")?");
		if (result) {
			document.forms[0].finalDecision.value = "UPDATE";
			return true;
		}
		return false;
	}
</script>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
	<p>&nbsp;</p>
	<hr>
	<div class='center'>
		<H1 class='center'>更新活動資料</H1>
		<hr>
		<p>
			<form:form method="POST" modelAttribute="ab" enctype="multipart/form-data">
			<input type="hidden" id="picpath" name="picpath">
<div>
<!-- 				<label>會員帳號:</label> -->
<%-- 				<span>${mb_account}</span> --%>
				<input type="hidden" name="finalDecision" value="">
</div>				
					
				<Table>
				<tr>
					<td><label >活動圖片:</label></td>
					<td><img src="${ab.act_Image}" id="show" width="150" height="200"></td>	
								
				</tr>
				<tr>
					<td><label></label></td>
					<td><input id="myfile" type="file" name="file"></td>
				</tr>
				<tr>
					<td><form:label path="act_Name">活動名稱:</form:label></td>
					<td><form:input path="act_Name" /></td>
				</tr>

					<tr>
					<td><form:label path="act_Theme">活動主題:</form:label></td>
					<td><form:input path="act_Theme" /></td>
				</tr>
				
					
				<tr>
					<td><form:label path="act_Date">活動時間:</form:label></td>
					<td><form:input type="datetime-local" path="act_Date" /></td>
				</tr>
				
				<tr>
					<td><form:label path="act_Loc">活動地點:</form:label></td>
					<td><form:input path="act_Loc" /></td>
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
					<td><form:input type="textarea" path="act_Tag" /></td>
				</tr>

				<tr>
					<td><form:label path="act_Place">活動場所:</form:label></td>
					<td><form:input path="act_Place" /></td>
				</tr>

					<TR>
						<TD colspan="2" align="center">
						
						<input type="submit" value="更新" name='updateBtn'onclick="return confirmUpdate('${ab.act_ID}');"/> 
						<input type="submit" value="刪除" name='deleteBtn'onclick="return confirmDelete('${ab.act_Name}');"/>
						</TD>
					</TR>
				</Table>
				<c:if test="${not empty requestScope.modify}">
					<c:remove var="act" scope="request" />
				</c:if>
			</form:form>

			<p /><small>&lt;&lt;<a href="showActs">回上一頁</a>&gt;&gt;
			</small>

	</div>

	</div>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
</body>
<script type="text/javascript">
				$(function() {
				$("#myfile").change(function() {
					var readFile = new FileReader();
					var mfile = $("#myfile")[0].files[0];  //注意這裡必須時$("#myfile")[0]，document.getElementById('file')等價與$("#myfile")[0]
					readFile.readAsDataURL(mfile);
					$("#picpath").val("abc");
					readFile.onload = function() {
						var img = $("#show");
						img.attr("src", this.result);
					}

				});

			})
		</script>

</html>
