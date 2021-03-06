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
		$("#bookWebheader").load("//eeit125g2.ddns.net:8080/BookWeb/header");
		$("#bookWebFooter").load("//eeit125g2.ddns.net:8080/BookWeb/footer");
	});
</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->
	<br>
	<div class="container media">
		<form></form>
		<!-- body -->
		<%-- 		<form action="<c:url value='/addMyStore'/>" method="post"> --%>
		<button type="button" class="btn btn-outline-info" id="turn">我要賣東西</button>
		<br>
		<!-- 		</form> -->
	</div>
	<br>
	<div class="container" id="search">
		<c:choose>
			<c:when test="${not empty myBookList}">

				<%-- 								<form action="<c:url value='/updateOrDelete'/>" method="post"> --%>
				<div class="row">
					<div class="col-lg-2">上架時間</div>
					<div class="col-lg-2">書名</div>
					<div class="col-lg-1">作者</div>
					<div class="col-lg-1">出版社</div>
					<div class="col-lg-2">出版日</div>
					<div class="col-lg-1">二手價</div>
					<div class="col-lg-1">數量</div>
					<div class="col-lg-2"></div>
				</div>
				<hr>
				<c:forEach var="v" items="${myBookList}">
					<input type="hidden" class="myImg" value="${v.bk_Pic}">
					<div class="row">
						<div class="col-lg-2">${v.bs_Date}</div>
						<div class="col-lg-2">${v.bk_Name}</div>
						<div class="col-lg-1">${v.bk_Author}</div>
						<div class="col-lg-1">${v.bk_Publish}</div>
						<div class="col-lg-2">${v.bk_Date}</div>
						<div class="col-lg-1">${v.bs_Price}</div>
						<div class="col-lg-1">${v.bs_Num}</div>
						<div class="col-lg-2">
							<button type="submit" value="${v.bks_ID}" name="waitupbk"
								class="btn btn-outline-info upda" data-toggle="modal"
								data-target="#exampleModalCenter">修改</button>
							<button type="submit" value="${v.bks_ID}" name="deletebk"
								onclick="deletebk(${v.bks_ID})" class="btn btn-outline-info">刪除</button>
						</div>
					</div>
					<input type="hidden" value="${v.bks_ID}">
					<hr>
				</c:forEach>
				<!-- 								</form> -->
			</c:when>
			<c:otherwise>
				<h1>您現在並無任何上架商品。</h1>
			</c:otherwise>
		</c:choose>
		<!-- 修改 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="card-center">
						<img class="card-img-top" alt="..."
							style="height: 20rem; width: 15rem; margin-left: 10rem; padding: 20px">
						<div class="card-body" style="padding: 25px">
							<form action="<c:url value='/updatebk'/>" method="post">
								<h4 class="card-title" style="text-align: center;">${v.bk_Name}</h4>


								<!--       <div class="modal-body"> -->
								<!--         <form> -->
								<!--           <div class="form-group"> -->
								<!--             <label for="recipient-name" class="col-form-label">書名</label> -->
								<%--             <input type="text" class="form-control" id="recipient-name"readonly="readonly" value="${v.bk_Author}"> --%>
								<!--           </div> -->
								<!--           <div class="form-group"> -->
								<!--             <label for="message-text" class="col-form-label">錯誤說明</label> -->
								<!--             <textarea class="form-control" id="message-text" name="report"></textarea> -->
								<!--           </div> -->
								<!--         </form> -->
								<!--       </div>							 -->

								<div class="form-group row">
									<label for="recipient-name" class="col-sm-2 col-form-label"
										style="text-align: center;">作者</label>
									<div class="col-sm-10">
										<input type="text" class="form-control Author"
											id="recipient-name" readonly="readonly"
											value="${v.bk_Author}">
									</div>
								</div>
								<div class="form-group row">
									<label for="recipient-name" class="col-sm-2 col-form-label"
										style="text-align: center;">出版社</label>
									<div class="col-sm-10">
										<input type="text" class="form-control Publish"
											id="recipient-name" readonly="readonly"
											value="${v.bk_Publish}">
									</div>
								</div>
								<div class="form-group row">
									<label for="recipient-name" class="col-sm-2 col-form-label"
										style="text-align: center;">出版日</label>
									<div class="col-sm-10">
										<input type="text" class="form-control Date"
											id="recipient-name" readonly="readonly" value="${v.bk_Date}">
									</div>
								</div>
								<div class="form-group row">
									<label for="recipient-name" class="col-sm-2 col-form-label"
										style="text-align: center;">二手價</label>
									<div class="col-sm-10">
										<input type="number" class="form-control bsPrice"
											id="recipient-name" name="bsPrice">
									</div>
								</div>
								<div class="form-group row">
									<label for="recipient-name" class="col-sm-2 col-form-label"
										style="text-align: center;">數量</label>
									<div class="col-sm-10">
										<input type="number" class="form-control bsNum" name="bsNum">
									</div>
								</div>

								<%-- 							<p class="card-text Author">作者: ${v.bk_Author}</p> --%>
								<%-- 							<p class="card-text Publish">出版社: ${v.bk_Publish}</p> --%>
								<%-- 							<p class="card-text Date">出版日: ${v.bk_Date}</p> --%>
								<input type="hidden" name="updateBk" class="updateBk">

								<!-- 								<p class="card-text"> -->
								<!-- 									二手價: <input type="number" class="bsPrice" name="bsPrice"> -->
								<!-- 								</p> -->
								<!-- 								<p class="card-text" class="sp1" style="color: red"></p> -->
								<!-- 								<p class="card-text"> -->
								<!-- 									數量: <input type="number" class="bsNum" name="bsNum"> -->
								<!-- 								</p> -->
								<p class="card-text" class="sp2" style="color: red"></p>
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal" style="margin-left: 10rem">取消</button>
								<button type="submit" class="btn btn-outline-success">儲存</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改 -->

		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
	//測試用
//載入前未使用foreach
// 	$('.form-control.num').change(function() {
// 					alert('lsm');
// 	})
//載入前使用each
// 	$('.form-control.num').each(function() {
// 		$(this).change(function() {
// 			alert("lsm");
// 		})
// 	})
	//測試用
	
	
		$('.bsPrice').change(function() {
			let re = /[0-9]/gi;
			if ($('.bsPrice').val() < 1 || !re.test($('.bsPrice').val())) {
				$('.bsPrice').val(1)
			}
		})
		
		$('#turn').click(function() {
			$('#search').load("//localhost:8080/BookWeb/addMyStore");
		})

		$('.bsNum').change(function() {
			let re = /[0-9]/gi;
			if ($('.bsNum').val() < 1 || !re.test($('.bsNum').val())) {
				$('.bsNum').val(1)
			}
		})

		$('.btn.btn-outline-info.upda').each(
				function() {
					var qaq = $(this)
					$(this).click(
							function() {
								$('.card-img-top').attr(
										"src",
										$(this).parent().parent().prev().attr(
												"value"));
								$('.card-title').html(
										$(this).parent().parent().children()
												.eq(1).html());
								$('.form-control.Author').val($(this).parent().parent()
														.children().eq(2)
														.html());
								$('.form-control.Publish').val($(this).parent().parent()
														.children().eq(3)
														.html());
								$('.form-control.Date').val($(this).parent().parent()
														.children().eq(4)
														.html());
								$('.bsPrice').val(
										$(this).parent().parent().children()
												.eq(5).html())
								$('.bsNum').val(
										$(this).parent().parent().children()
												.eq(6).html())
								$('.updateBk').val(
										$(this).parent().parent().next().val())
							})
				})
		
// 		$('.btn.btn-outline-success').each(function() {
// 			$(this).click(
// 					function() {
// 						document.forms[0].action="<c:url value='/deletebk?bks_ID=" + id + "' />" ;
// 			 			document.forms[0].method="post";
// 			 			document.forms[0].submit();
// 					}
// 		})

		function deletebk(id) {
			Swal.fire({
				  title: '你確定嗎?',
				  text: "你將無法復原!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '確定',
				  cancelButtonText: '取消'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      '已經刪除!',
				      '你上架的書籍已經刪除',
				      '成功'
				    ).then((result) => {
				    	document.forms[0].action="<c:url value='/deletebk?bks_ID=" + id + "' />" ;
			 			document.forms[0].method="post";
			 			document.forms[0].submit();
				    })
				  }
				})
		}
	</script>
</body>
</html>