<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.rateyo.css"/>
<script src="${pageContext.request.contextPath}/js/jquery.rateyo.js"></script>


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

.messageSize{
	 font-size: 16px;
}
</style>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->

	<div class="container">
		<div class="media">
			
			<img id="bkPic" src="" class="w-25 h-25 p-2" alt="...">
			
			<div class="media-body ml-5">

				<form  class="col-ml-4">
					<br>
					<div class="form-group">
						<label class="messageSize" id="brTitel">閱讀標題：</label> 
					</div>
					<div class="form-group">
						<label class="messageSize" id="userAccount">撰寫者：</label> 
					</div>
					<div class="form-group">
						<label class="messageSize" id="bkName">書名：</label> 
					</div>
					<div id = "bookWriter" class="form-group">
						<label class="messageSize" id="bkAuthor" class = "mr-5">作者：12232</label> 
					</div>
					<div class="form-group">
						<label class="messageSize" id="bkPublish">出版社：</label> 
					</div>
					
					<div class="form-inline">
						<label class="messageSize" >評分：</label>
						<div id="rateYo"></div>
					</div>
					<br>
					<div class="btn-toolbar justify-content-between btn-sm">
						<p></p>
						<div class="form-group">
							<button id="addSub" type="button" class="btn btn-outline-primary btn-lg">加入收藏</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br>
		<h3 align="center">心得:</h3>
		<hr>
		<br>
		<p id="brContent"></p>
		<br>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="command_input" placeholder="請輸入留言"> <input type="hidden" name="post_id" id="post_id" value="6">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" id="command_btn" type="button" data-toggle="modal" data-target="#checkLogin">留言</button>
				<button class="btn btn-outline-secondary" id="insertData" type="button" data-toggle="modal" data-target="#checkLogin">一鍵輸入</button>
			</div>
		</div>
		<div id="show_command" >
			<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
				<div class="media">
					<img src="https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/181_Java_logo_logos-512.png" style="width: 50px; height: 50px; text-align:center; border-radius: 60%;"/>
					<div class="media-body ml-2">
						<p>JUN<br>
							2021/01/13 20:36:10
						</p>
						<p>123</p>
					</div>
				</div>
			</div>
		</div>
		
		<br>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
		
		$(document).ready(function() {
			$("#bookWebheader").load("//leeit125g2.ddns.net:8080/BookWeb/header");
			$("#bookWebFooter").load("//eeit125g2.ddns.net:8080/BookWeb/footer");
			
			$.ajax({
				async : false,
				type : 'POST',
				url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport/viewBookReport/" + window.location.href.split("/").pop(),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					$('#bkName').html("書名：" + data.bk_Name);
					$('#bkAuthor').html("作者：" + data.bk_Author);
					$('#bkPublish').html("出版社：" + data.bk_Publish);
					$('#bkPic').attr('src', data.bk_Pic);
					if (typeof(data.bk_Translator) != "object"){
						$('#bookWriter').append("<label>翻譯："+ data.bk_Translator +"</label>");
					}
					$('#userAccount').html("撰寫者：" + data.userAccount);
					$('#brTitel').html("閱讀標題：" + data.br_Name);
					$("#rateYo").rateYo({
						rating: data.br_Score,
					    spacing: "10px",
					    readOnly: true
					    
					});
					$('#brContent').html(data.br_Content);
			  	}
			});
			getMessage();
		});
		
		
		
		$('#command_btn').click(function(){
			
			if ($('#command_input').val().length != 0){
				var addData = {
						brId: window.location.href.split("/").pop(),
						bmContent: $('#command_input').val()
				}
				$('#command_input').val("")
				
				$.ajax({
					async : false,
					type : 'POST',
					url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport/addReportMessage",
					data : addData,
					dataType : "json",
					success : function(data) {
						if(data && typeof(data) == "boolean"){
							getMessage();
						}else{
							if(data == 1){
								swal({
									  title: "無法對自己的心得留言",
									  icon: "error",
									  button: "ok",
								});
							}else{
								swal({
									  title: "已撰寫過留言",
									  icon: "error",
									  button: "ok",
								});
							}
							
						}
					}
				});
			}else{
				swal({
					  title: "留言不可為空",
					  icon: "error",
					  button: "ok",
				});
			}
			
		});
		
		$('#insertData').click(function(){
			$('#command_input').val('這篇心得撰寫的十分好');
		})
		
		$('#addSub').click(function(){
			$.ajax({
				async : false,
				type : 'POST',
				url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport/addSub/" + window.location.href.split("/").pop(),
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {

					if(data && typeof(data) == "boolean"){
						swal({
							  title: "新增成功",
							  icon: "success",
							  button: "ok",
						});
					}else{
						console.log(data)
						if(data == 1){
							swal({
								  title: "會員撰寫",
								  text: '請至會員中心查看',
								  icon: "error",
								  button: "ok",
							});
						}else{
							swal({
								  title: "已加入收藏",
								  icon: "error",
								  button: "ok",
							});
						}
						
					}
				}
			});
		})
		
		function getMessage(){
			$.ajax({
				async : false,
				type : 'POST',
				url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport/bookReportMessageList/" + window.location.href.split("/").pop(),
				dataType : "json",
				success : function(data) {
					console.log(data.reportOwner)
					innerHtml = "";
					for( var i = 0; i < data.messages.length; i++ ){
						innerHtml += "<div style=\"background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;\">"
								   + "<div class=\"media\">"
								   + "<img src=\""+ data.messages[i].mbPic +"\" style=\"width: 50px; height: 50px; text-align:center; border-radius: 60%;\"/>"	
								   + "<div class=\"media-body ml-2\">"
								   + "<p class = \"messageSize\">"+ data.messages[i].mbName +"<br>"
								   + data.messages[i].bmDate
								   + "</p>"
								   + "<div class=\"btn-toolbar justify-content-between btn-sm\">"
								   + "<p class = \"messageSize\">"
								   + data.messages[i].bmContent 
								   + "</p>"
								   if(data.reportOwner){									   
									innerHtml += "<div class=\"input-group\">"
											   + "<button id=\"deleteMessage\" type=\"button\" class=\"btn btn-outline-danger mr-2 md-3\" value=\""+data.messages[i].bmId+"\" >刪除</button>"
								   }
						innerHtml += "</div>"
								   + "</div>"
								   + "</div>"
								   + "</div>"
								   + "</div>"
					}
					$('#show_command').html(innerHtml);
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
							url : "http://eeit125g2.ddns.net:8080/BookWeb/BookReport/deleteReportMessage",
							data : {bmId:$(this).val()},
							dataType : "json",
							success : function(data) {
								getMessage();
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
		}

	</script>
</body>
</html>