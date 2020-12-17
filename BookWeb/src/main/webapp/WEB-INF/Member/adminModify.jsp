<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="memberbean.*"
	import="member.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=UTF-8");
	response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- <link rel="stylesheet" href="import.css"> -->
<style>
fieldset {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: beige;
	width: 800px
}

legend {
	text-align: center;
	font-size: 15px;
}
</style>
</head>

<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<form action="./delete" method="post">
		<fieldset>
			<legend>會員清單</legend>
			<table border="1" width="100%">
				<tr>
					<th>ID</th>
					<th>帳號</th>
					<th>密碼</th>
					<th>性別</th>
					<th>生日</th>
					<th>姓名</th>
					<th>信箱</th>
					<th>手機</th>
					<th>地址</th>
					<th>註冊日期</th>
					<th>等級</th>
					<th>類型</th>
					<th>會員資料刪除</th>
				</tr>
				<c:forEach items="${memberall}" var="u">
					<tr>
						<td>${u.getMb_ID()}</td>
						<td>${u.getMb_Account()}</td>
						<td>${u.getMb_Password()}</td>
						<td>${u.getMb_Sex()}</td>
						<td>${u.getMb_Birthday()}</td>
						<td>${u.getMb_Name()}</td>
						<td>${u.getMb_Mail()}</td>
						<td>${u.getMb_Tel()}</td>
						<td>${u.getMb_Address()}</td>
						<td>${u.getMb_Date()}</td>
						<td>${u.getMb_Lv()}</td>
						<td>${u.getMb_type()}</td>
						<td><button type="submit" name="delete"
								value="${u.getMb_ID()}" onclick="confirmChoice( )">刪除</td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<script>

		</script>
		

	</form>
</body>

</html>