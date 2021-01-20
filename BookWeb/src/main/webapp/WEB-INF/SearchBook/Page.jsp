<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bottle.css">
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
.detail{
text-align:right;
font-size:16px;
}
.a3 {
	margin: 0px;
	display: inline
}
.row2{
	margin:0 auto;
	text-align:center;
	display: block;
}
.collectindex {
	float: right;
}
.s-corner {
   text-align: center;
   width: auto;
   height: 400px;
   box-shadow: 0px 0px 10px #95CACA;
   background: linear-gradient(#95CACA,#95CACA) left top,
   linear-gradient(#95CACA,#95CACA) left bottom,
   linear-gradient(#95CACA,#95CACA) right top,
   linear-gradient(#95CACA,#95CACA) right bottom;
   background-size: 4px 4px;
   background-repeat: no-repeat;
   float: auto;
}
.col-sm-3 {
    text-align: center;
}
#border{
  border: 10px solid transparent;
  padding: 35px;
  border-image: url("${pageContext.request.contextPath}/image/border-image.png") 30 round;
}
</style>


<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
	
	
// 	$(document).ready(function() {
// 		loadCollectList();
// 	});	
</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
		<!-- 		內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 第一列（搜尋首頁＆收藏清單&新增書籍&修改書籍） -->
		<br>
		<hr>
		<div class="collectindex">

			<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>

			<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<button type="submit" name="list" class="btn btn-outline-dark">收藏清單</button>
			</form>

			<a class="btn btn-outline-dark" href="<c:url value='/addnewbook' />" role="button">新增書籍</a>			

			<form name=a2 class=a3 action="<c:url value='/updatebook' />" method="get">
				<button type="submit" name="update" class="btn btn-outline-dark" value="${pageresult.bk_ID}">修改書訊</button>
			</form>		
			
			<form name=a2 class=a3 action="<c:url value='/deletebook' />" method="get">
				<button type="submit" name="delete" class="btn btn-outline-dark" value="${pageresult.bk_ID}">刪除本書</button>
			</form>	

		</div>
		<br> <br>

<!-- 左直行（圖片＆按鈕列） -->

		<div class="row">
			<div class="col-sm-5" style="margin:0 auto;">
			
		<!-- 封面 -->
				<p class="s-corner">
					<img class="mainpic" alt="" src="${pageresult.bk_Pic}" height="390">
				</p>
		<!-- 收藏＆通報&心得&二手書按鈕 -->
				<div class="row2">
						<div id="collect" class="a3">
						
<%-- 						<c:if test='${empty havebc}'> --%>
<%-- 						<form name=a1 class=a3 action="<c:url value='/pagecollect' />" method="get">	 --%>
<!-- 							<button type="submit" name="pagecollect" class="btn btn-outline-info btn-sm" -->
<%-- 								value="${pageresult.bk_ID}"> --%>
<%-- 								<img alt="點選收藏" src="${pageContext.request.contextPath}/image/heartwhite.png" --%>
<!-- 								id="heart" width="18px"> 收藏本書</button> -->
<!-- 						</form> -->
<%-- 						</c:if> --%>
												
<%-- 						<c:if test='${not empty havebc}'> --%>
<!-- 						bbb -->
<%-- 						</c:if> --%>
						
						</div>
				<button type="submit" name="" class="btn btn-outline-info btn-sm">通報錯誤</button>
				<button type="button" id="addBookReport" value="${pageresult.bk_ID}" class="btn btn-outline-info btn-sm">撰寫心得</button>
				<button type="submit" name="" class="btn btn-outline-info btn-sm">尋找二手書</button>
				</div>
			</div>
			
			
			
<!-- 右直行（書訊各欄目） -->
			<div class="col-sm-7">

				<div class="back">
		<!--書名 -->
					<h2 class="title" align="center">${pageresult.bk_Name}</h2>
					<hr>
					<br>
		<!-- 作者＆譯者 -->
					<div class="row" style="margin-bottom:15px"> 
<!-- 					<div class="col-sm-1"></div> -->
				
					<div class="col-sm-2 detail detail2">作者：</div>
					<div class="col-sm-4 detail2">${pageresult.bk_Author}</div>
				
						<c:if test='${empty pageresult.bk_Translator}'>
						<div class="col-sm-6"> </div>					
						</c:if>
												
						<c:if test='${not empty pageresult.bk_Translator}'>
						<div class="col-sm-6">　譯者：${pageresult.bk_Translator}</div>
<!-- 						<div class="col-sm-4"></div> -->
						</c:if>

					</div>
		<!-- 出版社＆出版地 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">出版社：</div>
					<div class="col-sm-4">${pageresult.bk_Publish}</div>
					
						<c:if test='${empty pageresult.bk_Publisher_Place}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Publisher_Place}'>
						<div class="col-sm-6 detail2">${pageresult.bk_Publisher_Place}</div>
						</c:if>					

					</div>					

		<!-- 出版日＆語言 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">出版日期：</div>
					<div class="col-sm-4">${pageresult.bk_Date}</div>
					
						<c:if test='${empty pageresult.bk_Language}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Language}'>
						<div class="col-sm-6">　語言：${pageresult.bk_Language}</div>
						</c:if>	
					
					</div>
											
		<!-- ISBN＆頁數 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">ISBN：</div>
					<div class="col-sm-4">${pageresult.bk_ISBN}</div>
					
						<c:if test='${empty pageresult.bk_Page}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Page}'>
						<div class="col-sm-6">　頁數：${pageresult.bk_Page}</div>
						</c:if>	
					
					</div>
					
		<!-- 類型 -->
					<div class="row"> 
					<div class="col-sm-2 detail">類型：</div>
					<div class="col-sm-9">
		<c:forEach items="${pageresulttype}" var="row">					
					<a href="#" class="badge badge-info" style="font-size:1em">${row.getSearchtype().getSty_Name()}</a>
		</c:forEach>										
					</div>
					</div>
				</div>
			</div>
		</div>

		
		<br>
		<br>
		
		<div id="collect1"></div>
		
	<!-- 內容簡介 -->
				<div class="row"> 
					<div class="col-sm-12" id="border">
					<h5 align="center">內容簡介</h5>
					<hr>
						<p>
<!-- 						<textarea style="border-style:none;"rows='20' cols='150' id="t1"> -->
						<textarea style="border-style:none;white-space:pre-wrap;"rows='20' cols='150' id="t1" readonly="readonly">
						${pageresult.bk_Content}
						</textarea>
						</p>
					</div>
				</div>

</div>

	<!-- 		內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
	
	$(window).ready(function loadCollectList() {
		var i = ${pageresult.bk_ID};
		console.log(i);
		let editURL = "searchbook/checkcollect/"+i;
		$.ajax({
			async : false,
			type : 'GET',
			url : editURL,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				console.log(data + "!!!!");
				console.log(typeof(data));
				
				if (data) {
					var insertData2 = "<button id=\"collect\" type=\"submit\" name=\"collect\""
									+ "class=\"btn btn-outline-info btn-sm\" value=\""+i+"\">"
									+ "<img "
									+ "src=\"${pageContext.request.contextPath}/image/heartred.png\""
									+ " id=\"Img/heart\" width=\"18px\">" 
									+ " 取消收藏</button>"
					$("#collect").html(insertData2);
					console.log(data + "???");
				}else {
					var insertData3=
						"<button id=\"collect\" type=\"submit\" name=\"collect\""
						+"class=\"btn btn-outline-info btn-sm\" value=\""+i+"\">"
						+"<img "
						+"src=\"${pageContext.request.contextPath}/image/heartwhite.png\""
						+" id=\"Img/heart\" width=\"18px\">" 
						+" 加入收藏</button>"
					$("#collect").html(insertData3);
					console.log(data + "~~~");
				}
			}
		});
	})
	
	
	
	
		$('#collect').click(function collect() {
			i = ${pageresult.bk_ID};
			console.log(i);
			let editURL = "searchbook/resultcollect/"+i;
			$.ajax({
				async : true,
				type : 'GET',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
// 						alert('成功加入收藏 ');
						swal("收藏成功", "你已經把這本書加入收藏囉～","success")
						loadCollect();
					}else {
						swal("刪除成功", "你已經把這本書取消收藏囉～","info")
						loadCollect();
					}
				}
			});
		})
		function loadCollect() {
		var i = ${pageresult.bk_ID};
		console.log(i);
		let editURL = "searchbook/checkcollect/"+i;
		$.ajax({
			async : false,
			type : 'GET',
			url : editURL,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				console.log(data + "!!!!");
				console.log(typeof(data));
				
				if (data) {
					var insertData2 = "<button id=\"collect\" type=\"submit\" name=\"collect\""
									+ "class=\"btn btn-outline-info btn-sm\" value=\""+i+"\">"
									+ "<img "
									+ "src=\"${pageContext.request.contextPath}/image/heartred.png\""
									+ " id=\"Img/heart\" width=\"18px\">" 
									+ " 取消收藏</button>"
					$("#collect").html(insertData2);
					console.log(data + "???");
				}else {
					var insertData3=
						"<button id=\"collect\" type=\"submit\" name=\"collect\""
						+"class=\"btn btn-outline-info btn-sm\" value=\""+i+"\">"
						+"<img "
						+"src=\"${pageContext.request.contextPath}/image/heartwhite.png\""
						+" id=\"Img/heart\" width=\"18px\">" 
						+" 加入收藏</button>"
					$("#collect").html(insertData3);
					console.log(data + "~~~");
				}
			}
		});
	}
	
	
	
	
		$('#addBookReport').click(function(){
			var check = {
						bk_ID : $('#addBookReport').val()
				};
			$.ajax({
				async : false,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/BookReport/checkBookReport',
				data : check,
				dataType : 'json',
				success : function(data){
					if (data){
						let form = $("<form method='post'></form>");
						form.attr({"action":"//localhost:8080/BookWeb/BookReport/addBookReport/"+ $('#addBookReport').val()});
						$(document.body).append(form);
						form.submit();
					}
					else{
						swal({
								  title: "會員已撰寫",
								  text: '請至會員中心查看',
								  icon: "error",
								  button: "ok",
						});
					}
				}
			})
			
		});
	</script>

</body>
</html>