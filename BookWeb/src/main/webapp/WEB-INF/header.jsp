<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/js/jQuery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jQuery/jquery.cookie.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
		<div id="loginButton" style="float:right">
		</div>
	
	<div class="row flex-nowrap justify-content-between align-items-center">

		<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
		<img alt="LOGO" src="${pageContext.request.contextPath}/image/logo1.png" id="Img/logo">
			</a>
			
	</div>
	

	<div class="nav-scroller py-1 mb-2">
		<nav class="nav d-flex justify-content-between">
			<a class="p-2 text-muted" href="//localhost:8080/BookWeb/SearchBook/Search">圖書漂流瓶</a> 
			<a class="p-2 text-muted" href="//localhost:8080/BookWeb/Transation/storeMain">二手書圖</a> 
			<a class="p-2 text-muted" href='<c:url value="/showActs"/>'>共樂聚落</a> 
			<a class="p-2 text-muted" href='<c:url value="/Discussion/mainpage"/>'>書適論壇</a>
			<a class="nav-link dropdown-toggle text-muted" href="#"
				id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> 閱讀履歷 </a>
			<div class="dropdown-menu text-muted"
				aria-labelledby="navbarDropdownMenuLink2">
				<a class="dropdown-item text-muted" href="//localhost:8080/BookWeb/BookReport/searchBookReport">讀書心得</a> 
				<a class="dropdown-item text-muted" href="#">Another action</a> 
				<a class="dropdown-item text-muted" href="//localhost:8080/BookWeb/BookReport/EditBookReport">編輯資訊</a>
			</div>

		</nav>
	</div>
	
	<script>
		if (typeof($.cookie('Member_ID')) != "undefined"){
				$('#loginButton').html("<a href=\"//localhost:8080/BookWeb/toCity\">會員中心</a>&nbsp;"
						+ "<a id=\"logout\" href=\"//localhost:8080/BookWeb/toLogin\">登出</a>");
				$("#logout").click(function(){
					$.removeCookie('Member_ID', { path: '/BookWeb' });
					$.removeCookie('Member_ID', { path: '/BookWeb/toLogin' });
				});
		}else{
			console.log("log")
			$('#loginButton').html("<a id=\"login\" href=\"//localhost:8080/BookWeb/toLogin\">登入</a>");
		};
// 		$(document).ready(function() {
// 			if(typeof($.cookie('Member_ID')) == "undefined" && window.location.href !="//localhost:8080/BookWeb/toLogin"){
// 				window.location.href="//localhost:8080/BookWeb/toLogin";
// 			}
// 		})
	</script>
</body>
</html>