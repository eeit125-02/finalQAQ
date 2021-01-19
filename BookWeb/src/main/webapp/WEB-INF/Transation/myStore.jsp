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
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media">
		<form></form>
		<!-- body -->
		<form action="<c:url value='/addMyBook'/>" method="post">
			<button type="submit" class="btn btn-outline-info">我要賣東西</button>
			<br>
		</form>
	</div>
	<br>
	<div class="container">
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
					<input type="hidden" class="myImg" value="${v.book.bk_Pic}">
					<div class="row">
						<div class="col-lg-2">${v.bs_Date}</div>
						<div class="col-lg-2">${v.book.bk_Name}</div>
						<div class="col-lg-1">${v.book.bk_Author}</div>
						<div class="col-lg-1">${v.book.bk_Publish}</div>
						<div class="col-lg-2">${v.book.bk_Date}</div>
						<div class="col-lg-1">${v.bs_Price}</div>
						<div class="col-lg-1">${v.bs_Num}</div>
						<div class="col-lg-2">
							<button type="submit" value="${v.bks_ID}" name="waitupbk"
								class="btn btn-outline-info upda" data-toggle="modal"
								data-target="#exampleModalCenter">修改</button>
							<button type="submit" value="${v.bks_ID}" name="deletebk"
								onclick="deletebk(${v.bks_ID})" class="btn btn-outline-info">刪除</button>
							<%-- onclick="update(${v.bks_ID})"	onclick="delete(${v.bks_ID})" --%>
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
							style="height: 15rem; width: 10rem">
						<div class="card-body">
							<h5 class="card-title">${v.book.bk_Name}</h5>
							<p class="card-text Author">作者: ${v.book.bk_Author}</p>
							<p class="card-text Publish">出版社: ${v.book.bk_Publish}</p>
							<p class="card-text Date">出版日: ${v.book.bk_Date}</p>
							<form action="<c:url value='/updatebk'/>" method="post">
								<input type="hidden" name="updateBk" class="updateBk">
								<p class="card-text">
									二手價: <input type="number" class="bsPrice" name="bsPrice">
								</p>
								<p class="card-text" class="sp1" style="color: red"></p>
								<p class="card-text">
									數量: <input type="number" class="bsNum" name="bsNum">
								</p>
								<p class="card-text" class="sp2" style="color: red"></p>
								<button type="button" class="btn btn-outline-secondary"
									data-dismiss="modal">取消</button>
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
		$('.bsPrice').change(function() {
			let re = /[0-9]/gi;
			if ($('.bsPrice').val() < 1 || !re.test($('.bsPrice').val())) {
				$('.bsPrice').val(1)
			}
		})

		$('.bsNum').change(function() {
			let re = /[0-9]/gi;
			if ($('.bsNum').val() < 1 || !re.test($('.bsNum').val())) {
				$('.bsNum').val(1)
			}
		})

		$('.btn.btn-outline-info.upda').each(
				function() {
					$(this).click(
							function() {
								$('.card-img-top').attr(
										"src",
										$(this).parent().parent().prev().attr(
												"value"));
								$('.card-title').html(
										$(this).parent().parent().children()
												.eq(1).html());
								$('.card-text.Author').html(
										"作者: "
												+ $(this).parent().parent()
														.children().eq(2)
														.html());
								$('.card-text.Publish').html(
										"出版社: "
												+ $(this).parent().parent()
														.children().eq(3)
														.html());
								$('.card-text.Date').html(
										"出版日: "
												+ $(this).parent().parent()
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
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      'Deleted!',
				      'Your file has been deleted.',
				      'success'
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