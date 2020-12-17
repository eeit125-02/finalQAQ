<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>Insert title here</title>
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
		<div class='center'>
			<h1>活動資料</h1>
			<c:if test='${empty allacts}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			查無活動資料<br>
			</c:if>
			<c:if test='${not empty allacts}'>
				<%-- 			<c:if test ='${vs.first }'> --%>
				<%-- 				<c:out value="<table border='1'>" escapeXml='false'/> --%>
				<%-- 				<c:out value="<tr> --%>
				<table border='1'>
					<tr>
						<td>會員帳號</td>
						<td>活動編號</td>
						<td>活動圖片</td>
						<td>活動名稱</td>
						<td>活動主題</td>
						<td>活動日期</td>
						<td>活動簡介</td>
						<td>活動地點</td>
						<td>活動嘉賓</td>
						<td>活動人數</td>
						<td>活動規則</td>
						<td>活動標籤</td>
						<td>活動場所</td>
					</tr>
					<!-- 				</tr>" escapeXml='false'/> -->
					<%-- 			</c:if> --%>
					<c:forEach var='act' varStatus='vs' items='${allacts}'>
						<%-- 			${act.ACT_Image} --%>
						<tr>
							<%-- 				<td><a href='/FindActServlet?key=${act.ACT_Name}'></a></td> --%>
							<td>${act.mb_ID}</td>
							<td>${act.act_ID}</td>
							<td>${act.act_Image}</td>
							<td>${act.act_Name}</td>
							<td>${act.act_Theme}</td>
							<td>${act.act_Date}</td>
							<td>${act.act_Loc}</td>
							<td>${act.act_Intro}</td>
							<td>${act.act_Guest}</td>
							<td>${act.act_Pax}</td>
							<td>${act.act_Rule}</td>
							<td>${act.act_Tag}</td>
							<td>${act.act_Place}</td>
							<td><a href='updateAct' ${act.act_ID}>編輯</a>
							<td><a href='updateAct' ${act.act_ID}>刪除</a>
						</tr>
					</c:forEach>
				</table>
				<%-- 			<c:if test ='${vs.last }'> --%>
				<%-- 				<c:out value="</table>" escapeXml='false'/> --%>
				<%-- 			</c:if> --%>
			</c:if>
			<p />
			<a href='${pageContext.request.contextPath}/ActHomepage'>回到活動管理</a>
			<a href='555'>管理</a>
			<a href='showCreateForm' >新增活動</a><br>
		</div>
	</div>
</body>
</html>