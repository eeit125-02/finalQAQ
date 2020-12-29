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
.btn btn-outline-secondary{
/* 	margin: 20px; */
/* 	padding: 10px; */
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
		<br>
		<hr>
		<br>

<!-- 三種關鍵字查詢（書名＆作者＆出版社） -->
<div class="row">
	<div class="col-sm-4">		
		<form action="<c:url value='/searchbook' />" method="get">
			<h3>輸入書名關鍵字：</h3>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="name" value=""
					type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>
			
	<div class="col-sm-4">		
		<form action="<c:url value='/searchbook' />" method="get">
			<h3>輸入作者關鍵字：</h3>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="author" value=""
					type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>
			
	<div class="col-sm-4">		
		<form action="<c:url value='/searchbook' />" method="get">
			<h3>輸入出版社關鍵字：</h3>
			<div class="form-inline">
				<input class="form-control mr-sm-2" name="publish" value=""
					type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">查詢</button>
			</div>
		</form>
	</div>					
</div>


		<br>
		<hr>
		<br>

<!-- 類別查詢 -->
		<h3>選擇書籍類別：</h3>
		<br>


<!-- 第一行類別（文學創作＆圖文漫畫＆人文社會） -->
		<div class="row">
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#DAB1D5;color:#3C3C3C">文學創作</button>
					<br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 詩
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 散文
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 戀愛/言情 小說
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 武俠/歷史 小說
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 推理/驚悚 小說
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 科幻/奇幻 小說
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 溫馨/療癒 小說
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="c" value="" /> 翻譯文學
					</p>
				</div>
			</div>
			
				<br>
				<hr>

			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#B3D9D9;color:#3C3C3C">圖文漫畫</button>
					<br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 插畫集
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 各式圖鑑
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 戀愛/言情 漫畫
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 科幻/奇幻 漫畫
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 戰鬥/冒險 漫畫
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 推理/驚悚 漫畫
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 運動/競技 漫畫
					</p>
				</div>
			</div>
			
				<br>
				<hr>

			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#D6D6AD;color:#3C3C3C">人文/社會</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 政治/軍事
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 歷史/地理
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 宗教/哲學
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 法律/心理
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 社會/文化
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 兩性/家庭
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 報導/傳播
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 國際趨勢
					</p>
				</div>
			</div>
		</div>

				<br>

<!-- 第二行類別（商業理財＆藝術生活＆旅遊飲食）		 -->
		<div class="row">
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#E1C4C4;color:#3C3C3C">商業/理財</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 創業
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 會計
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 經濟學
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 管理學
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 財務金融
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 投資理財
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 企業經營
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 市場行銷
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 人際/職場
					</p>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#ACD6FF;color:#3C3C3C">藝術/生活</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 美術/設計
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 建築/攝影
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 勵志/成長
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 運動/戶外活動
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 音樂/電影
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 居家生活
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 美妝服飾
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 收藏嗜好
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 命理占卜
					</p>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFB5B5;color:#3C3C3C">旅遊/飲食</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 台灣旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 日本旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 韓國旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 美洲旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 歐洲旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 中國旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 其它海外旅遊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 飲食烹調
					</p>
				</div>
			</div>			
		</div>
				<br>
				
<!-- 第三行類別（親子童書＆學習考用＆醫療科學）		 -->
		<div class="row">				
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFDCB9;color:#3C3C3C">親子/童書</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 繪本
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 兒童文學
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 懷孕/育兒
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 成長教養
					</p>
				</div>
		</div>
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#BEBEBE;color:#3C3C3C">學習/考用</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 語言學習
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 公職考試
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 升學考試
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 技能檢定
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 電腦資訊
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 工具書
					</p>
				</div>
		</div>
		<div class="col-sm-4">		
				<div class="btn-group-toggle" data-toggle="buttons">
					<button type="button" class="btn btn-link btn-lg" style="background-color:#FFD9EC;color:#3C3C3C">醫療/科學</button>
					 <br> <br>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 日常保健
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 身心養生
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 疾病醫療
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 應用科學
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 自然生物
					</p>
					<p class="btn btn-outline-secondary">
						<input type="checkbox" name="b" value="" /> 數理化學
					</p>
				</div>
		</div>
	</div>




	<script type="text/javascript">
		function check_all(obj, cName) {
			var checkboxs = document.getElementsByName(cName);
			for (var i = 0; i < checkboxs.length; i++) {
				checkboxs[i].checked = obj.checked;
			}
		}
	</script>


	<!-- 	內容結束 -->




	</div>
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>