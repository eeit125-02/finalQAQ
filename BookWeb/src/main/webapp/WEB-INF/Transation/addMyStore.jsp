<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.book.model.BookStoreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
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
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->
	<!-- body -->
	<!-- 	我是測試線 -->
	<!-- 	我是測試線 -->
	<br>
	<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h2>請輸入要上架的書名</h2>
				</div>
				<div class="input-group col-lg-5">
					<input type="text" class="form-control test" name="searchbk" id="bkName"
						placeholder="請輸入書名"> <span class="input-group-btn">
						<button type="button" class="btn btn-outline-secondary" onclick="searchBookName()"
						data-container="body" data-toggle="popover" data-placement="bottom" data-content="不可以空白和含有特殊符號">
							<img alt="圖勒?" src='<c:url value="/image/qaqsearch.png" />'
								width="20px" height="20px">
						</button>			
					</span>
				</div>
				<div class=col-lg-3>
					<button type="button" class="btn btn-outline-dark" id="yepData">有資料</button>
					<button type="button" class="btn btn-outline-dark" id="noData">無資料</button>
				</div>
			</div>
	</div>
	<br>
	<div class="container" >
		<div class="row" id="qaqResult">
		</div>
	</div>
<!-- 分頁顯示測試線 -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-sm-4"></div> -->
<!-- 		<div class="col-sm-8"> -->
<!-- 			<nav aria-label="Page navigation example"> -->
<!-- 				<ul class="pagination" id = "pageDisplay"> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 分頁顯示測試線 -->
		<!-- body -->
	<!-- footer -->
<!-- 	<footer class="container py-5" id="bookWebFooter"></footer> -->
	<!-- footer -->
	<script type="text/javascript">
	
	$('#noData').click(function () {
		$('#bkName').val("Spring in Action");
	})
	$('#yepData').click(function() {
		$('#bkName').val("程式")
	})

	function searchBookName() {
		let bkName = document.getElementById("bkName");
		let bkNameVal = bkName.value;
		let re2 = /[!@#$%^&*]/gi;
		if( bkNameVal.trim().length == 0 || re2.test(bkNameVal) ){
			Swal.fire({
				  position: 'top-center',
				  icon: 'warning',
				  title: '不可輸入空白及特殊符號',
				  showConfirmButton: false,
				  timer: 1000
				})
		}else{
		$.ajax({
			async : false,
			type : 'GET',
			data : {qaqBookName : $('#bkName').val()} ,
			url : "Transation/addMyStore",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			error : function() {
				alert("你做錯了喔!!!")
			},
			success : function(data) {
				var innerHtml = "";
				var insertData = "";
				if(data.pageSize != 0){
// 					if(data.pageNow != 1){
// 						innerHtml += "<li class=\"page-item\"><a class=\"page-link\""
// 						+ "href=\"<c:url value='/addMyStore?pageType="+data.pageType+"&pageNow=1'/>\""
// 						+ "aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span>"
// 						+ "</a></li>"
// 						+ "<li class=\"page-item\"><a class=\"page-link\""
// 						+ "href=\"<c:url value='/addMyStore?pageType="+data.pageType+"&pageNow="+(data.pageNow - 1)+"'/>\">"
// 						+ "${pageNow-1} </a></li>"
// 					}
// 					innerHtml += "<li class=\"page-item\"><a class=\"page-link\"> "+data.pageNow+""
// 						+ "</a></li>"
// 					if(data.pageNow != data.pageSize){
// 						innerHtml += "<li class=\"page-item\"><a class=\"page-link\""
// 						+ "href=\"<c:url value='/addMyStore?pageType="+data.pageType+"&pageNow="+(data.pageNow + 1)+"'/>\">"
// 						+ ""+(data.pageNow + 1)+" </a></li>"
// 						+ "<li class=\"page-item\"><a class=\"page-link\""
// 						+ "href=\"<c:url value='/addMyStore?&pageType="+data.pageType+"&pageNow="+data.pageSize+"'/>\""
// 						+ "aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span>"
// 						+ "</a></li>"
// 					}
// 					$('#pageDisplay').html(innerHtml);
					
					for(var i = 0; i < data.searchData.length; i++){
						insertData += "<div class=\"card col-sm-3\""
						+ " style=\"margin: 20px 40px; width: 500px; padding: 15px\">"
						+ "<form action=\"<c:url value='/addBook'/>\" method=\"post\">"
						+ "<input type=\"hidden\" name=\"qaqBkID\" value=\""+data.searchData[i].bk_ID+"\">"
						+ "<img src=\"<c:url value='" + data.searchData[i].bk_Pic + "' />\""
						+ " class=\"card-img-top\" alt=\"...\""
						+ " style=\"height: 18rem; width: 250px;\">"
						+ "<div class=\"card-body\">"
						+ "<span class=\"h5\"> " + data.searchData[i].bk_Name + "</span> <br> <span"
						+ " class=\"card-text\">作者: " + data.searchData[i].bk_Author + "</span> <br>"
						+ "<span class=\"card-text\">出版社: " + data.searchData[i].bk_Publish + "</span> <br>"
						+ "<span class=\"card-text\">出版日: " + data.searchData[i].bk_Date + "</span> <br>"
						+ "</div>"
						+ "<div class=\"form-group\">"
						+ "數量<input type=\"number\" class=\"form-control num\" name=\"qtyNew\">"
						+ "價格<input type=\"number\" class=\"form-control pce\" name=\"priceNew\"><br>"
						+ "<button type=\"submit\" class=\"btn btn-outline-primary\">刊登</button>"
						+ "</div>"
						+ "</form>"
						+ "</div>"
					}
					$('#qaqResult').html(insertData);
				} else{
					insertData += "<div class=\"col-sm-4\"></div>"
						+"<h1 class=\"col-sm-8\">查無資料"
						+ "請按此<a href=\"<c:url value='/addMyBookA'/>\">新增</a></h1>"
					$('#qaqResult').html(insertData);				
				}
			}
			
		})
		$('.form-control.num').change(function() {
			var qty = $(this);
			if($(this).val() < 0){
				Swal.fire({
					  position: 'top-center',
					  icon: 'warning',
					  title: '您輸入的值不能小於1',
					  showConfirmButton: false,
					  timer: 1000
					}).then((result) =>{
						qty.val(1);
					})
			}
		})
		$('.form-control.pce').change(function() {
			var price = $(this);
			if($(this).val() < 0){
				Swal.fire({
					  position: 'top-center',
					  icon: 'warning',
					  title: '您輸入的值不能小於1',
					  showConfirmButton: false,
					  timer: 1000
					}).then((result) =>{
						price.val(1);
					})
			}
		})
	}
	}
// 				$('.form-control.num').change(function() {
// 					alert('lsm');
// 				})
				
	
	</script>
</body>
</html>