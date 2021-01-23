<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
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
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header py-3" id="bookWebheader"></header>
	<!-- header -->


	<!-- body -->
	<form></form>

	<div style="text-align: center">
<!-- 		<h2>二手書圖</h2> -->
	</div>
	<div class="container">
		<input type="hidden" id="bks_ID"
			value="${bookdetail.bks_ID}">
		<hr>
		<div class="row">
			<div class="col-lg-4">
				<label for="url"></label> <img alt="圖勒?" width="300px"
					height="400px" src="<c:url value='${bookdetail.book.bk_Pic}'/>">
			</div>
			<div class="col-lg-8">
				<h3>
				<span> ${bookdetail.book.bk_Name}</span></h3>
				<hr>
				<h5>作者：
				<span> ${bookdetail.book.bk_Author}</span></h5>
				<hr>
				<h5>出版社：
				<span> ${bookdetail.book.bk_Publish}</span></h5>
				<hr>
				<h5>出版日：
				<span> ${bookdetail.book.bk_Date}</span></h5>
				<hr>
				<h5>價錢：
				<span> ${bookdetail.bs_Price}</span> <a
					href="<c:url value='/qaqManyPrice?ID=${bookdetail.book.bk_ID}'/>"
					style="margin-left: 50px;font-size:16px">查看其他價格 </a></h5>
				<hr>
				<h5>庫存：
				<span id="amount">${bookdetail.bs_Num}</span></h5>
<%-- 				<input type="text" value="${bookdetail.bs_Num}" disabled="disabled"> --%>
<hr>
<div class="row">
<div class="col-sm-6">
<p class="h5">購買數量：
<input type="number" class="form-control" id="buyNum"
						aria-label="Dollar amount (with dot and two decimal places)"
						value="1" min="1"  ></p>
					<span id="sp" style="color: red"></span>
</div>
<div class="col-sm-6">
					<button type="submit" class="btn btn-outline-success" style="float:right;margin-top:15px;margin-right:15px"
					onclick="goToCart(${bookdetail.bks_ID})">直接購買</button>
					<button type="submit" class="btn btn-outline-success" style="float:right;margin-top:15px"
					onclick="addCart(${bookdetail.book.bk_ID},${bookdetail.bs_Price})">放入購物車</button>
</div>
</div>
			</div>
		</div>
		<br>
		<!-- 		qaq -->

<!-- 		<div class="row"> -->
<!-- 			<div class="col-sm-4"></div> -->
<!-- 			<div class="input-group col-sm-4"> -->
<!-- 				<div class="col-sm-4"> -->
<!-- 					<p class="h5">購買數量:</p> -->
<!-- 				</div> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 					<input type="number" class="form-control" id="buyNum" -->
<!-- 						aria-label="Dollar amount (with dot and two decimal places)" -->
<!-- 						value="1" min="1"  > -->
<!-- 					<span id="sp" style="color: red"></span> -->
<!-- 					onblur="checkBuy()" -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-1"> -->
<!-- 				<button type="submit" class="btn btn-outline-success" -->
<%-- 					onclick="goToCart(${bookdetail.bks_ID})">直接購買</button> --%>
<!-- 			</div> -->
<!-- 			<div class="col-sm-1"> -->
<!-- 				<button type="submit" class="btn btn-outline-success" -->
<%-- 					onclick="addCart(${bookdetail.book.bk_ID},${bookdetail.bs_Price})">放入購物車</button> --%>
<!-- 			</div> -->
		</div>
	</div>

	<!-- 		qaq   max="${bookdetail.bs_Num}"-->
	<div class="container">
		<hr>
		<div class="col-lg-12">
			<textarea rows="20" cols="150" readonly="readonly"
				style="border-style: none;">
			${bookdetail.book.bk_Content }
			</textarea>
		</div>
	</div>
	<!-- body -->


	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
	});
// 	檢查購買數量是否正確
$('#buyNum').change(function() {
	var buyNum = document.getElementById("buyNum");
	var amount = document.getElementById("amount");
	var buyNumVal = buyNum.value;
	var sp = document.getElementById("sp");
	if (buyNumVal < 1 || buyNumVal > parseInt(amount.innerHTML)) {
		sp.innerHTML="超過庫存上限";
		document.getElementById("buyNum").value = parseInt(amount.innerHTML);
	} else{
		sp.innerHTML="";
	}
})
// 	function checkBuy() {
// 		var buyNum = document.getElementById("buyNum");
// 		var amount = document.getElementById("amount");
// 		var buyNumVal = buyNum.value;
// 		var sp = document.getElementById("sp");
// 		if (buyNumVal < 1 || buyNumVal > parseInt(amount.innerHTML)) {
// 			sp.innerHTML="超過庫存上限";
// 			document.getElementById("buyNum").value = parseInt(amount.innerHTML);
// 		} else{
// 			sp.innerHTML="";
// 		}
// 	}
	
		function goToCart(id) {
			if (typeof ($.cookie('Member_ID')) != "undefined") {
				var buyNum = $('#buyNum').val();
				document.forms[0].action="<c:url value='/dctyBuy?bks_ID=" + id + "&cart_Num="+buyNum+"' />" ;
				document.forms[0].method="post";
				document.forms[0].submit();
			} else {
				document.forms[0].action="<c:url value='/toLogin' />" ;
				document.forms[0].method="get";
				document.forms[0].submit();
			}
			;
		}
		
		function addCart(bk_ID1, bs_Price) {
			if (typeof ($.cookie('Member_ID')) != "undefined") {
				$.ajax({
					async : false,
					type : 'GET',
					data : { bk : bk_ID1, bp : bs_Price, bs : $('#amount').html(), bks : $('#bks_ID').val(), qty : $('#buyNum').val()}, 
					url : "<c:url value='/addCart'/>",
					dataType : "json",
					error : function() {
						alert("你做錯了喔!!!");
					},
					success : function(data) {
						$('#amount').html(data.qty);
						Swal.fire({
							  position: 'top-center',
							  icon: 'success',
							  title: '已加入購物車!!!',
							  showConfirmButton: false,
							  timer: 1500
							})
					}
				})
			} else {
				document.forms[0].action="<c:url value='/toLogin' />" ;
				document.forms[0].method="get";
				document.forms[0].submit();
			}
			;
		}
	</script>
</body>
</html>