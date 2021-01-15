<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<style>
.quantity {
	float: left;
	margin-right: 15px;
	background-color: #eee;
	position: relative;
	width: 80px;
	overflow: hidden
}

.quantity input {
	margin: 0;
	text-align: center;
	width: 15px;
	height: 15px;
	padding: 0;
	float: right;
	color: #000;
	font-size: 20px;
	border: 0;
	outline: 0;
	background-color: #F6F6F6
}

.quantity input.qty {
	position: relative;
	border: 0;
	width: 100%;
	height: 40px;
	padding: 10px 25px 10px 10px;
	text-align: center;
	font-weight: 400;
	font-size: 15px;
	border-radius: 0;
	background-clip: padding-box
}

.quantity .minus, .quantity .plus {
	line-height: 0;
	background-clip: padding-box;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-background-size: 6px 30px;
	-moz-background-size: 6px 30px;
	color: #bbb;
	font-size: 20px;
	position: absolute;
	height: 50%;
	border: 0;
	right: 0;
	padding: 0;
	width: 25px;
	z-index: 3
}

.quantity .minus:hover, .quantity .plus:hover {
	background-color: #dad8da
}

.quantity .minus {
	bottom: 0
}

.shopping-cart {
	margin-top: 20px;
}

/* ----- */
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
	
	function confirmDelete(n) {
		if (confirm("確定刪除此項商品 ? ") ) {
			document.forms[0].action="<c:url value='updateCart.do?cmd=DEL&cart_ID=" + n +"' />" ;
			document.forms[0].method="POST";
			document.forms[0].submit();
		} else {
		
		}
	}
	function modify(key, qty, index) {
		var x = "newQty" + index;
		var newQty = document.getElementById(x).value;
		if  (newQty < 0 ) {
			window.alert ('數量不能小於 0');
			return ; 
		}
		if  (newQty == 0 ) {
			window.alert ("請執行刪除功能來刪除此項商品");
			document.getElementById(x).value = qty;
			return ; 
		}
		if  (newQty == qty ) {
			window.alert ("新、舊數量相同，不必修改");
			return ; 
		}
		if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
			document.forms[0].action="<c:url value='updateCart.do?cmd=MOD&cart_ID=" + key + "&cart_Num=" + newQty +"' />" ;
			document.forms[0].method="POST";
			document.forms[0].submit();
		} else {
			document.getElementById(x).value = qty;
		}
	}
	function isNumberKey(evt)
	{
	   var charCode = (evt.which) ? evt.which : event.keyCode
	   if (charCode > 31 && (charCode < 48 || charCode > 57)){
	      return false;
	   }
	   return true;
	}
	function Checkout(qty) {
		if (qty == 0)  {
			alert("無購買任何商品，不需結帳");
			return false;
		}
		if (confirm("再次確認訂單內容 ? ") ) {
			return true;
		} else {
			return false;
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container">
		<!-- body -->

		<!-- 內容 -->
		<table
			style="margin: 0 auto; width: 820px; background: #EFEFFB; border: 2px solid black;">
			<tr>
				<td colspan='4'>
					<!--          購物車的標題          -->
					<table style="width: 820px">
						<tr height='40'>
							<td width="270">&nbsp;</td>
							<td width="280" align='center'><FONT size='+2'>某 會 員
									的 購 物 車</FONT></td>
							<td width="270" align='right'></td>
						</tr>
						<tr height='18'>
							<td width="270">&nbsp;</td>
							<td width="280" align='center'><FONT size='+2'>購 物 清
									單</FONT></td>
							<td width="270" align='right'></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td>
					<table border='1'>
						<tr>
							<th width="320">書籍名稱</th>
							<th width="70">作者</th>
							<th width="60">出版社</th>
							<th width="60">單價</th>
							<th width="40">數量</th>
							<th width="110">小計</th>
							<th width="110">修改</th>
						</tr>
						<c:forEach varStatus="vs" var="v" items="${list}">

							<tr height='16'>
								<td>${v.book.bk_Name}</td>
								<td style="text-align: center;">${fn:substring(v.book.bk_Author, 0, 3)}</td>
								<td style="text-align: center;">${fn:substring(v.book.bk_Publish, 0, 2)}</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${v.cart_Price }" pattern="#,###" />元</td>
								<td style="text-align: right;"><Input
									id="newQty${vs.index}" style="width: 28px; text-align: right"
									name="newQty" type="text"
									value="<fmt:formatNumber value="${v.cart_Num}" />" name="qty"
									onkeypress="return isNumberKey(event)" /></td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${v.cart_Price * v.cart_Num}" pattern="#,###,###" />元</td>
								<td><button type="submit" name="updateCart"
										value="${v.cart_ID}"
										onclick="modify(${v.cart_ID}, ${v.cart_Num}, ${vs.index})">修改</button>
									<button type="submit" name="deleteCart" value="${v.cart_ID}"
										onclick="confirmDelete(${v.cart_ID})">刪除</button></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan='5' align='right'>總計金額：</td>
							<td align='right'>${totalCart}元</td>
							<td align='right'>&nbsp;</td>
						</tr>
					</table>

				</td>
			</tr>
			<tr height='80'>
				<td>
					<table border='1'>
						<tr>
							<td width="400" align='center'><a
								href='<c:url value="/qaqTest" />'>繼續購物</a></td>
							<td width="400" align='center'>
								<%-- 							<a href="<c:url value='/checkout' />" --%> <%-- 								onClick="return Checkout(${subtotal});"> --%>
								<!-- 								結帳 --> <!-- 								</a> -->

								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">結帳</button>

							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div style='text-align: center;'>
			<c:if test='${not empty OrderErrorMessage}'>
				<font color='red'>${OrderErrorMessage}</font>
				<c:remove var="OrderErrorMessage" />
			</c:if>
		</div>

		<form>
			<input type="hidden" name="a" />
		</form>

	</div>
	<%-- 	${sessionScope.list} --%>
	<!-- 內容 -->
		<!--測試用 -->
		<div class="container">
			<div class="card shopping-cart">
				<div class="card-header bg-dark text-light">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i> Shipping
					cart <a href="" class="btn btn-outline-info btn-sm pull-right">Continiu
						shopping</a>
					<div class="clearfix"></div>
				</div>
				<div class="card-body">
					<!-- PRODUCT -->
					<div class="row">
						<div class="col-12 col-sm-12 col-md-2 text-center">
							<img class="img-responsive" src="http://placehold.it/120x80"
								alt="prewiew" width="120" height="80">
						</div>
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
							<h4 class="product-name">
								<strong>Product Name</strong>
							</h4>
							<h4>
								<small>Product description</small>
							</h4>
						</div>
						<div
							class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
							<div class="col-3 col-sm-3 col-md-6 text-md-right"
								style="padding-top: 5px">
								<h6>
									<strong>25.00 <span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-4 col-sm-4 col-md-4">
								<div class="quantity">
									<input type="button" value="+" class="plus"> <input
										type="number" step="1" max="99" min="1" value="1" title="Qty"
										class="qty" size="4"> <input type="button" value="-"
										class="minus">
								</div>
							</div>
							<div class="col-2 col-sm-2 col-md-2 text-right">
								<button type="button" class="btn btn-outline-danger btn-xs">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					</div>
					<hr>
					<!-- END PRODUCT -->
					<!-- PRODUCT -->
					<div class="row">
						<div class="col-12 col-sm-12 col-md-2 text-center">
							<img class="img-responsive" src="http://placehold.it/120x80"
								alt="prewiew" width="120" height="80">
						</div>
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
							<h4 class="product-name">
								<strong>Product Name</strong>
							</h4>
							<h4>
								<small>Product description</small>
							</h4>
						</div>
						<div
							class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
							<div class="col-3 col-sm-3 col-md-6 text-md-right"
								style="padding-top: 5px">
								<h6>
									<strong>25.00 <span class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-4 col-sm-4 col-md-4">
								<div class="quantity">
									<input type="button" value="+" class="plus"> <input
										type="number" step="1" max="99" min="1" value="1" title="Qty"
										class="qty" size="4"> <input type="button" value="-"
										class="minus">
								</div>
							</div>
							<div class="col-2 col-sm-2 col-md-2 text-right">
								<button type="button" class="btn btn-outline-danger btn-xs">
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					</div>
					<hr>
					<!-- END PRODUCT -->
					<div class="pull-right">
						<a href="" class="btn btn-outline-secondary pull-right">
							Update shopping cart </a>
					</div>
				</div>
				<div class="card-footer">
					<div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
						<div class="row">
							<div class="col-6">
								<input type="text" class="form-control"
									placeholder="cupone code">
							</div>
							<div class="col-6">
								<input type="submit" class="btn btn-default" value="Use cupone">
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin: 10px">
						<a href="" class="btn btn-success pull-right">Checkout</a>
						<div class="pull-right" style="margin: 5px">
							Total price: <b>50.00€</b>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--測試用 -->


	<!-- 結帳後的資訊 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="<c:url value='checkout'/>" method="post">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">請輸入您的資訊</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">收件人:</label> <input
								name="bko_Name" type="text" class="form-control"
								id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">電話:</label> <input
								name="bko_Cel" type="tel" class="form-control"
								id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">送貨地址:</label>
							<textarea name="bko_Add" class="form-control" id="recipient-name"></textarea>
						</div>
					</div>
					<%-- 					${sessionScope.list} --%>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">確認</button>
					</div>
					${totalCart}
					<%-- 					${sessionScope.list} --%>
				</form>
			</div>
		</div>
	</div>
	<!-- 結帳後的資訊 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>