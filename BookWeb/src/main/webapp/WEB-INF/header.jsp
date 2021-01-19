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
<title>Insert title here</title>

</head>
<body>
	<div id="loginButton" style="float: right"></div>
	<form></form>
	<!-- 偷偷放購物車QAQ start -->
	<a href="#" style="float: right; margin-right: 20px"
		onclick="cartCheck()"><img alt="wtf..."
		src="${pageContext.request.contextPath}/image/shopping.png"
		width="30px" height="30px"></a>
	<!-- 偷偷放購物車QAQ end -->

	<div class="row flex-nowrap justify-content-between align-items-center">

		<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
			<img alt="LOGO"
			src="${pageContext.request.contextPath}/image/logo1.png"
			id="Img/logo">
		</a>
	</div>


	<div class="nav-scroller py-1 mb-2">
		<nav class="nav d-flex justify-content-between" style="background-color:#D2E9FF;">
			<a class="p-2 text-muted"
				href='<c:url value="/SearchBook/Search"/>'>圖書漂流瓶</a> 
				<a class="p-2 text-muted" href='<c:url value="/qaqTest"/>'>二手書圖</a> 
				<a class="p-2 text-muted" href='<c:url value="/showActs"/>'>共樂聚落</a> 
				<a class="p-2 text-muted" href='<c:url value="/Discussion/mainpage"/>'>書適論壇</a>
				<a class="p-2 text-muted" href='//localhost:8080/BookWeb/BookReport/searchBookReport/all/1'>閱讀履歷 </a>
		</nav>
	</div>
		<input type="hidden" id="pic" value="${loginUser.mb_pic}">
		<input type="hidden" id="name" value="${loginUser.mb_Name}">
	<script>
	console.log(typeof($.cookie('Member_ID')))
	console.log($('#pic').val())
		let pic=$('#pic').val();
		let name=$('#name').val();
		$(document)
				.ready(
						function() {
							if (typeof ($.cookie('Member_ID')) != "undefined") {
								$('#loginButton')
										.html(  "<img src=\""+pic+"\" style=\"width: 35px; height: 35px; text-align:center; border-radius: 50%;\"/>&nbsp;"
												+"<a href=\"//localhost:8080/BookWeb/toCity\">"+name+"</a>&nbsp;"
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
							}
							;
						})
		function cartCheck() {
			if (typeof ($.cookie('Member_ID')) != "undefined") {
				document.forms[0].action = "<c:url value='/shopping' />";
				document.forms[0].method = "post";
				document.forms[0].submit();
			} else {
				window.location.href = "//localhost:8080/BookWeb/toLogin";
			}
		}
		// 		$(document).ready(function() {
		// 			if(typeof($.cookie('Member_ID')) == "undefined" && window.location.href !="//localhost:8080/BookWeb/toLogin"){
		// 				window.location.href="//localhost:8080/BookWeb/toLogin";
		// 			}
		// 		})
	</script>
</body>
</html>