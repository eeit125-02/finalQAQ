<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-3.5.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery.cookie.js"></script>
<meta charset="UTF-8">
<link rel="icon"
	href="${pageContext.request.contextPath}/image/logo1.ico"
	type="image/x-icon" />
<title>書適圈</title>

<style>
.text-muted{
color:white
}
</style>
</head>

<body>
	<div  id="loginButton" style="float: right"></div>
	<form action="<c:url value='/shopping' />" method="get" class="shop">
<!-- 		<!-- 偷偷放購物車QAQ start --> 
		<a href="#" style="float: right; margin-right: 20px"
			onclick="cartCheck()"><img alt="wtf..."
			src="${pageContext.request.contextPath}/image/shoppingCart1.png"
			width="35px" height="35px"></a>
<!-- 		<!-- 偷偷放購物車QAQ end --> 
	</form>
	<div class="row flex-nowrap justify-content-between align-items-center">

		<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
			<img alt="LOGO"
			src="${pageContext.request.contextPath}/image/logo1.png"
			id="Img/logo">
		</a>
	</div>


<!-- 	<div class="nav-scroller py-1 mb-2"> -->
<!-- 		<nav class="nav d-flex justify-content-between" -->
<!-- 			style="background-color: #5ca4a9;"> -->
<%-- 			<a class="p-2 text-muted" href='<c:url value="/SearchBook/Search"/>'>圖書漂流瓶</a> --%>
<%-- 			<a class="p-2 text-muted" href='<c:url value="/qaqTest"/>'>二手書圖</a> <a --%>
<%-- 				class="p-2 text-muted" href='<c:url value="/showActs"/>'>共樂聚落</a> <a --%>
<%-- 				class="p-2 text-muted" href='<c:url value="/Discussion/mainpage"/>'>書適論壇</a> --%>
<!-- 			<a class="p-2 text-muted" -->
<!-- 				href='//localhost:8080/BookWeb/BookReport/searchBookReport/all/1'>閱讀履歷 -->
<!-- 			</a> -->
<!-- 		</nav> -->
<!-- 	</div> -->
<%-- 	<input type="hidden" id="pic" value="${loginUser.mb_pic}"> --%>
<%-- 	<input type="hidden" id="name" value="${loginUser.mb_Name}"> --%>
	
	
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
	
	
	
	<script>
	console.log(typeof($.cookie('Member_ID')))
	console.log($('#pic').val())
		$(document)
				.ready(
						function() {
							var pic=$('#pic').val();
							var name=$('#name').val();
							if (typeof ($.cookie('Member_ID')) != "undefined") {
								$('#loginButton')
										.html(
												"<img src=\""
														+ pic
														+ "\" style=\"width: 35px; height: 35px; text-align:center; border-radius: 50%;\"/>&nbsp;"
														+ "<a href=\"//localhost:8080/BookWeb/toCity\">"
														+ name
														+ "</a>&nbsp;"
														+ "<a id=\"logout\" href=\"//localhost:8080/BookWeb/toLogin\">登出</a>");
								$("#logout").click(function() {
									console.log("123")
									$.removeCookie('Member_ID', {
										path : '/BookWeb'
									});
									$.removeCookie('Member_ID', {
										path : '/BookWeb/toLogin'
									});
								});
							} else {
								$('#loginButton')
										.html(
												"<a id=\"login\" href=\"//localhost:8080/BookWeb/toLogin\">登入</a>");
								// 								if(window.location.href !="http://localhost:8080/BookWeb/toLogin"){ 								 
								// 								window.location.replace("//localhost:8080/BookWeb/toLogin");}
							}
							;
						})
		function cartCheck() {
			if (typeof ($.cookie('Member_ID')) != "undefined") {
				$('.shop').submit();
			} else {
				window.location.href = "//localhost:8080/BookWeb/toLogin";
			}
		}
		// 		$(document).ready(function() {
		// 			if(typeof($.cookie('Member_ID')) == "undefined" && window.location.href !="http://localhost:8080/BookWeb/toLogin"){
		// 				window.location.href="//localhost:8080/BookWeb/toLogin";
		// 			}
		// 		})
	</script>
</body>
</html>