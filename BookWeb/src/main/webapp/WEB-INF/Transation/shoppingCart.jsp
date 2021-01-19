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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<script src="https://use.fontawesome.com/c560c025cf.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
</style>



<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<!-- body -->
	<!--測試用 -->
	<div class="container">
		<div class="card shopping-cart">
			<div class="card-header bg-dark text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i>
				${loginUser.mb_Name} 的 購 物 車
				<%-- 				<a href='<c:url value="/qaqTest" />' --%>
				<!-- 					class="btn btn-outline-info btn-sm pull-right"> 繼 續 購 物 </a> -->
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<!-- PRODUCT -->
				<c:forEach items="${listCart}" var="v">
					<%-- 							<form action="<c:url value='/deleteCart'/>" method="post"> --%>
					<%-- 				 action='<c:url value="/deleteCart"/>'  --%>
					<div class="row">
						<div class="col-12 col-sm-12 col-md-2 text-center">
							<img class="img-responsive" src="${v.book.bk_Pic}" alt="prewiew"
								width="120" height="80">
						</div>
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-3">
							<h4 class="product-name">
								<strong> 書名 </strong>
							</h4>
							<h4>
								<small>${v.book.bk_Name}</small>
							</h4>
						</div>
						<!-- 						測試 -->
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-3">
							<h4 class="product-name">
								<strong> 賣家 </strong>
							</h4>
							<h4>
								<small>${v.memberSel.mb_Account}</small>
							</h4>
						</div>
						<!-- 						測試 -->
						<div
							class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
							<div class="col-3 col-sm-3 col-md-6 text-md-right"
								style="padding-top: 5px">
								<h6>
									<strong id="carPrice">${v.cart_Price} <span
										class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-4 col-sm-4 col-md-4">
								<div class="quantity">
									<input type="button" value="+" class="plus"> <input
										id="carNum" type="number" step="1" max="99" min="1"
										value="${v.cart_Num}" title="Qty" class="qty" size="4">
									<input type="button" value="-" class="minus">
								</div>
								<!-- 								測試區 -->
								<input type="hidden" class="result"
									value="${v.cart_Num*v.cart_Price}">
								<!-- 								測試區 -->
							</div>
							<div class="col-2 col-sm-2 col-md-2 text-right">

								<!-- 								<button type="submit" class="btn btn-outline-danger btn-xs"  -->
								<button type="button" class="btn btn-outline-danger btn-xs"
									id="qaq" name="cart_ID" value="${v.cart_ID}">
									<%-- 								id="qaq" name="cart_ID" value="${v.cart_ID}" onclick="confirmDelete(${v.cart_ID})"> --%>
									<i class="fa fa-trash" aria-hidden="true"></i>
								</button>

							</div>
						</div>
					</div>
					<hr>
					<!-- 							</form> -->
				</c:forEach>
				<!-- END PRODUCT -->
				<div class="pull-right">
					<a href="" class="btn btn-outline-secondary pull-right"> Update
						shopping cart </a>
				</div>
			</div>
			<div class="card-footer">
				<div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
					<div class="row">
						<div class="col-6">
							<a href='<c:url value="/qaqTest" />'
								class="btn btn-outline-info btn-sm pull-left"> 繼 續 購 物 </a>
							<!-- 							<input type="text" class="form-control" placeholder="cupone code"> -->
						</div>
						<div class="col-6">
							<!-- 							<input type="submit" class="btn btn-default" value="Use cupone"> -->
						</div>
					</div>
				</div>
				<div class="pull-right" style="margin: 10px">
					<!-- 						<a href="" class="btn btn-success pull-right" > 結 帳  </a> -->
					<button type="button" class="btn btn-primary pull-right"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="@mdo">結帳</button>
					<div class="pull-right" style="margin: 5px">
						Total price: <b id="total">0</b>
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
					<%-- 					${totalCart} --%>
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
	<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
		$('.result').each(function(){
			$(this).prev().children("input").eq(1).change(function(){
				let stay = $(this);
				let varNum=$(this).val();
				let itemPrice = $(this).parents("div").eq(1).prev().children("h6").eq(0).children("strong").eq(0).html().split(" \<span")[0];
				let totalPrice = parseInt(itemPrice)*parseInt(varNum);
				stay.parent().next().val(totalPrice)
				setTotalMoney();
			})
			$(this).prev().children("input").eq(0).click(function() {
				let stay1 = $(this).next();
				let varNum1 = $(this).next().val();
				$(this).next().val(parseInt($(this).next().val())+1);
				let itemPrice1 = $(this).parents("div").eq(1).prev().children("h6").eq(0).children("strong").eq(0).html().split(" \<span")[0];
				let totalPrice1 = parseInt(itemPrice1)*parseInt(varNum1);
				stay1.parent().next().val(totalPrice1)
				setTotalMoney();
			})
			$(this).prev().children("input").eq(2).click(function() {
				let stay2 = $(this).prev();
				let varNum2 = $(this).prev().val();
				$(this).prev().val(parseInt($(this).prev().val())-1);
				let itemPrice2 = $(this).parents("div").eq(1).prev().children("h6").eq(0).children("strong").eq(0).html().split(" \<span")[0];
				let totalPrice2 = parseInt(itemPrice2)*parseInt(varNum2);
				stay2.parent().next().val(totalPrice2)
				setTotalMoney();
			})
		})
		setTotalMoney();
	});
	function setTotalMoney(){
		let total = 0;
		$('.result').each(function(){
			total+=parseInt($(this).val());
		})
		$('#total').html(total);
	}
	
// 	$('.btn.btn-outline-danger.btn-xs').click(function() {
		
// 		Swal.fire({
// 			  title: 'Are you sure?',
// 			  text: "You won't be able to revert this!",
// 			  icon: 'warning',
// 			  showCancelButton: true,
// 			  confirmButtonColor: '#3085d6',
// 			  cancelButtonColor: '#d33',
// 			  confirmButtonText: 'Yes, delete it!'
// 		}).then((result) => {
// 			  if (result.isConfirmed) {
// 			    Swal.fire(
// 			      'Deleted!',
// 			      'Your file has been deleted.',
// 			      'success'
// 				).then((result) => {
			    	
// 			    })
// 			  }
// 		})
// 	}
// 	)
	
	
	
// 	$('.plus').click(function() {
// 		$(this).next().val(parseInt($(this).next().val())+1);
// 	})
// 	$('.minus').click(function() {
// 		$(this).prev().val(parseInt($(this).prev().val())-1);
// 	})
	
</script>
</body>
</html>