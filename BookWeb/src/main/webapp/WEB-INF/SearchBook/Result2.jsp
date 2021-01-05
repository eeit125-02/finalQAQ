<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
	href="${pageContext.request.contextPath}/css/bottle.css">
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
.a3 {
	margin: 0px;
	display: inline
}
.collectindex {
	float: right;
}
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
	
	$(document).ready(function() {
		loadBookTypeList();
	});	
// 	$(document).ready(function() {
// 		loadBookAuthorList();
// 	});	
	
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">

		<!-- 內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<br>
		<hr>
		<div class="collectindex">
			<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			
			<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<button type="submit" name="list" class="btn btn-outline-dark">收藏清單</button>
			</form>
				
			<a class="btn btn-outline-dark" href="<c:url value='/addnewbook' />" role="button">新增書籍</a>			
		</div>
		<br> <br>


<!--總筆數 -->
		<div id="resultnumber"></div>

<%--<h6>頁數：${page}／${totalPages}</h6> --%>
		<br>

<!-- 搜尋結果清單 -->
			<div class="booktypelist" id="booktypelist">	
			</div>						
		<br>
		<hr>
		</div>

	<script >

//點擊加入收藏
		function collect() {
			console.log("test");
			let bk_ID = document.getElementById("gocollect").value
			console.log(bk_ID);
			let editURL = "searchbook/resultcollect/"+bk_ID;
			
			$.ajax({
				async : false,
				type : 'GET',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						alert('成功加入收藏 ');
					}else {
						alert('加入失敗，本書已在您的收藏清單 ');
					}
				}
			});
		}
		
		
		function loadBookTypeList() {
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : "searchtype/loadBookTypeList",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
				},
				success : function(data) {
					console.log("test");
					var insertData = "<div>";
					for (let i = 0; i < data.length; i++) {
						insertData += "<div class=\"row\">"
							+"<div class=\"col-sm-2\">"
							+"<img class=\"itemcov\" alt=\"\" src=\""
							+data[i].bk_Pic
							+"\" width=\"150\">"
							+"</div>"
							+"<div class=\"col-sm-10\">"
							+"<h3>"
							+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
							+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
							+data[i].bk_ID+"\">"+data[i].bk_Name+"</button></form>"
							+"</h3>"
							+"｜ 作者："+data[i].bk_Author
							+" ｜  出版社："+data[i].bk_Publish
							+"｜  出版日期："+data[i].bk_Date
							+"<br>"
							+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
							+data[i].bk_Content
							+"</p>"	
							+"</div>"
							+"</div>"
							+"<div class=\"collect\" id=\"collect\">"
							+"<button id=\"gocollect\" type=\"submit\" name=\"collect\" onclick=\"collect();\""
							+"class=\"btn btn-outline-danger btn-sm\" value=\""
							+data[i].bk_ID
							+"\"<img "
							+"src=\"${pageContext.request.contextPath}/image/heartred.png\""
							+" id=\"Img/heart\" width=\"25px\"> 加入收藏</button>"
							+"</div>"	
							+"<br>"
							+"<hr>"
					}
					insertData += "</div>"
						var insertData1 = "<h3>搜尋結果：（總共 "+data.length+" 筆）</h3>"
					$("#booktypelist").html(insertData);	
					$("#resultnumber").html(insertData1);	
					}
				});
			}		
		
			
// 		function loadBookAuthorList() {
// 			$.ajax({
// 				async : false,
// 				cache : false,
// 				type : 'POST',
// 				url : "searchbookauthor/loadBookAuthorList",
// 				dataType : "json",
// 				contentType : "application/json;charset=utf-8",
// 				error : function() {
// 				},
// 				success : function(data) {
// 					console.log("test2");
// 					var insertData = "<div>";
// 					for (let i = 0; i < data.length; i++) {
// 						insertData += "<div class=\"row\">"
// 							+"<div class=\"col-sm-2\">"
// 							+"<img class=\"itemcov\" alt=\"\" src=\""
// 							+data[i].bk_Pic
// 							+"\" width=\"150\">"
// 							+"</div>"
// 							+"<div class=\"col-sm-10\">"
// 							+"<h3>"
// 							+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
// 							+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
// 							+data[i].bk_ID+"\">"+data[i].bk_Name+"</button></form>"
// 							+"</h3>"
// 							+"｜ 作者："+data[i].bk_Author
// 							+" ｜  出版社："+data[i].bk_Publish
// 							+"｜  出版日期："+data[i].bk_Date
// 							+"<br>"
// 							+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
// 							+data[i].bk_Content
// 							+"</p>"	
// 							+"</div>"
// 							+"</div>"
// 							+"<div class=\"collect\" id=\"collect\">"
// 							+"<button id=\"gocollect\" type=\"submit\" name=\"collect\" onclick=\"collect();\""
// 							+"class=\"btn btn-outline-danger btn-sm\" value=\""
// 							+data[i].bk_ID
// 							+"\"<img "
// 							+"src=\"${pageContext.request.contextPath}/image/heartred.png\""
// 							+" id=\"Img/heart\" width=\"25px\"> 加入收藏</button>"
// 							+"</div>"	
// 							+"<br>"
// 							+"<hr>"
// 					}
// 					insertData += "</div>"
// 						var insertData1 = "<h3>搜尋結果：（總共 "+data.length+" 筆）</h3>"
// 					$("#booktypelist").html(insertData);	
// 					$("#resultnumber").html(insertData1);	
// 					}
// 				});
// 			}	
	</script>

	<!-- 內容結束 -->
	
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	
</body>
</html>