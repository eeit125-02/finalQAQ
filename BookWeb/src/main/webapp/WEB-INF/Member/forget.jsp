<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>書適圈</title>
</head>
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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<style>
fieldset {
	border-radius: 25px;
	padding: 20px;
	background-color: #F3F3FA;
	margin:auto;
	width: 400px;
	text-align:center;
}

legend {
	text-align: center;
	font-size: 30px;
}

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
</head>
<body>
<header class="container blog-header py-3" id="bookWebheader"></header>
<div class="container media">
    <fieldset>
        <legend>尋找密碼</legend>
        <form action="<c:url value='/JavaMail' />" method="post">
        <p>請輸入電子郵件</p>
        <hr>
        <div>
            <input type="text" id="" name="mail">
            <span><button id="send1">送出</button></span>
        </div>
        </form>
    </fieldset>
    </div>
    <footer class="container py-5" id="bookWebFooter"></footer>
</body>
<script>
$(document).ready(function() {
	$("#bookWebheader").load("<c:url value='/header'/>");
	$("#bookWebFooter").load("<c:url value='/footer'/>");
});
	$("#send1").click(function(){
		alert("請至信箱收取信件後再行登入");
		$('form').submit();
	})
</script>
</html>