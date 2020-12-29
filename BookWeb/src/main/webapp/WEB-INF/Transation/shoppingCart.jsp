<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>

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

	<div class="container media">
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
							<td width="280" align='center'><FONT size='+2'>某 會 員 的 購 物 車</FONT></td>
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
<c:forEach varStatus="vs" var="v"	items="${list}">

							<tr height='16'>
								<td>${v.book.bk_Name}</td>
								<td style="text-align: center;">${fn:substring(v.book.bk_Author, 0, 3)}</td>
								<td style="text-align: center;">${fn:substring(v.book.bk_Publish, 0, 2)}</td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${v.cart_Price }"
										pattern="#,###" />元</td>
								<td style="text-align: right;"><Input
									id="newQty${vs.index}" style="width: 28px; text-align: right"
									name="newQty" type="text"
									value="<fmt:formatNumber value="${v.cart_Num}" />"
									name="qty" onkeypress="return isNumberKey(event)" /></td>
								<td style="text-align: right;"><fmt:formatNumber
										value="${v.cart_Price * v.cart_Num}"
										pattern="#,###,###" />元</td>
								<td><button type="submit" name="updateCart" value="${v.cart_ID}"
								onclick="modify(${v.cart_ID}, ${v.cart_Num}, ${vs.index})"
								>修改</button>
									<button type="submit" name="deleteCart" value="${v.cart_ID}"
									onclick="confirmDelete(${v.cart_ID})">刪除</button></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan='5' align='right'>總計金額：</td>
							<td align='right'> ${totalCart} 元</td>
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
								href='<c:url value="/Transation/storeMain" />'>繼續購物</a>
							</td>
							<td width="400" align='center'>
							<a href="<c:url value='/checkout' />"
								onClick="return Checkout(${subtotal});">
								結帳
								</a>
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

		<!-- 內容 -->

		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>