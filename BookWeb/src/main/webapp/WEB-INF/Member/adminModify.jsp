<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="memberbean.*"
	import="member.*"%>
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


	<%
		List user = (List)request.getAttribute("user");
	request.setAttribute("list", user);
	%>
	<form action="./Login" method="post">
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
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getmB_ID()}</td>
						<td>${u.getmB_Account()}</td>
						<td>${u.getmB_Password()}</td>
						<td>${u.getmB_Sex()}</td>
						<td>${u.getmB_Birthday()}</td>
						<td>${u.getmB_Name()}</td>
						<td>${u.getmB_Mail()}</td>
						<td>${u.getmB_Tel()}</td>
						<td>${u.getmB_Address()}</td>
						<td>${u.getmB_Date()}</td>
						<td>${u.getmB_Lv()}</td>
						<td>${u.getmB_type()}</td>
						<td><button type="sumbit" name="delete"
								value="${u.getmB_ID()}" onclick="confirmChoice( )">刪除</a></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<script>

		</script>
		

	</form>
</body>

</html>