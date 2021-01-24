<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.rateyo.css"/>
<script src="${pageContext.request.contextPath}/js/jquery.rateyo.js"></script>
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

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
			<img id="bkPic" src="" class="w-25 p-2" alt="...">
			<div class="media-body ml-4">

				<form  class="col-ml-4">
					<br>
					<br>
					<div class="form-group">
						<label id="userAccount" class= "messageSize" id="bkName">撰寫者：</label> 
					</div>
					<div class="form-group">
						<label id="bkName" class= "messageSize">書名：</label> 
					</div>
					<div id = "bookWriter" class="form-group">
						<label id="bkAuthor" class = "mr-5" class= "messageSize">作者：12232</label> 
					</div>
					<div class="form-group">
						<label id="bkPublish" class= "messageSize">出版社：</label> 
					</div>
					<div class="form-group">
						<label>閱讀標題：</label> 
						<input type="text" class="form-control" id="brTitle" >
					</div>
					
					<div class="form-inline">
						<label>評分：</label>
						<div id="rateYo"></div>
					</div>
				</form>
			</div>
		</div>
		<label for="message-text" class="col-form-label" >心得:</label>
		<textarea id="brContent" class="form-control" style="height: 350px;"></textarea>
		<br>
		
		<button type="button" id="backButton" class="btn btn-outline-danger btn-mi float-right">刪除</button>
		<button type="button" id="addBookReport" class="btn btn-outline-primary btn-mi float-right mr-4">新增</button>
		<button type="button" id="insertData" class="btn btn-outline-info btn-mi float-right mr-4">輸入</button>
		<br>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
	 	CKEDITOR.addCss('.cke_editable { font-size: 20px; padding: 1em; }');
	 	var editor = CKEDITOR.replace( 'brContent' ,{
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
		
		let brScore = 0;

		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
		$("#rateYo").rateYo({
			rating: 0.0,
			fullStar: true,
		    spacing: "10px",
		    onSet: function (rating, rateYoInstance) {
		    	brScore = rating
		    }
		});
		
		$.ajax({
			async : false,
			type : 'POST',
			url : "http://localhost:8080/BookWeb/BookReport/addBookReport/bookInfo/" + window.location.href.split("/").pop(),
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
		  	}
		});

		$('#addBookReport').click(function(){
			var addData = {
						bk_ID : window.location.href.split("/").pop(),
						br_Score : brScore,
						br_Content : editor.getData(),
						br_Name : $('#brTitle').val()
				};
				console.log(editor.getData().replace(/'"'/g, "<&>"))
			$.ajax({
				async : false,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/BookReport/addBookReport/addReport',
				data : addData,
				dataType : 'json',
				success : function(data){
					if (data){
						console.log(data)
						window.location.href = "http://localhost:8080/BookWeb/BookReport/EditBookReport"
					}
					else{s
						alert.val(已傳野果);
					}
				}
			})
		});
		
		$('#backButton').click(function(){
			history.go(-1);
		});

		$('#insertData').click(function(){
			$('#brTitle').val('這本書誰十分好看推快速輸入')
			
			editor.setData( "這本書誰十分好看推，在這裡推薦給各位" )
		})
		
	</script>
</body>
</html>