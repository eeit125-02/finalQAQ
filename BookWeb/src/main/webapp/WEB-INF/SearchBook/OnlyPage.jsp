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

<title>書適圈</title>
</head>
<body>

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- body -->
		<!-- 		內容開始 -->


	<div class="container">

<!-- 左直行（圖片＆按鈕列） -->

		<div class="row">
			<div class="col-sm-5" style="margin:0 auto;">
			
		<!-- 封面 -->
				<p class="s-corner">
					<img class="mainpic" alt="" src="${pageresult.bk_Pic}" height="390">
				</p>
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
				
					<div class="col-sm-2 detail detail2">作者：</div>
					<div class="col-sm-4 detail2">${pageresult.bk_Author}</div>
						<div class="col-sm-6">　譯者：${pageresult.bk_Translator}</div>
					</div>
		<!-- 出版社＆出版地 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">出版社：</div>
					<div class="col-sm-4">${pageresult.bk_Publish}</div>
						<div class="col-sm-6 detail2">${pageresult.bk_Publisher_Place}</div>
					</div>					

		<!-- 出版日＆語言 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">出版日期：</div>
					<div class="col-sm-4">${pageresult.bk_Date}</div>
						<div class="col-sm-6">　語言：${pageresult.bk_Language}</div>
					</div>
											
		<!-- ISBN＆頁數 -->
					<div class="row" style="margin-bottom:15px"> 
					<div class="col-sm-2 detail">ISBN：</div>
					<div class="col-sm-4">${pageresult.bk_ISBN}</div>
						<div class="col-sm-6">　頁數：${pageresult.bk_Page}</div>
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
						<textarea style="border-style:none;white-space:pre-wrap;"rows='20' cols='150' id="t1" readonly="readonly">
						${pageresult.bk_Content}
						</textarea>
						</p>
					</div>
				</div>

</div>

	<!-- 		內容結束 -->

	<!-- body -->

</body>
</html>