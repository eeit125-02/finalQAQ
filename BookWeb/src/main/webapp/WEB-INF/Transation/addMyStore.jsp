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
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<!-- body -->
	<!-- 	我是測試線 -->
	<!-- 	我是測試線 -->
	<div class="container">
<%-- 		<form action="<c:url value='/searchBookName'/>" method="post"> --%>
			<div class="row">
				<div class="col-lg-4">
					<h2>請搜尋書名來新增!!!</h2>
				</div>
				<div class="input-group col-lg-5">
					<input type="text" class="form-control" name="searchbk" id="bkName"
						placeholder="請輸入書名"> <span class="input-group-btn">
						<button type="button" class="btn btn-outline-secondary" onclick="searchBookName()">
							<img alt="圖勒?" src='<c:url value="/image/qaqsearch.png" />'
								width="20px" height="20px">
						</button>
					</span>
				</div>
			</div>
<!-- 		</form> -->
	</div>
	<div class="container" >
	<div class="row" id="qaqResult">
	</div>
	</div>		
		<!-- body -->
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script type="text/javascript">
	
	function searchBookName() {
		$.ajax({
			async : false,
			type : 'GET',
			data : {qaqBookName : $('#bkName').val()} ,
			url : "Transation/qaqBookName",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			error : function() {
				alert("你做錯了喔!!!")
			},
			success : function(data) {
				console.log(data);
				var inserData = "";
				for(var i = 0; i < data.length; i++){
					inserData += "<div class=\"card col-sm-3\""
					+ " style=\"margin: 20px 40px; width: 500px; padding: 15px\">"
					+ "<form action=\"<c:url value='/addBook'/>\" method=\"post\">"
					+ "<input type=\"hidden\" name=\"qaqBkID\" value=\""+data[i].bk_ID+"\">"
					+ "<img src=\"<c:url value='" + data[i].bk_Pic + "' />\""
					+ " class=\"card-img-top\" alt=\"...\""
					+ " style=\"height: 18rem; width: 250px;\">"
					+ "<div class=\"card-body\">"
					+ "<span class=\"h5\"> " + data[i].bk_Name + "</span> <br> <span"
					+ " class=\"card-text\">作者: " + data[i].bk_Author + "</span> <br>"
					+ "<span class=\"card-text\">出版社: " + data[i].bk_Publish + "</span> <br>"
					+ "<span class=\"card-text\">出版日: " + data[i].bk_Date + "</span> <br>"
					+ "</div>"
					+ "<div class=\"form-group\">"
					+ "數量<input type=\"number\" class=\"form-control\" name=\"qtyNew\">"
					+ "價格<input type=\"number\" class=\"form-control\" name=\"priceNew\"><br>"
					+ "<button type=\"submit\" class=\"btn btn-outline-primary\">刊登</button>"
					+ "</div>"
					+ "</form>"
					+ "</div>"
				}
				$('#qaqResult').html(inserData);
			}
				
		})
	}
	
	</script>
</body>
</html>