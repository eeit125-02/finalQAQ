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
	href="${pageContext.request.contextPath}/css/bottle.css">
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
	
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
.collectindex {
	float: right;
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
	
	$(document).ready(function() {
		loadBookList();
	});	

</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">

		<!-- 內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<br>
		<hr>
		<div class="collectindex">
			<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			
			<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<button type="submit" name="list" class="btn btn-outline-dark">收藏清單</button>
			</form>
				
			<a class="btn btn-outline-dark" href="<c:url value='/addnewbook' />" role="button">新增書籍</a>			
		</div>
		<br> <br>

<!--總筆數 -->
		<div id="resultnumber"></div>

<!-- 指定排序 -->
<div class="btn-group" role="group" aria-label="Basic example" id="ordersite" style="float: right;">
</div>
		<br>
<c:if test='${not empty searchresultzero}'>		
		<div><span>　　　　　　　　　　　　</span>
		<img alt="查無資料" src="${pageContext.request.contextPath}/image/no_data.png" width="125px" style="position:relative;top:10px;"> 
							<h4 style="display: inline-block;">　　${searchresultzero}</h4></div>	
</c:if>
<!-- 搜尋結果清單 -->
<c:if test='${empty searchresultzero}'>
		<div><h4>
		　　　　　　${searchresultzero}</h4></div>

			<div class="booktypelist" id="booktypelist">	
			</div>						
</c:if>			
		<br>
	<c:url value="/searchtype" var="gotopage">
		<c:param name="name" value="${name}"></c:param>
		<c:param name="author" value="${author}"></c:param>
		<c:param name="publish" value="${publish}"></c:param>		
<%-- 		<c:param name="b" value="${b}"></c:param>		 --%>
<%-- 		<c:param name="apage" value="${apage }"></c:param>	 --%>
	</c:url>
	<c:url value="/searchtypebypage" var="gotopagebypage">
		<c:param name="name" value="${name}"></c:param>
		<c:param name="author" value="${author}"></c:param>
		<c:param name="publish" value="${publish}"></c:param>		
<%-- 		<c:param name="b" value="${b}"></c:param>		 --%>
<%-- 		<c:param name="apage" value="${apage }"></c:param>	 --%>
	</c:url>
	<c:url value="/searchtypebydate" var="gotopagebydate">
		<c:param name="name" value="${name}"></c:param>
		<c:param name="author" value="${author}"></c:param>
		<c:param name="publish" value="${publish}"></c:param>		
<%-- 		<c:param name="b" value="${b}"></c:param>		 --%>
<%-- 		<c:param name="apage" value="${apage }"></c:param>	 --%>
	</c:url>
	<c:url value="/searchtypebyclick" var="gotopagebyclick">
		<c:param name="name" value="${name}"></c:param>
		<c:param name="author" value="${author}"></c:param>
		<c:param name="publish" value="${publish}"></c:param>		
<%-- 		<c:param name="b" value="${b}"></c:param>		 --%>
<%-- 		<c:param name="apage" value="${apage }"></c:param>	 --%>
	</c:url>

<ul class="pagination justify-content-center mb-4" id="pageButton">
</ul>	
		
		<hr>
		</div>

	<script >


//點擊加入收藏
		function collect(i) {
			let bk_ID = i;
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
						loadCollectList(i);
					}else {
						swal("刪除成功", "你已經把這本書取消收藏囉～","info")
						loadCollectList(i);
					}
				}
			});
		}
		
		
		function loadBookList() {
			$.ajax({
				async : false,
				cache : false,
				type : 'POST',
				url : "searchtype/loadBookTypeList",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				error : function() {
				},
				success : function(data) {
					console.log("test");
					console.log(data.totalpage);
					console.log(data.nowpage);
					
					var innerHtml="";
					if(data.totalpage != 0){
						if(data.nowpage != 1){						
							innerHtml +="<li class=\"page-item \"><a class=\"page-link\" href=\""+"${gotopage}"+"&apage="+1+"\">"+"第一頁"+"</a></li>"
							innerHtml += "<li class=\"page-item\">"
									  + " <a class=\"page-link\" aria-label=\"Previous\" href=\""+"${gotopage}"+"&apage="+(data.nowpage - 1)+"\">"
									  + "<span aria-hidden=\"true\">&laquo;</span>"
									  + "</a>"
									  + "</li>"
								innerHtml += "<li class=\"page-item \"><a class=\"page-link\" href=\""+"${gotopage}"+"&apage="+(data.nowpage - 1)+"\">"+ (data.nowpage - 1) +"</a></li>"
										}
											
											    
								innerHtml += "<li class=\"page-item active\"><a class=\"page-link\" href=\""+ "${gotopage}"+"&apage="+ data.nowpage +"\">"+ data.nowpage +"</a></li>"
											
						if(data.nowpage != data.totalpage){						
								innerHtml += "<li class=\"page-item \"><a class=\"page-link\" href=\""+"${gotopage}"+"&apage="+(data.nowpage + 1)+"\">"+(data.nowpage + 1) +"</a></li>"
// 								innerHtml += "<li class=\"page-item \"><a class=\"page-link\" href=\""+"${gotopage}"+"&apage="+(data.nowpage + 2)+"\">"+(data.nowpage + 2) +"</a></li>"
								innerHtml += "<li class=\"page-item\"></li>"
										  + "<a class=\"page-link\" aria-label=\"Next\" href=\""+"${gotopage}"+"&apage="+(data.nowpage + 1)+"\">"
										  + "<span aria-hidden=\"true\">&raquo;</span>"
										  + "</a>"
										  + "</li>"
								innerHtml +="<li class=\"page-item \"><a class=\"page-link\" href=\""+"${gotopage}"+"&apage="+data.totalpage+"\">"+"最後一頁"+"</a></li>"
							}
											
							$('#pageButton').html(innerHtml)
					
					}
					
					
					
					
					
					
					
					
					
					
					
					var insertData = "<div>";
					for (let i = 0; i < data.finaldata.length; i++) {
						
						console.log(data);
						
						insertData = "<div class=\"row\">"
// 						insertData += "<div class=\"row\">"
						
							+"<div class=\"col-sm-2\">"
							+"<img class=\"itemcov\" alt=\"\" src=\""
							+data.finaldata[i].bk_Pic
							+"\" width=\"150\">"
							+"</div>"
							
							+"<div class=\"col-sm-10\">"
							+"<h3>"
							+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
							+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg bkname\" value=\""
							+data.finaldata[i].bk_ID+"\">"+data.finaldata[i].bk_Name+"</button></form>"
							+"</h3>"
							+"｜ 作者："+data.finaldata[i].bk_Author
							+" ｜  出版社："+data.finaldata[i].bk_Publish
							+"｜  出版日期："+data.finaldata[i].bk_Date
							+"｜  頁數："+data.finaldata[i].bk_Page
							+"｜  點閱率："+data.finaldata[i].bk_Click
							+"<br>"
							+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
							+data.finaldata[i].bk_Content
							+"</p>"	
							+"</div>"
							
							+"</div>"
							
							+"<div class=\"collect\" id=\"collect"+data.finaldata[i].bk_ID+"\">"
							+"</div>"
							
							+"<br>"
							+"<hr>"
					$("#booktypelist").append(insertData);	
							loadCollectList(data.finaldata[i].bk_ID);
					}

					var insertData1 = "<h3>搜尋結果：（總共 "+${count}+" 筆）</h3>"
					$("#resultnumber").html(insertData1);
					
					var insertData2 = "<button type='button' class='btn btn-light' style='font-weight:bold;'>重新排序</button>"
									+ "<a class='btn btn-danger' href='${gotopagebyclick}' role='button'>最多瀏覽</a>"
					  				+ "<a class='btn btn-success' href='${gotopagebydate}' role='button'>最新出版</a>"
									+ "<a class='btn btn-warning' href='${gotopagebypage}' role='button'>頁數</a>"
					
					$("#ordersite").html(insertData2);
					
					}
				});
			}		

		
		
		function loadCollectList(i) {
			let bk_ID = i;
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
						var insertData2=
							"<button id=\"gocollect\" type=\"submit\" name=\"collect\" onclick=\"collect("
							+i+");\""
							+"class=\"btn btn-outline-danger btn-sm\" value=\""+i+"\">"
							+"<img "
							+"src=\"${pageContext.request.contextPath}/image/heartred.png\""
							+" id=\"Img/heart\" width=\"25px\">" 
							+" 取消收藏</button>"
						$("#collect"+i).html(insertData2);
						console.log(data + "???");
					}else {
						var insertData3=
							"<button id=\"gocollect\" type=\"submit\" name=\"collect\" onclick=\"collect("
							+i+");\""
							+"class=\"btn btn-outline-danger btn-sm\" value=\""+i+"\">"
							+"<img "
							+"src=\"${pageContext.request.contextPath}/image/heartwhite.png\""
							+" id=\"Img/heart\" width=\"25px\">" 
							+" 加入收藏</button>"
						$("#collect"+i).html(insertData3);
						console.log(data + "~~~");
					}
				}
			});
		}
		
		
	</script>

	<!-- 內容結束 -->
	
	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	
</body>
</html>