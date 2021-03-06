<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<script src="${pageContext.request.contextPath}/js/jQuery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jQuery/jquery.cookie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

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
.p-width {

	max-width: 400px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;

}

</style>

<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->

	<br>
	<div class="container media">
		<!-- body -->
		<div class="row">

			<!-- Blog Entries Column -->

			<div class="col-md-8">
				<!-- <h1 class="my-4">
					  搜尋結果：<small>分類</small>
				</h1> -->

				<div id="searchList">
					
				</div>
				

				<!-- Pagination -->
				  <ul class="pagination justify-content-center mb-4" id="pageButton">
				    <!-- <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li> -->
				  </ul>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">搜尋</h5>
					<div class="card-body">
						<div class="input-group">
							<input id="searchValue" type="text" class="form-control" placeholder="Search for..."> 
							<span class="input-group-append">
						
								<form id="searchForm" method='get' action="">
									<button id="searchButton" class="btn btn-secondary" type="submit">Go!</button>
								</form>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">分類</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/文學創作/1">文學創作</a></li>
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/圖文漫畫/1">圖文漫畫</a></li>
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/商業/1">商業</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/生活/1">生活</a></li>
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/旅遊/1">旅遊</a></li>
									<li><a href="http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/學習/1">學習</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">熱門標籤</h5>
					<div class="card-body">
						<button type="button" class="btn btn-primary mb-2">詩</button>
						<button type="button" class="btn btn-secondary mb-2">小說</button>
						<button type="button" class="btn btn-success mb-2">理財</button>
						<button type="button" class="btn btn-danger mb-2">工具書</button>
						<button type="button" class="btn btn-warning mb-2">考用</button>
						<button type="button" class="btn btn-info mb-2 ">醫療</button>
						<button type="button" class="btn btn-light mb-2">翻譯文學</button>
						<button type="button" class="btn btn-dark mb-2">療癒小說</button>
						<button type="button" class="btn btn-primary mb-2">散文</button>
						<button type="button" class="btn btn-secondary mb-2">投資</button>
						<button type="button" class="btn btn-success mb-2">學習</button>
						<button type="button" class="btn btn-danger mb-2">科幻</button>
						<button type="button" class="btn btn-warning mb-2">台灣旅遊</button>
						<button type="button" class="btn btn-info mb-2">管理學</button>
					</div>
				</div>

			</div>

		</div>
		<!-- body -->
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script>
		$(document).ready(function(){
			$("#bookWebheader").load("//eeit125g2.ddns.net:8080/BookWeb/header");
			$("#bookWebFooter").load("//eeit125g2.ddns.net:8080/BookWeb/footer");
			page();			
		});
		
		
		function page(){
			
			var searchURL = window.location.href.split("/");
			
			var page = searchURL.pop().replace("?", "");
			var type = decodeURI(searchURL.pop());
			
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport" + "/serchBookReportPage",
				data : {searchType:type, searchPage:page},
				dataType : "json",
				error : function() {
					alert('123 ');
				},
				success : function(data) {
					var innerHtml = "";
					var insertData = "";
					if(data.pageSize != 0){
						if(data.searchPage != 1){						
							innerHtml += "<li class=\"page-item\">"
							 		  + " <a class=\"page-link\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+data.searchType+"/"+ (data.searchPage - 1)+"\" aria-label=\"Previous\">"
									  + "<span aria-hidden=\"true\">&laquo;</span>"
									  + "</a>"
									  + "</li>"
							innerHtml += "<li class=\"page-item \"><a class=\"page-link\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+data.searchType+"/"+ (data.searchPage - 1)+"\">"+ (data.searchPage - 1) +"</a></li>"
						}
						
						    
						innerHtml += "<li class=\"page-item active\"><a class=\"page-link\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+data.searchType+"/"+ data.searchPage +"\">"+ data.searchPage +"</a></li>"
						
						if(data.searchPage != data.pageSize){						
							innerHtml += "<li class=\"page-item \"><a class=\"page-link\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+data.searchType+"/"+ (data.searchPage + 1) +"\">"+ (data.searchPage + 1) +"</a></li>"
							innerHtml += "<li class=\"page-item\"></li>"
									  + "<a class=\"page-link\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+data.searchType+"/"+ (data.searchPage + 1)+"\" aria-label=\"Next\">"
									  + "<span aria-hidden=\"true\">&raquo;</span>"
									  + "</a>"
									  + "</li>"
						}
						
						$('#pageButton').html(innerHtml)
						
						
						
						for (let i = 0; i < data.searchData.length; i++) {
							if (data.searchData[i].bk_Publish == null){
								data.searchData[i].bk_Publish = ""
							}
							insertData +=	"<div class=\"card mb-4\">"
									    + 	"<div class=\"row g-0\">"
									    + 	"<img class=\"ml-4 mt-3\" width=\"130px\" height=\"200px\" src=\""+ data.searchData[i].bk_Pic+ "\">"
									    + 	"<div class=\"col-md-8\">"
									    + 	"<div class=\"card-body\">"
									    + 	"<h4 class=\"card-title\">"
									    +	"<a class=\"\" href=\"http://eeit125g2.ddns.net:8080/BookWeb/BookReport/"+data.searchData[i].br_ID+"\">"+data.searchData[i].br_Name+"</a>"
									    +	"</h4>"
									   	+	"<p class=\"card-title \"> 撰寫者："+ data.searchData[i].loginUser + "</p>"
									   	+   "<p class=\"card-text \"> 撰寫日期：" + data.searchData[i].br_DateTime+ "</p>"
									    + 	"<div>"
									    + 	"<p class=\"card-text mb-1 p-width \"> 書名："+data.searchData[i].bk_Name+ "</p>"
									    +	"<p class=\"card-text mb-1 p-width \"> 作者："+data.searchData[i].bk_Author+ "</p>"
									    +	"<p class=\"card-text mb-1\"> 出版社："+data.searchData[i].bk_Publish+ "</p>"
									    + 	"</div>"
									    + 	"<div class=\"d-flex justify-content-between align-items-center\">"
									    + 	"</div>"
									    + 	"</div>"
									    + 	"</div>"
									    + 	"</div>"
									    + 	"</div>"
						}
					}else{
						insertData = "<h1 class=\"my-4\">無資料</h1>"
					}
					$('#searchList').html(insertData);
					
				}
			});
		};
		
		$('#searchButton').click(function(){
			
			if($('#searchValue').val() == ""){
				$('#searchForm').attr({"action":"//eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/all/1"})
			}else{
				$('#searchForm').attr({"action":"//eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/"+ $('#searchValue').val() + "/1"})
			}
			
		});

	</script>

</body>
</html>