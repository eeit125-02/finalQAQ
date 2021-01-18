<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
.bkname{
white-space:pre-wrap;
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
	<div class="container">
		<label id="test"></label>

		<!-- 		內容開始 -->

		
<!-- 						<ul class="nav nav-tabs" id="novelTab" role="tablist"> -->
<!-- 							<li class="nav-item"><a class="nav-link" id="novel_rule-tab" -->
<!-- 								data-toggle="tab" href="" role="tab">單項查詢</a></li> -->
<!-- 							<li class="nav-item"><a class="nav-link active" -->
<!-- 								id="novel_latest-tab" data-toggle="tab" href="" -->
<!-- 								role="tab">進階查詢</a></li> -->
<!-- 						</ul> -->

	<div class="carousel slide" style="text-align:center;margin: auto;">
	
 <div class="card-deck">
<c:forEach items="${allbookfive}" var="all">		
  <div class="card">
    <img src="${all.getBk_Pic()}" class="card-img-top" alt="熱門瀏覽" height="200px">
   <form name=ppp action="<c:url value='/bookpage' />" method="get">
		<button type="submit" name="page" class="btn btn-link btn-block bkname" value="${all.getBk_ID()}">${all.getBk_Name()}</button>
	</form>
  </div>
</c:forEach>
</div>
	
	</div>
		<br><br>
<!-- 三種關鍵字查詢（書名＆作者＆出版社） -->
<div class="row">
	<div class="col-sm-4">		
		<form action="<c:url value='/searchtype' />" method="get">
			<h4>輸入書名關鍵字：</h4>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="name" value=""
					type="search" placeholder="Search" aria-label="Search"required="required">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>
			
	<div class="col-sm-4">		
		<form action="<c:url value='/searchtype' />" method="get">
			<h4>輸入作者關鍵字：</h4>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="author" value=""
					type="search" placeholder="Search" aria-label="Search"required="required">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>
			
	<div class="col-sm-4">		
		<form action="<c:url value='/searchtype' />" method="get">
			<h4>輸入出版社關鍵字：</h4>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="publish" value=""
					type="search" placeholder="Search" aria-label="Search"required="required">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>					
</div>
		<br>
		<hr>

<!-- 類別查詢 -->

<form action="<c:url value='/searchtype' />" method="get">


		<h4 style="display:inline;">選擇書籍類別：</h4>
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
<br>
<br>

<!-- <input type="checkbox" name="22" value="100" id="checkallb2"/>文學創作 -->
<!-- <input type="checkbox" name="22" value="200" checked /> 詩 -->
<!-- <input type="checkbox" name="22" value="300" /> 散文 -->

<!-- 第一行類別（文學創作＆圖文漫畫＆人文社會） -->
		<div class="row">
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<p  class="btn btn-link btn-lg"  style="background-color:#DAB1D5;color:#3C3C3C" >
						<input type="checkbox" name="b" value="1" id="checkallb"/>文學創作
					</p>
<!-- 					<button type="button" class="btn btn-link btn-lg" style="background-color:#DAB1D5;color:#3C3C3C"  -->
<!-- 						value="1">文學創作</button> -->
					<br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="2" /> 詩
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="3" /> 散文
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="4" /> 戀愛/言情 小說
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="5" /> 武俠/歷史 小說
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="6" /> 推理/驚悚 小說
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="7" /> 科幻/奇幻 小說
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="8" /> 溫馨/療癒 小說
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="9" /> 翻譯文學
					</p>
				</div>
			</div>
			
				<br>
				<hr>

			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#B3D9D9;color:#3C3C3C"value="10">圖文漫畫</button>
					<br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="11" /> 插畫集
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="12" /> 各式圖鑑
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="13" /> 戀愛/言情 漫畫
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="14" /> 科幻/奇幻 漫畫
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="15" /> 戰鬥/冒險 漫畫
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="16" /> 推理/驚悚 漫畫
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="17" /> 其它 漫畫
					</p>
				</div>
			</div>
			
				<br>
				<hr>

			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#D6D6AD;color:#3C3C3C"value="28">人文/社會</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="29" /> 政治/軍事
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="30" /> 歷史/地理
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="31" /> 宗教/哲學
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="32" /> 法律/心理
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="33" /> 社會/文化
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="34" /> 兩性/家庭
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="35" /> 報導/傳播
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="36" /> 國際趨勢
					</p>
				</div>
			</div>
		</div>

				<br>

<!-- 第二行類別（商業理財＆藝術生活＆旅遊飲食）		 -->
		<div class="row">
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#E1C4C4;color:#3C3C3C"value="18">商業/理財</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="19" /> 創業
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="20" /> 會計
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="21" /> 經濟學
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="22" /> 管理學
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="23" /> 財務金融
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="24" /> 投資理財
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="25" /> 企業經營
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="26" /> 市場行銷
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="27" /> 人際/職場
					</p>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#ACD6FF;color:#3C3C3C"value="37">藝術/生活</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="38" /> 美術/設計
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="39" /> 建築/攝影
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="40" /> 勵志/成長
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="41" /> 運動/戶外活動
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="42" /> 音樂/電影
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="43" /> 居家生活
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="44" /> 美妝服飾
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="45" /> 收藏嗜好
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="46" /> 命理占卜
					</p>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFB5B5;color:#3C3C3C"value="47">旅遊/飲食</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="48" /> 台灣旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="49" /> 日本旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="50" /> 韓國旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="51" /> 美洲旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="52" /> 歐洲旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="53" /> 中國旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="54" /> 其它海外旅遊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="55" /> 飲食烹調
					</p>
				</div>
			</div>			
		</div>
				<br>
				
<!-- 第三行類別（親子童書＆學習考用＆醫療科學）		 -->
		<div class="row">				
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFDCB9;color:#3C3C3C"value="57">親子/童書</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="58" /> 繪本
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="59" /> 兒童文學
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="60" /> 懷孕/育兒
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="61" /> 成長教養
					</p>
				</div>
		</div>
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#BEBEBE;color:#3C3C3C"value="63">學習/考用</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="64" /> 語言學習
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="65" /> 公職考試
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="66" /> 升學考試
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="67" /> 技能檢定
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="68" /> 電腦資訊
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="69" /> 工具書
					</p>
				</div>
		</div>
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFD9EC;color:#3C3C3C"value="70">醫療/科學</button>
					 <br> <br>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="71" /> 日常保健
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="73" /> 身心養生
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="74" /> 疾病醫療
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="76" /> 應用科學
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="77" /> 自然生物
					</p>
					<p class="btn btn-outline-secondary"style="margin:3px">
						<input type="checkbox" name="b" value="78" /> 數理化學
					</p>
				</div>
		</div>
	</div>

</form>



	<!-- 	內容結束 -->

<script>


 $(document).ready(function(){
  $("#checkallb2").click(function(){
   if($("#checkallb2").prop("checked")){//如果全選按鈕有被選擇的話（被選擇是true）
    $("input[name='22']").each(function(){
     $(this).prop("checked",true);//把所有的核取方框的property都變成勾選
    })
   }else{
    $("input[name='22']").each(function(){
     $(this).prop("checked",false);//把所有的核方框的property都取消勾選
    })
   }
  })
 })
</script>  


	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>