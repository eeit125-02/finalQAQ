<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.web.book.model.*"
	import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
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

<title>閱讀履歷</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- 版主介紹 -->
	<div class="container media">
		<!-- <img src="..." class="align-self-start mr-3" alt="..."> -->
		<div class="media-body">
			<h4 class="mt-0 text-muted">會員名稱</h4>
			<h5 class="mt-0 text-muted">履歷名稱</h5>
			<p style="height: 100px;">簡介</p>
		</div>
	</div>
	<!-- 版主介紹 -->

	<!--功能列-->
	<nav class="container">
	
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-read-tab"
				data-toggle="tab" href="#nav-read" role="tab"
				aria-controls="nav-home" aria-selected="true">讀書心得</a> 
				
			<a	class="nav-item nav-link" id="nav-fav-tab" data-toggle="tab"
				href="#nav-fav" role="tab" aria-controls="nav-contact"
				aria-selected="false">收藏</a> <a class="nav-item nav-link"
				id="nav-com-tab" data-toggle="tab" href="#nav-com" role="tab"
				aria-controls="nav-contact" aria-selected="false">評論</a>
		</div>
	</nav>
	<!--功能列-->

	<!--功能列畫面-->
	<div class="container tab-content" id="nav-tabContent">
		<br>

		<!-- 閱讀心得 -->
		<div class="tab-pane fade show active" id="bookReportList" role="tabpanel" aria-labelledby="nav-read-tab">
		</div>
		<!-- 閱讀心得 -->

		<!-- 收藏 -->
		<div class="tab-pane fade" id="nav-fav" role="tabpanel"
			aria-labelledby="nav-fav-tab">
			<div class="row mb-2">
				<div class="col-md-6">
					<div class="card flex-md-row mb-4 shadow-sm h-md-250">
						<div class="card-body d-flex flex-column align-items-start">
							<h3 class="mb-0">
								<a class="text-dark" href="#">書名</a>
							</h3>
							<div class="mb-1 text-muted">日期</div>
							<p class="card-text mb-auto">大綱</p>
							<a href="#">閱讀全文</a>
						</div>
						<svg
							class="bd-placeholder-img card-img-right flex-auto  d-lg-block"
							width="200" height="250" xmlns="http://www.w3.org/2000/svg"
							preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
							aria-label="Placeholder: Thumbnail">
							<title>Placeholder</title>
							<rect fill="#55595c" width="100%" height="100%"></rect>
							<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text>
						</svg>
					</div>
				</div>
			</div>
		</div>
		<!-- 收藏 -->

		<!-- 評論 -->
		<div class="tab-pane fade" id="nav-com" role="tabpanel"
			aria-labelledby="nav-com-tab">
			<ul class="list-unstyled">
				<!-- <li class="media my-4"><img src="..." class="mr-3" alt="..."> -->
					<div class="media-body">
						<h5 class="mt-0 mb-1">使用者</h5>
						<label>書籍: </label><br> <label>評分</label><br>
						<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel
							metus scelerisque ante sollicitudin. Cras purus odio, vestibulum
							in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
							nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
					</div></li>
			</ul>
		</div>
		<!-- 評論 -->

	</div>
	<!--功能列畫面-->



	<!--編輯畫面-->
	<div class="modal" role="dialog" id="editModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">更改內容</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="media">
						<!-- <img id="BkPicE" src="" class="w-25 p-3" alt="..."> -->
						<div class="media-body">
							<h5 class="mt-0" id="BkNameE">書名：</h5>
							<p class="mt-0" id="BkWriterE">作者：</p>
							<p class="mt-0" id="BkPublishE">出版社：</p>
							評分：<select name="BrScore1">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>分
						</div>
					</div>
					<label for="message-text" class="col-form-label">心得:</label>
					<textarea class="form-control" id="BrContentE"
						style="height: 350px;" name="BrContent1"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" id="editButton"
						name="editButton" value="edit">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!--編輯畫面-->


	<!--刪除確認-->
	<div class="modal" id="deletModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">確認</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>確認是否要刪除心得</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" id="deleteSecond" data-dismiss="modal" name="beleteButton" value="123">Yes</button>
					<button type="button" class="btn btn-link" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
	<!--刪除確認-->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script>
	
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
        window.onload = loadBookReportList();
        
		function deleteReport(){
			var lastValue = true;
			$('#deleteSecond').click(function(){
				console.log($(this).val());
				if (lastValue){					
					var deleteURL = "deleteBookReport/" + $(this).val();
					$.ajax({
						async : true,
						type : 'POST',
						url : "<c:url value='/"+deleteURL+"'/>",
						dataType : "json",
						contentType : "application/json;charset=utf-8",
						success : function(data) {
							console.log(data);
							loadBookReportList();
							lastValue = false
						}
					});
				}
			})
		}
		
			

		function loadBookReportList(){
			
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : "<c:url value='/getBookReportList'/>",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
					alert('123 ');
				},
				success : function(data) {
					var insertData = "<div class=\"row\">";
					for (let i = 0; i < data.length; i++) {
						insertData +=	"<div class=\"col-md-4\">"
									+	"<div class=\"card mb-4 shadow-sm \">"
									+	"<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\" height=\"250\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\" aria-label=\"Placeholder: Thumbnail\">"
									+	"<image xlink:href=\""+data[i].bk_Pic+"\" width=\"100%\" height=\"100%\" />"
									+	"</svg>"
									+	"<div class=\"card-body\">"
									+	"<p class=\"card-text\">"+data[i].bk_Name+"</p>"
									+	"<p class=\"card-text\">作者："+data[i].bk_Author+"</p>"
									+	"<p class=\"card-text\">評分："+data[i].br_Score+"</p>"
									+	"<div class=\"d-flex justify-content-between align-items-center\">"
									+	"<div class=\"btn-group\">"
									+	"<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\" data-toggle=\"modal\" data-target=\"#editModal\" id=\"editFirst\" name=\"editButtons\" value=\""+data[i].br_ID+"\">Edit</button>"
									+	"<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\" data-toggle=\"modal\" data-target=\"#deletModal\" id=\"deleteFirst\" name=\"beleteButtons\" value=\""+data[i].br_ID+"\">Delete</button>"
									+	"</div>"
									+	"<small class=\"text-muted\">創建日期：<br>"+data[i].br_DateTime+"</small>"
									+	"</div>"
									+	"</div>"
									+	"</div>"
									+	"</div>"
					}
					insertData += "</div>"
					$('#bookReportList').html(insertData);
				}
			});
			$('.btn-outline-secondary').click(function(){
				console.log("1"+$(this).val());
				lastValue = true
				$('#deleteSecond').val($(this).val());
				deleteReport();
			})
		
		};
	</script>
</body>
</html>