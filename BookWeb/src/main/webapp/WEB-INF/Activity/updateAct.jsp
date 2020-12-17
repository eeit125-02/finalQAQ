<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML>
<html>
<head>
<style>
</style>
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
	<p>&nbsp;</p>
	<hr>
	<div class='center'>
		<H1 class='center'>更新活動資料</H1>
		<hr>
		<p>
			<form:form method="POST" modelAttribute="ab">

				<form:hidden path="act_ID" value="活動編號"/>
				<form:hidden path="mb_ID" />
				<form:input path="mb_ID" />
				<input type="hidden" name="finalDecision" value="">
				<Table>
				
				<tr>
					<td><form:label path="act_Image">活動圖片:</form:label></td>
					<td><form:input path="act_Image" /></td>
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
					<td><form:input path="act_Tag" /></td>
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
</body>

</html>
