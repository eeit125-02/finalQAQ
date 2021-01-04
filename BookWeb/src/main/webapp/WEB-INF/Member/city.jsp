<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
#city {
	border-radius: 25px;
	padding: 20px;
	background-color: #F3F3FA;
	height:300px;
	width: 200px;
	float:left;
}
 
legend {
	text-align: center;
}

div {
	text-align: center;
	margin: 10px;
}
p {
	text-align: center;
	margin-top: 0px;
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
<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container media" style="width:1500px; margin-left:400px" >
	<fieldset id="city">
		<legend>會員中心</legend>
		<div>
				<div><button  id="admin1" name="admin" class="btn btn-outline-secondary">會員資訊</button>
				</div>
				<div><button  id="inf" name="mb_inf" class="btn btn-outline-secondary">會員資訊</button>
				</div>
				<button  id="Modify" name="Modify" class="btn btn-outline-secondary">會員修改</button>
				<div>
				<button  id="pwdModify" name="pwdModify" class="btn btn-outline-secondary">密碼修改</button>
				</div>
			<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<div>
				<button type="submit" name="list" class="btn btn-outline-secondary">收藏清單</button>
				</div>
			
			</form>
		</div>
	</fieldset>
		<div id="change123" style="width:900px;margin-left:10px ">顯示頁面</div>
	</div>
	<input id="test" type="hidden" value="${third}">
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
	});
	</script>
	<script>
        var check = $("#test").val();
        if(check=="third"){
			$("#pwdModify").hide();
			$("#admin1").hide();
		}else if(check=="admin"){
			$("#pwdModify").hide();
			$("#Modify").hide();
			$("#inf").hide();
		}else{
			$("#admin1").hide();
		}
	 $("#inf").click(function(){
		$('#change123').load("/BookWeb/mb_inf") 
	 })
	  $("#Modify").click(function(){
		$('#change123').load("/BookWeb/MbUpdate") 
	 })
	   $("#pwdModify").click(function(){
		$('#change123').load("/BookWeb/Modify") 
	 })
	 $("#admin1").click(function(){
		$('#change123').load("/BookWeb/adminall") 
	 })
</script>
</body>
</html>