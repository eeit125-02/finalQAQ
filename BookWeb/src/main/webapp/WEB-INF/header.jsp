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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar2.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/image/logo1.ico"
	type="image/x-icon" />
<title>書適圈</title>

<style>
.text-muted{
color:white
}
/*  body{  */
/*  background-image: url('${pageContext.request.contextPath}/image/ex2.png');  */

/* } */

</style>
</head>

<body>
	<div style="width:100%;background-color:#c68463">
	<!-- 		<!-- 偷偷放購物車QAQ start --> 
<!-- 		  <a href="#" style="float: right; margin-right: 20px" -->
<!--    onclick="cartCheck()"><img alt="wtf..." -->
<%--    src="${pageContext.request.contextPath}/image/shoppingCart1.png" --%>
<!--    width="35px" height="35px"></a> -->
<!-- 		<!-- 偷偷放購物車QAQ end --> 
		<div id="loginButton" style="margin-left:87%;color:white;height:50px;padding:8px" ></div></div>
<div class="" style="background-color:#f7efe8">
<!-- 	<div  style="float: right; margin-right:270px; margin-top:20px;" ></div> -->
	<form action="<c:url value='/shopping' />" method="get" class="shop">
	</form>
	<div class="row flex-nowrap justify-content-between align-items-center">

<!-- 		<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb"> -->
<!-- 			<img alt="LOGO" style="margin-left:270px" -->
<%-- 			src="${pageContext.request.contextPath}/image/logo1.png" --%>
<!-- 			id="Img/logo" height="75px"> -->
<!-- 		</a> -->
		
	</div>
</div>


<nav class="menu" style="background-color:#f7efe8;height:110px" >

  <ol>  
    <li class="menu-item" style="padding-right:35px"><a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
			<img alt="LOGO"
			src="${pageContext.request.contextPath}/image/logo1.png"
			id="Img/logo" height="75px">
		</a></li>
    <li class="menu-item" style="padding:35px"><a href='<c:url value="/SearchBook/Search"/>'>圖書漂流瓶</a></li>
    <li class="menu-item" style="padding:35px"><a href='<c:url value="/qaqTest"/>'>二手書圖</a></li>
    <li class="menu-item" style="padding:35px">
      <a href='<c:url value="/showActs"/>'>共樂聚落</a>
    </li>
    <li class="menu-item" style="padding:35px">
      <a href='<c:url value="/Discussion/mainpage"/>'>書適論壇</a>
    </li >
    <li class="menu-item" style="padding:35px"><a href='//localhost:8080/BookWeb/BookReport/searchBookReport/all/1'>閱讀履歷</a></li>
  </ol>
</nav>	
	
	<input type="hidden" id="pic" value="${loginUser.mb_pic}">
	<input type="hidden" id="name" value="${loginUser.mb_Name}">
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
														+ "\" style=\"width: 35px; height: 35px; text-align:center; border-radius: 50%\"/>&nbsp;"
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