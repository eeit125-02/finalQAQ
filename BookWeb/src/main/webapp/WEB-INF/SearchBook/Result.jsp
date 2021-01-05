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

.collectindex {
	float: right;
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

		<!-- 內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<br>
		<hr>
		<div class="collectindex">
			<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			
			<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<button type="submit" name="list" class="btn btn-outline-dark">收藏清單</button>
			</form>
			<!-- value=會員ID -->
				
			<a class="btn btn-outline-dark" href="<c:url value='/addnewbook' />" role="button">新增書籍</a>			
		</div>
		<br> <br>


		<h3>搜尋結果：（總共 ${searchresultnumber} 筆）</h3>
		
						<c:if test='${empty count}'>
						<h6></h6>				
						</c:if>
												
						<c:if test='${not empty count}'>
						<h6>頁數：${page}／${totalPages}</h6>
						</c:if>		
							
		<br>
		
		<div><h4>　　　　　　${searchresultzero}</h4></div>
		
<c:set var="totalUsers" value="${count}"/>
<c:set var="usersPerPage" value="${perpage}"/>
<c:set var="totalPages" value="${totalPages}"/>
<c:set var="beginIndex" value="${beginIndex}"/>
<c:set var="endIndex" value="${endIndex}"/>
<c:set var="page" value="${page}"/>
<c:set var="currentPageUsers" value="${searchresult.subList(beginIndex,endIndex)}"/>	
		
		<c:forEach items="${currentPageUsers}" var="row">
<%-- 		<c:forEach items="${searchresulttype}" var="row1"> --%>
		
		<div class="row">
<!--圖片 -->
			<div class="col-sm-2">			
<%-- 				<img class="itemcov" alt="" src="${row.getBk_Pic()}" height="190"> --%>
				<img class="itemcov" alt="" src="${row.getBk_Pic()}" width="150">
			</div>
			
<!-- 書名+作者+出版社+出版日期 -->
			<div class="col-sm-10">
				<h3>
					<form name=a1 action="<c:url value='/bookpage' />" method="get">
						<button type="submit" name="page" id="sb" class="btn btn-link btn-lg"
							value="${row.getBk_ID()}">${row.getBk_Name()}</button>
					</form>
				</h3>
				｜ 作者：${row.getBk_Author()} ｜  出版社：${row.getBk_Publish()} ${row.getBk_ID()} ｜  出版日期：${row.getBk_Date()}｜ <br>
				<p class="ellipsis"style="padding-top:15px">${row.getBk_Content()}</p>
				
<!-- 收藏按鈕 -->
				<div class="collect" id="collect">
<%-- 					<form name=a2 action="<c:url value='/resultcollect' />" --%>
<!-- 						method="get"> -->
<!-- 						<img alt="點選收藏" -->
<%-- 							src="${pageContext.request.contextPath}/image/heartred.png" --%>
<!-- 							id="Img/heart" width="25px"> -->
						<button id="gocollect" type="submit" name="collect" onclick="a${row.getBk_ID()}();"
							class="btn btn-outline-danger btn-sm" value="${row.getBk_ID()}">
							<img alt="收藏" src="${pageContext.request.contextPath}/image/heartred.png"
							id="Img/heart" width="25px"> 
							加入收藏</button>
<!-- 					</form> -->
				</div>
						<br>
						<hr>
			</div>
		</div>
		
	<script >

//點擊加入收藏
		function a${row.getBk_ID()}() {
			console.log("test");
			let bk_ID = ${row.getBk_ID()}
			console.log(bk_ID);
			let editURL = "searchbook/resultcollect/"+bk_ID;
			
			$.ajax({
				async : false,
				type : 'GET',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					if (data) {
						alert('成功加入收藏 ');
					}else {
						alert('加入失敗，本書已在您的收藏清單 ');
					}
				}
			});
		}
	</script>
		</c:forEach>
<%-- 		</c:forEach> --%>
<div class="d-flex justify-content-center">

						<c:if test='${empty count}'>
						<nav></nav>				
						</c:if>
												
						<c:if test='${not empty count}'>
						
<nav aria-label="Page navigation example">
<ul class="pagination">

	<c:url value="/searchbook/1" var="firstpage">
		<c:param name="bookname1" value="${bookname1}"></c:param>
		<c:param name="bookname2" value="${bookname2}"></c:param>
		<c:param name="bookname3" value="${bookname3}"></c:param>		
	</c:url>
	
	<c:url value="/searchbook/${page-1>1?page-1:1}" var="frontpage">
		<c:param name="bookname1" value="${bookname1}"></c:param>
		<c:param name="bookname2" value="${bookname2}"></c:param>
		<c:param name="bookname3" value="${bookname3}"></c:param>		
	</c:url>	
	
<li class="page-item"><a href="${firstpage}" class="page-link">首頁</a></li>
<li class="page-item"><a href="${frontpage}" class="page-link">&laquo;</a></li>
	
<c:forEach begin="1" end="${totalPages}" varStatus="loop">
<c:set var="active" value="${loop.index==page?'active':''}"/>
	<c:url value="/searchbook/${loop.index}" var="middlepage">
		<c:param name="bookname1" value="${bookname1}"></c:param>
		<c:param name="bookname2" value="${bookname2}"></c:param>
		<c:param name="bookname3" value="${bookname3}"></c:param>		
	</c:url>

	<c:url value="/searchbook/${page+1<totalPages?page+1:totalPages}" var="nextpage">
		<c:param name="bookname1" value="${bookname1}"></c:param>
		<c:param name="bookname2" value="${bookname2}"></c:param>
		<c:param name="bookname3" value="${bookname3}"></c:param>		
	</c:url>
	
	<c:url value="/searchbook/${totalPages}" var="finalpage">
		<c:param name="bookname1" value="${bookname1}"></c:param>
		<c:param name="bookname2" value="${bookname2}"></c:param>
		<c:param name="bookname3" value="${bookname3}"></c:param>		
	</c:url>

<li class="page-item ${active}">
<a href="${middlepage}" class="page-link">${loop.index}</a>
</li>
</c:forEach>

<li class="page-item">
<a href="${nextpage}" class="page-link">&raquo;</a>
</li>
<li class="page-item"><a href="${finalpage}" class="page-link">尾頁</a></li>
</ul>
</nav>
						</c:if>		
						
						
						
						
						<c:if test='${empty count1}'>
						<nav></nav>				
						</c:if>
												
						<c:if test='${not empty count1}'>
						
<nav aria-label="Page navigation example">
<ul class="pagination">

	<c:url value="/searchtype/1" var="firstpage">
		<c:param name="reslist" value="${reslist}"></c:param>	
	</c:url>
	
	<c:url value="/searchtype/${page-1>1?page-1:1}" var="frontpage">
		<c:param name="reslist" value="${reslist}"></c:param>	
	</c:url>	
	
<li class="page-item"><a href="${firstpage}" class="page-link">首頁</a></li>
<li class="page-item"><a href="${frontpage}" class="page-link">&laquo;</a></li>
	
<c:forEach begin="1" end="${totalPages}" varStatus="loop">
<c:set var="active" value="${loop.index==page?'active':''}"/>
	<c:url value="/searchtype/${loop.index}" var="middlepage">
		<c:param name="reslist" value="${reslist}"></c:param>	
	</c:url>

	<c:url value="/searchtype/${page+1<totalPages?page+1:totalPages}" var="nextpage">
		<c:param name="reslist" value="${reslist}"></c:param>	
	</c:url>
	
	<c:url value="/searchtype/${totalPages}" var="finalpage">
		<c:param name="reslist" value="${reslist}"></c:param>	
	</c:url>

<li class="page-item ${active}">
<a href="${middlepage}" class="page-link">${loop.index}</a>
</li>
</c:forEach>

<li class="page-item">
<a href="${nextpage}" class="page-link">&raquo;</a>
</li>
<li class="page-item"><a href="${finalpage}" class="page-link">尾頁</a></li>
</ul>
</nav>
						</c:if>								
						
						
						
						
						
						
						
						
						
</div>	

</div>

	<!-- 內容結束 -->
	
	
			<c:forEach items="${searchresulttype}" var="row1">
				${row1.getBk_ID()}<br>
				${row1.getBk_Name()}
	
			</c:forEach>

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	


</body>
</html>