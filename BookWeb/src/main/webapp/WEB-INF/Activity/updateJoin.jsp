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
	function confirmDelete(mb_Account) {
		var result = confirm("確定刪除此筆報名記錄(帳號:" + mb_Account + ")?");
		if (result) {
			document.forms[0].finalDecision.value = "DELETE";
			return true;
		}
		return false;
	}
	function confirmUpdate(mb_Account) {
		var result = confirm("確定送出此筆報名記錄(帳號:" + mb_Account + ")?");
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
		<H1 class='center'>更新報名資料</H1>
		<hr>
		<p>
			<form:form method="POST" modelAttribute="ajb">

				<input type="hidden" name="join_ID" value="${join_ID}"/>
<%-- 				<form:input type="hidden" path="member.mb_Account" value="${loginUser.getMb_Account()}"/> --%>
				<input type="hidden" name="finalDecision" value="">
				<Table>
					
					<tr>
						<td><label>活動名稱:${ajb.act.act_Name}</label></td>
<%-- 					<td><form:input path="act_Name" value="${loginUser.getMb_Mail()}"/></td> --%>
					</tr>

					<tr>
						<td><label>會員姓名:${loginUser.getMb_Name()}</label></td>
					</tr>
					<tr>
						<td><form:label path="member.mb_Mail">email:</form:label></td>
						<td><form:input path="member.mb_Mail" value="${loginUser.getMb_Mail()}"/></td>
					</tr>

					<tr>
						<td><form:label path="member.mb_Tel">聯絡電話:</form:label></td>
						<td><form:input path="member.mb_Tel" value="${loginUser.getMb_Tel()}"/></td>
					</tr>
					
<!-- 					<tr> -->
<%-- 						<td><form:label path="join_Pax">報名人數:</form:label></td> --%>
<%-- 						<td><form:input path="join_Pax" /></td> --%>
<!-- 					</tr> -->

					<TR>
						<TD colspan="2" align="center">
						<input type="hidden" name="act_ID" value="${ajb.act.act_ID}">
						<input type="submit" value="更新" name='updateBtn'onclick="return confirmUpdate('${join_ID}');"/> 
						<input type="submit" value="刪除" name='deleteBtn'onclick="return confirmDelete('${join_ID}');"/>
						</TD>
					</TR>
				</Table>
				<c:if test="${not empty requestScope.modify}">
					<c:remove var="act" scope="request" />
				</c:if>
			</form:form>

			<p /><small>&lt;&lt;<a href='${pageContext.request.contextPath}/ActHomepage'>回到探索活動</a>&gt;&gt;
			</small>

	</div>


	
</body>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</html>
