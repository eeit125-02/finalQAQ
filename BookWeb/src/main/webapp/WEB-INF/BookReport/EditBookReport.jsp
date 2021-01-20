<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-3.5.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery.cookie.js"></script>
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
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.rateyo.css"/>
<script src="${pageContext.request.contextPath}/js/jquery.rateyo.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.messageSize{
	 font-size: 20px;
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
		<div class="media-body">
			<h2 class="mt-0" id="memberName">閱讀履歷管理</h2>
			<br>
		</div>
	</div>
	<!-- 版主介紹 -->

	<!--功能列-->
	<nav class="container">

		<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active messageSize" id="nav-read-tab"
				data-toggle="tab" href="#bookReportList" role="tab"
				aria-controls="nav-home" aria-selected="true">讀書心得</a> 
			<a class="nav-item nav-link messageSize" id="nav-fav-tab" data-toggle="tab"
				href="#nav-fav" role="tab" aria-controls="nav-contact"
				aria-selected="false">收藏</a> 
			<a class="nav-item nav-link messageSize"
				id="nav-com-tab" data-toggle="tab" href="#nav-com" role="tab"
				aria-controls="nav-contact" aria-selected="false">評論</a>
		</div>
	</nav>
	<!--功能列-->

	<!--功能列畫面-->
	<div class="container tab-content" id="nav-tabContent">
		<br>

		<!-- 閱讀心得 -->
		<div class="tab-pane fade show active" id="bookReportList"
			role="tabpanel" aria-labelledby="nav-read-tab"></div>
		<!-- 閱讀心得 -->

		<!-- 收藏 -->
		
		<div class="tab-pane fade" id="nav-fav" role="tabpanel"
			aria-labelledby="nav-fav-tab">
			<div class="row mb-2" id="collectReport">
			
			    <div class="col-md-6">
			      <div class="card flex-md-row mb-4 shadow-sm h-md-250">
			        <div class="card-body d-flex flex-column align-items-start">
			          <h3 class="mb-0">
			            <a class="text-dark" href="#">圖書標題</a>
			          </h3>
			          <div class="mb-1 text-muted">撰寫者：test, 創建日期：Nov 12</div>
			          <div id="rateYo"></div>
			          <br>
			          <p class="card-text mb-auto">書名</p>
			          <p class="card-text mb-auto">作者</p>
			          <p class="card-text mb-auto">出版社</p>
			          <br>
			          <a href="#">取消追蹤</a>
			        </div>
			        <svg class="bd-placeholder-img card-img-right flex-auto d-none d-lg-block" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
			        	<image xlink:href="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/088/03/0010880353.jpg&v=5fe9b3ba&w=348&h=348" width="100%" height="100%" />
			        </svg>
			      </div>
			    </div>
			    
			    <div class="col-md-6">
			      <div class="card flex-md-row mb-4 shadow-sm h-md-250">
			        <div class="card-body d-flex flex-column align-items-start">
			          <h3 class="mb-0">
			            <a class="text-dark" href="#">圖書標題</a>
			          </h3>
			          <div class="mb-1 text-muted">撰寫者：test, 創建日期：Nov 12</div>
			          <div id="rateYo"></div>
			          <br>
			          <p class="card-text mb-auto">書名</p>
			          <p class="card-text mb-auto">作者</p>
			          <p class="card-text mb-auto">出版社</p>
			          <br>
			          <a href="#">取消追蹤</a>
			        </div>
			        <svg class="bd-placeholder-img card-img-right flex-auto d-none d-lg-block" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
			        	<image xlink:href="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/088/03/0010880353.jpg&v=5fe9b3ba&w=348&h=348" width="100%" height="100%" />
			        </svg>
			      </div>
			    </div>
			    
			    <div class="col-md-6">
			      <div class="card flex-md-row mb-4 shadow-sm h-md-250">
			        <div class="card-body d-flex flex-column align-items-start">
			          <h3 class="mb-0">
			            <a class="text-dark" href="#">圖書標題</a>
			          </h3>
			          <div class="mb-1 text-muted">撰寫者：test, 創建日期：Nov 12</div>
			          <div id="rateYo"></div>
			          <br>
			          <p class="card-text mb-auto">書名</p>
			          <p class="card-text mb-auto">作者</p>
			          <p class="card-text mb-auto">出版社</p>
			          <br>
			          <button type="button" class="btn btn-outline-danger"  value="" id="deletSub" >取消收藏</button>
			        </div>
			        <svg class="bd-placeholder-img card-img-right flex-auto d-none d-lg-block" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
			        	<image xlink:href="https://im2.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/088/03/0010880353.jpg&v=5fe9b3ba&w=348&h=348" width="100%" height="100%" />
			        </svg>
			      </div>
			    </div>
			    
			</div>
		</div>
		<!-- 收藏 -->

		<!-- 評論 -->
		<div class="tab-pane fade" id="nav-com" role="tabpanel"
			aria-labelledby="nav-com-tab">
			<ul class="list-unstyled ml-5" id="message">
			  <li class="media my-4">
			    <img src="https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/088/07/0010880768.jpg&v=5feda83c&w=348&h=348" class="mr-3" width="150px">
			    <div class="media-body">
			      <h5 class="mt-0 mb-1"><a class="text-dark" href="#">圖書標題</a></h5>
			      <p>留言日期：</p>
			      <label class="mr-4">書名：</label><label class="ml-4">作者：</label>
			      <div class="btn-toolbar justify-content-between btn-sm">
			       	<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque</p>
			       	<div class="input-group">
			       		<button id="deleteMessage" type="button" class="btn btn-outline-danger mr-4 md-3">刪除</button>
			       	</div>
			      </div>
			    </div>
			  </li>
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
						<img id="bk_Pic" src="" class="w-25 p-3" alt="...">
						<div class="media-body">
							<h5 class="mt-0" id="bk_Name">書名：</h5>
							<br>
							<p class="mt-0 messageSize" id="bk_Author">作者：</p>
							<p class="mt-0 messageSize" id="bk_Publish">出版社：</p>
							<p class="mt-0 messageSize" id="bk_Author">作者：</p>
							<p class="mt-0 messageSize" id="bk_DataTime">撰寫日期：</p>
							評分：<div id="rateYoEdit"></div>
						</div>
					</div>
					<label for="message-text" class="col-form-label">心得:</label>
					<textarea class="form-control" id="br_Content"
						style="height: 350px;" name="BrContent1"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="editButton"
						name="editButton" data-dismiss="modal" value="edit">Save
						changes</button>
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
					<p id="deleteInfo">確認是否要刪除心得</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" id="deleteSecond"
						data-dismiss="modal">Yes</button>
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
		
		let brScore = 0;
		var editor;
		
		$(document).ready(function() {
			
			$("#bookWebheader").load("//localhost:8080/BookWeb/header");
			$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
			
			loadBookReportList();
			loadCollectReport();
			loadReportMessageList();
			
			
		});
		
		var $rateYo = $("#rateYoEdit").rateYo({
			rating: 0.0,
			fullStar: true,
		    spacing: "10px"
		});
		
		
		$('#deleteSecond').click(function() {
			if($('#deleteInfo').html() == "是否要刪除心得"){
				deleteReport($(this).val());			
			}
			if($('#deleteInfo').html() == "是否要取消收藏"){
				
				deleteCollect($(this).val());
			}
			
		});

		$('#editButton').click(function() {
			
			var editData = {
				br_ID : $(this).val(),
				br_Score : $rateYo.rateYo("rating"),
				br_Content : editor.getData()
			};
			var editURL = location.href + "/upDateBookReport";
			$.ajax({
				async : true,
				type : 'POST',
				url : editURL,
				data : editData,
				dataType : "json",
				success : function(data) {
					if (data) {
						$('#bookReportList').html("test");
						loadBookReportList();
					}
				}
			});
		});
		
		function deleteCollect(rc_ID) {
			var deleteURL = location.href + "/deleteCollectReport/" + rc_ID;
			$.ajax({
				async : false,
				type : 'POST',
				url : deleteURL,
				dataType : "json",
				success : function(data) {
					console.log(data)
					if (data) {
						loadCollectReport();
					}
				}
			});
		};

		function deleteReport(br_ID) {
			var deleteURL = location.href + "/deleteBookReport/" + br_ID;
			$.ajax({
				async : false,
				type : 'POST',
				url : deleteURL,
				dataType : "json",
				success : function(data) {
					if (data) {
						loadBookReportList();
					}
				}
			});
		};
		
		function loadCollectReport(){
			$.ajax({
				async : false,
				type : 'POST',
				url : location.href + "/getMemberCollectReport",
				type : 'POST',
				dataType : "json",
				success : function(data){
					var inserData = "";
					for(var i = 0; i < data.length; i++){						
						inserData += "<div class=\"col-md-6\">"
								  	+ "<div class=\"card flex-md-row mb-4 shadow-sm h-md-250\">"
								  	+ "<div class=\"card-body d-flex flex-column align-items-start\">"
						      	  	+ "<h3 class=\"mb-0\">"
						      	  	+ "<a class=\"text-dark \" href=\"http://localhost:8080/BookWeb/BookReport/"+ data[i].brId +"\">"+ data[i].brName +"</a>"
								  	+ "</h3>"
									+ "<div class=\"mb-1 text-muted\">"
									+ "撰寫者："+ data[i].mbAccount
									+ "</div>"
									+ "<div class=\"mb-1 text-muted\">"
									+ "創建日期："+ data[i].brDate
									+ "</div>"
									+ "<div id=rateYo"+ data[i].rcId +"></div>"
									+ "<br>"
									+ "<p class=\"card-text mb-auto\">書名："+ data[i].bkName +"</p>"
									+ "<p class=\"card-text mb-auto\">作者："+ data[i].bkAuthor +"</p>"
									+ "<p class=\"card-text mb-auto\">出版社："+ data[i].bkPublish +"</p>"
									+ "<br>"
									+ "<button type=\"button\" class=\"btn btn-outline-danger\"  data-toggle=\"modal\" data-target=\"#deletModal\" id=\"deletSub\" value=\""+ data[i].rcId +"\" >取消收藏</button>"
									+ "</div>"
									+ " <svg class=\"bd-placeholder-img card-img-right flex-auto d-none d-lg-block mr-4 mt-4\" width=\"150\" height=\"250\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\" aria-label=\"Placeholder: Thumbnail\">"
									+ "<image xlink:href=\""+ data[i].bkPic +"\"width=\"100%\" height=\"100%\"/>"
									+ "</svg>"
									+ "</div>"
									+ "</div>"
					}
					$('#collectReport').html(inserData);
					
					for(var i = 0; i < data.length; i++){	
						$("#rateYo"+ data[i].rcId).rateYo({
							rating: data[i].brScore,
						    spacing: "5px",
						    starWidth: "20px",
						    readOnly: true
						});
					}				
				}
			});
			
			$(".btn-outline-danger").click(function(){
				$('#deleteInfo').html("是否要取消收藏");
				$('#deleteSecond').val($(this).val());
				console.log($('#deleteInfo').html());
			});	
		}
		
		function loadBookReportList() {
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : location.href + "/getBookReportList",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
					alert('123 ');
				},
				success : function(data) {
					var insertData = "<div class=\"row\">";
					for (let i = 0; i < data.length; i++) {
						insertData += "<div class=\"col-md-4\">"
								+ "<div class=\"card mb-4 shadow-sm \">"
								+ "<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\" height=\"250\" xmlns=\"http://www.w3.org/2000/svg\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\" role=\"img\" aria-label=\"Placeholder: Thumbnail\">"
								+ "<image xlink:href=\""
								+ data[i].bk_Pic
								+ "\" width=\"100%\" height=\"100%\" />"
								+ "</svg>"
								+ "<div class=\"card-body\">"
								+ "<p class=\"card-text ellipsis messageSize\">"
								+ data[i].bk_Name
								+ "</p>"
								+ "<p class=\"card-text messageSize\">作者："
								+ data[i].bk_Author
								+ "</p>"
								+ "<div class=\"form-inline\">"
								+ "<label class=\"card-text messageSize\">評分："
								+ "<div id=rateYo"+ data[i].br_ID +"></div>"
								+ "</label>"
								+ "</div>"
								+ "<br>"
								+ "<div class=\"d-flex justify-content-between align-items-center\">"
								+ "<div class=\"btn-group\">"
								+ "<button type=\"button\" class=\"btn  btn-outline-secondary\" id=\"view\" value=\""+data[i].br_ID+"\">view</button>"
								+ "<button type=\"button\" class=\"btn  btn-outline-secondary\" data-toggle=\"modal\" data-target=\"#editModal\" id=\"edit\" value=\""+data[i].br_ID+"\">Edit</button>"
								+ "<button type=\"button\" class=\"btn  btn-outline-secondary mr-1\" data-toggle=\"modal\" data-target=\"#deletModal\" id=\"delete\" value=\""+data[i].br_ID+"\">Delete</button>"
								+ "</div>"
								+ "<small class=\"text-muted\" style=\"font-size:15px;\">創建日期：<br>"
								+ data[i].br_DateTime
								+ "</small>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
					}
					insertData += "</div>"
					$('#bookReportList').html(insertData);
					
					for(var i = 0; i < data.length; i++){	
						$("#rateYo"+ data[i].br_ID).rateYo({
							rating: data[i].br_Score,
						    spacing: "5px",
						    starWidth: "20px",
						    readOnly: true
						});
					}	
				}
			});
			$('.btn-outline-secondary').click(function() {
				if ($(this).attr("id") == 'delete') {
					$('#deleteInfo').html("是否要刪除心得");
					$('#deleteSecond').val($(this).val());
				}
				if ($(this).attr("id") == 'edit') {
					$('#editButton').val($(this).val());
					let getBookReportURL = location.href
							+ "/getBookReport/" + $(this).val();
					$.ajax({
						async : false,
						type : 'POST',
						url : getBookReportURL,
						dataType : "json",
						contentType : "application/json;charset=utf-8",
						success : function(data) {
							$('#bk_Name').html(data.bk_Name);
							$('#bk_Author')
									.html("作者：" + data.bk_Author);
							$('#bk_Publish').html(
									"出版社：" + data.bk_Publish);
							$('#bk_Pic').attr('src', data.bk_Pic);
							$('#bk_DataTime').html("撰寫日期"+data.br_DateTime);
							$('#br_Content').html(data.br_Content);
							$rateYo.rateYo("rating", data.br_Score);
							
							CKEDITOR.addCss('.cke_editable { font-size: 20px; padding: 1em; }');
						 	editor = CKEDITOR.replace( 'br_Content' ,{
								toolbar: [
							        {
							          name: 'clipboard',
							          items: ['Undo', 'Redo']
							        },
							        {
								          name: 'styles',
								          items: ['Format', 'Font', 'FontSize']
								    },
							        {
							          name: 'basicstyles',
							          items: ['Bold']
								    },
							        {
							          name: 'colors',
							          items: ['TextColor']
							        },
							        {
							          name: 'align',
							          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
							        }
							      ]

							      
							});
						}
					});
					
				}
				if($(this).attr("id") == 'view'){
					window.location.href = "http://localhost:8080/BookWeb/BookReport/"+$(this).val();
				}
			});
		};
		
		function loadReportMessageList(){
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : location.href + "/memberReportMessageList",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
					alert('123 ');
				},
				success : function(data) {
					var insertData = "";
					for (let i = 0; i < data.length; i++) {
						
						insertData += "<li class=\"media my-4 messageSize\">"
					    			+ "<img src=\""+ data[i].bkPic +"\" class=\"mr-3\" width=\"150px\">"
					    			+ "<div class=\"media-body\">"
					    			+ "<h2 class=\"mt-0 mb-1 messageSize\"><a style=\" color:#146; font-size:20px;\" href=\""+ data[i].brId + "\">"
					    			+ "<p class = \"messageSize\" >"
					    			+ data[i].brName
					    			+ "</p>"
					    			+ "</a></h2>"
					    			+ "<p>留言日期："
					    			+ data[i].bmDate
					    			+ "</p>"
					    			+ "<label class=\"mr-4\">書名："
					    			+ data[i].bkName
					    			+ "</label><label class=\"ml-4\">作者："
					    			+ data[i].bkAuthor
					    			+ "</label>"
					    			+ "<br>"
					    			+ "<label class = \"ml-2\" >留言：</label>"
					    			+ "<div class=\"btn-toolbar justify-content-between btn-sm ml-3 \">"
					    			+ "<label class = \"messageSize\">"
					    			+ data[i].bmContent
					    			+ "</label>"
					    			+ "<div class=\"input-group\">"
					    			+ "<button id=\"deleteMessage\" type=\"button\" class=\"btn btn-outline-danger mr-4 md-3\" value = \""
					    			+ data[i].bmId
					    			+ "\">刪除</button>"
					    			+ "</div>"
					    			+ "</div>"
					    			+ "</div>"
					  				+ "</li>"
					}
					$('#message').html(insertData);
				}
			});
			$('.btn-outline-danger').click(function(){
				swal({
					  title: "確定要刪除",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					}).then((willDelete) => {
					  if (willDelete) {
						 $.ajax({
							async : false,
							type : 'POST',
							url : "http://localhost:8080/BookWeb/BookReport/deleteReportMessage",
							data : {bmId:$(this).val()},
							dataType : "json",
							success : function(data) {
								if(data && typeof(data) == "boolean"){								
									swal({
									      title: "刪除成功",
									      icon: "success",
									 }).then((willDelete) => {
										 loadReportMessageList();
									 });
									 
								}
							}
						});
					  }
				});
			})
		};
		
	</script>
</body>
</html>