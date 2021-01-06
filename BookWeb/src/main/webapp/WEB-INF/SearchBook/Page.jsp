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

.a3 {
	margin: 0px;
	display: inline
}
.row2{
	display: inline
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
	
// 	// 顯示結果
// 	function checkresult(){
// 		var v=${pageresult2};
// 		console.log(v);
		
// 		if(v){	
// 			alert('加入成功');
// 		}else{
// 			alert('加入失敗');			
// 		}
		
// 	}
	
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
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

		</div>
		<br> <br>

<!-- 左直行（圖片＆按鈕列） -->

		<div class="row">
			<div class="col-sm-5" style="margin:0 auto;">
			
		<!-- 封面 -->
				<p class="s-corner">
<%-- 					<img class="mainpic" alt="" src="${pageresult.bk_Pic}" width="390"> --%>
					<img class="mainpic" alt="" src="${pageresult.bk_Pic}" height="390">
				</p>
		<!-- 收藏＆通報&心得&二手書按鈕 -->
				<div class="row2">
						<form name=a1 class=a3 action="<c:url value='/pagecollect' />" method="get">	
							<button type="submit" name="pagecollect" class="btn btn-outline-info btn-sm"
								value="${pageresult.bk_ID}">
								<img alt="點選收藏" src="${pageContext.request.contextPath}/image/heartred.png"
								id="heart" width="18px"> 收藏本書</button>
						</form>
				
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
					<div class="col-sm-1"></div>
					<div class="col-sm-5">作者：${pageresult.bk_Author}</div>
					
						<c:if test='${empty pageresult.bk_Translator}'>
						<div class="col-sm-6"> </div>					
						</c:if>
												
						<c:if test='${not empty pageresult.bk_Translator}'>
						<div class="col-sm-6">譯者：${pageresult.bk_Translator}</div>
						</c:if>

					</div>
		<!-- 出版社＆出版地 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-1"></div>
					<div class="col-sm-5">出版社：${pageresult.bk_Publish}</div>
					
						<c:if test='${empty pageresult.bk_Publisher_Place}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Publisher_Place}'>
						<div class="col-sm-6">${pageresult.bk_Publisher_Place}</div>
						</c:if>					

					</div>					

		<!-- 出版日＆語言 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-1"></div>
					<div class="col-sm-5">出版日期：${pageresult.bk_Date}</div>
					
						<c:if test='${empty pageresult.bk_Language}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Language}'>
						<div class="col-sm-6">語言：${pageresult.bk_Language}</div>
						</c:if>	
					
					</div>
											
		<!-- ISBN＆頁數 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-1"></div>
					<div class="col-sm-5">ISBN：${pageresult.bk_ISBN}</div>
					
						<c:if test='${empty pageresult.bk_Page}'>
						<div class="col-sm-6"> </div>					
						</c:if>
						
						<c:if test='${not empty pageresult.bk_Page}'>
						<div class="col-sm-6">頁數：${pageresult.bk_Page}</div>
						</c:if>	
					
					</div>
					
		<!-- 類型 -->
					<div class="row"> 
					<div class="col-sm-1"></div>
					<div class="col-sm-11">類型：
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
		
	<!-- 內容簡介 -->
				<div class="row"> 
					<div class="col-sm-12" id="border">
					<h5 align="center">內容簡介</h5>
					<hr>
						<p>
<!-- 						<textarea style="border-style:none;"rows='20' cols='150' id="t1"> -->
						<textarea style="border-style:none;"rows='20' cols='150' id="t1" readonly="readonly">
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
						window.alert("以撰寫過心得")
					}
				}
			})
			
		});
	</script>

</body>
</html>