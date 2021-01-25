<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<link rel="icon"
	href="${pageContext.request.contextPath}/image/logo1.ico"
	type="image/x-icon" />
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
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div style="text-align: center">
		<h2>二手書圖</h2>
	</div>
	<div class="container">
		<hr>
		<c:forEach items="${bookPrices}" var="v" begin="0" end="0">
			<div class="row">
				<div class="col-lg-4">
					<label for="url"></label> <img alt="圖勒?" width="200px"
						height="300px" src="<c:url value='${v.bk_Pic}'/>">
				</div>
				<div class="col-lg-8">
					<h2><span>書名: ${v.bk_Name}</span></h2>
					<h4><span>作者: ${v.bk_Author}</span></h4>
					<h4><span>出版社: ${v.bk_Publish}</span></h4>
					<h4><span>出版日: ${v.bk_PublishDate}</span></h4>
				</div>
			</div>
		</c:forEach>
		<br><br>
		<div class="row">
			<div class="col-lg-2">賣家</div>
			<div class="col-lg-2">二手價</div>
			<div class="col-lg-1">庫存</div>
			<div class="col-lg-2">上架日期</div>
			<div class="col-lg-2">購買數量</div>
			<div class="col-lg-3">&nbsp;</div>
		</div>
		<hr>
		<c:forEach items="${bookPrices}" var="v">
		<form action="<c:url value="/directBuy"/>" method="post">
			<div class="row">
				<input type="hidden" name="bk_ID" value="${v.bk_ID}"> 
				<input type="hidden" name="bs_Num" value="${v.bs_Num}">
				<input type="hidden" name="bs_Price" value="${v.bs_Price}">
				<input type="hidden" name="bs_ID" value="${v.bs_ID}">
				<input type="hidden" name="bks_ID" value="${v.bks_ID}">
				<div class="col-lg-2">
					<c:out value="${v.mb_Name}" />
				</div>
				<div class="col-lg-2">
					<c:out value="${v.bs_Price}" />
				</div>
				<div class="col-lg-1">
					<c:out value="${v.bs_Num}" />
				</div>
				<div class="col-lg-2">
					<c:out value="${v.bs_Date}" />
				</div>
				<div class="col-lg-2">
					<input type="number" name="cart_Num" min="1" max="${v.bs_Num}" value="1" 
					class="form-control">
				</div>
				<div class="col-lg-3">
					<button type="submit" class="btn btn-outline-secondary direct">直接購買</button>
					<!-- 					<button type="button" class="btn btn-outline-secondary indirect" -->
					<!-- 						onclick="addCart()">查看詳情</button> -->
				</div>
			</div>
			<hr>
		</form>
	
	
	
	
<!-- // 		function goToCart(bk, mb, Price) { -->
<!-- // 			if (typeof ($.cookie('Member_ID')) != "undefined") { -->
<!-- // 			var cartNum = $('#${v.bk_ID}').val(); -->
<!-- // // 			console.log(cartNum) -->
<%-- // 			alert($('.form-control.a${v.bk_ID}').val()) --%>
<%-- // // 			document.forms[0].action="<c:url value='/pointMid?bk_ID=" + bk + "&mb_ID="+ mb  --%>
<%-- // // 					+"&bs_Price="+Price+"&cart_Num="+cartNum+"&qty="+${v.bs_Num}+"'/>" ; --%>
<!-- // // 			document.forms[0].method="post"; -->
<!-- // // 			document.forms[0].submit(); -->
<!-- // 			} else{ -->
<%-- // 				document.forms[0].action="<c:url value='/toLogin' />" ; --%>
<!-- // 				document.forms[0].method="get"; -->
<!-- // 				document.forms[0].submit(); -->
<!-- // 			} -->
<!-- // 		} -->
		</c:forEach>
	</div>

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
		<script type="text/javascript">
			
			$(document).ready(function() {
				$("#bookWebheader").load("//localhost:8080/BookWeb/header");
				$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
// 			console.log($(this).val()>parseInt($(this).attr("max")))
				$('.form-control').each(function() {
					$(this).change(function() {
						if( $(this).val()>parseInt($(this).attr("max")) ){
							$(this).val($(this).attr("max"))
						} else if($(this).val() < parseInt($(this).attr("min"))){
							$(this).val($(this).attr("min"))
						}
					})	
				})
			});
	</script>
</body>
</html>