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
<title>新增活動資料</title>
</head>

<body>
	<p>&nbsp;</p>
	<hr>
	<div class="center">
		<H1>新增活動資料</H1>
		<form:form action="saveActs" method="post" modelAttribute="actbean">
		<form:form path="act_ID"/>
		<table>
<tr>		
<td><form:label path="mb_ID">會員帳號:</form:label></td>
<td><form:input path="mb_ID"/></td>
</tr>

<tr>		
<td><form:label path="act_Image">活動圖片:</form:label></td>
<td><form:input path="act_Image"/></td>
</tr>

<tr>		
<td><form:label path="act_Name">活動名稱:</form:label></td>
<td><form:input path="act_Name"/></td>
</tr>

<tr>		
<td><form:label path="act_Theme">活動主題:</form:label></td>
<td><form:input path="act_Theme"/></td>
</tr>

<tr>		
<td><form:label path="act_Date">活動時間:</form:label></td>
<td><form:input type="datetime-local"  path="act_Date"/></td>
</tr>

<tr>		
<td><form:label path="act_Loc">活動地點:</form:label></td>
<td><form:input path="act_Loc"/></td>
</tr>

<tr>		
<td><form:label path="act_Intro">活動簡介:</form:label></td>
<td><form:input path="act_Intro"/></td>
</tr>

<tr>		
<td><form:label path="act_Guest">活動嘉賓:</form:label></td>
<td><form:input path="act_Guest"/></td>
</tr>

<tr>		
<td><form:label path="act_Pax">活動人數:</form:label></td>
<td><form:input path="act_Pax"/></td>
</tr>

<tr>		
<td><form:label path="act_Rule">活動規則:</form:label></td>
<td><form:input path="act_Rule"/></td>
</tr>

<tr>		
<td><form:label path="act_Tag">活動標籤:</form:label></td>
<td><form:input path="act_Tag"/></td>
</tr>

<tr>		
<td><form:label path="act_Tag">活動標籤:</form:label></td>
<td><form:input path="act_Tag"/></td>
</tr>

<tr>		
<td><form:label path="act_Place">活動場所:</form:label></td>
<td><form:input path="act_Place"/></td>
</tr>

	</table>		
			<input type='submit' name='name' value='提交'>
			<input type='reset' name='name' value='還原'>
			<br>
			<br>
			<a href='${pageContext.request.contextPath}/ActHomepage.jsp'>回到活動管理</a>
		</form:form>

	</div>
</body>
</html>