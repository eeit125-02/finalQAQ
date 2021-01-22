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
	 		<!-- 偷偷放購物車QAQ start --> 
	 		<div id="loginButton" style="margin-left:87%;color:white;height:50px;padding:15px" >
		  <a href="#" style="margin-bottom:4px"
   onclick="cartCheck()"><img alt="wtf..."
   src="${pageContext.request.contextPath}/image/321123.png"
   style="margin-bottom:5px;width:25px;height:25px;margin-right:10px"></a>
		<!-- 偷偷放購物車QAQ end --> 
		</div></div>
<div class="" style="background-color:#f7efe8">
<!-- 	<div  style="float: right; margin-right:270px; margin-top:20px;" ></div> -->
	<form action="<c:url value='/shopping' />" method="get" class="shop">
	</form>
	<div class="row flex-nowrap justify-content-between align-items-center">

<!-- 		<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb"> -->
<!-- 			<img alt="LOGO" style="margin-left:270px" -->
<%-- 			src="${pageContext.request.contextPath}/image/321123.png" --%>
<!-- 			id="Img/logo" height="75px"> -->
<!-- 		</a> -->
		
	</div>
</div>


<nav class="menu" style="background-color:#f7efe8;height:110px" >

  <ol style="margin-right:550px">  
<<<<<<< HEAD
    <li class="menu-item" style="padding-right:100px;margin-right:100px"><a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
=======
    <li class="menu-item" style="padding-right:30px;margin-right:50px"><a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">
>>>>>>> YuHao
			<img alt="LOGO"
			src="${pageContext.request.contextPath}/image/logo1.png"
			id="Img/logo" height="75px">
		</a></li>
    <li class="menu-item" style="padding:35px"><a href='<c:url value="/SearchBook/Search"/>' style="font-size:20px">圖書漂流瓶</a></li>
    <li class="menu-item" style="padding:35px"><a href='<c:url value="/qaqTest"/>' style="font-size:20px">二手書圖</a></li>
    <li class="menu-item" style="padding:35px">
      <a href='<c:url value="/showActs"/>' style="font-size:20px">共樂聚落</a>
    </li>
    <li class="menu-item" style="padding:35px">
      <a href='<c:url value="/Discussion/mainpage"/>' style="font-size:20px">書適論壇</a>
    </li >
    <li class="menu-item" style="padding:35px"><a href='//localhost:8080/BookWeb/BookReport/searchBookReport/all/1' style="font-size:20px">閱讀履歷</a></li>
      <li class="menu-item" style="padding:35px"><a href='//localhost:8080/BookWeb/toCity' style="font-size:20px">會員專區</a></li>
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
										.append("<img src=\""
														+ pic
														+ "\" style=\"width: 35px; height: 35px; text-align:center; border-radius: 50%\"/>&nbsp;"
														+ "<a href=\"//localhost:8080/BookWeb/toCity\" style=\"color:white\">"
														+ name
														+ "</a>&nbsp;"
														+ "<a id=\"logout\" href=\"//localhost:8080/BookWeb/toLogin\" style=\"color:white\">登出</a>");
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
										.append(
												"<a id=\"login\" href=\"//localhost:8080/BookWeb/toLogin\" style=\"color:white;font-size:20px\"><img src=\""
												+ "${pageContext.request.contextPath}/image/login1.png"
												+ "\" style=\"width: 25px; height: 25px; text-align:center; border-radius: 50%\"/></a>");
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