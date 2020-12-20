<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	
	<div class="row flex-nowrap justify-content-between align-items-center">

		<div class="col-4 text-center">
			<a class="blog-header-logo text-dark" href="//localhost:8080/BookWeb">圖書資訊網</a>
		</div>
		<div class="col-4 d-flex justify-content-end align-items-center">
<<<<<<< Updated upstream
			<a class="btn btn-sm btn-outline-secondary" href="//localhost:8080/BookWeb/toLogin">登入</a>
=======
			<a id="login" class="btn btn-sm btn-outline-secondary" href="//localhost:8080/BookWeb/toLogin">登入</a>
		<a id="logout" class="btn btn-sm btn-outline-secondary" href="//localhost:8080/BookWeb/toLogin" type="">登出</a>
>>>>>>> Stashed changes
		</div>
	</div>

	<div class="nav-scroller py-1 mb-2">
		<nav class="nav d-flex justify-content-between">
			<a class="p-2 text-muted" href="//localhost:8080/BookWeb/SearchBook/Search">圖書漂流瓶</a> 
			<a class="p-2 text-muted" href="//localhost:8080/BookWeb/Transation/storeMain">二手書交易系統</a> 
			<a class="p-2 text-muted" href='<c:url value="/showActs"/>'>共樂聚落</a> 
			<a class="p-2 text-muted" href="//localhost:8080/BookWeb/Discussion/mainpage">書適論壇</a>
			<a class="nav-link dropdown-toggle text-muted" href="#"
				id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> 閱讀履歷 </a>
			<div class="dropdown-menu text-muted"
				aria-labelledby="navbarDropdownMenuLink2">
				<a class="dropdown-item text-muted" href="//localhost:8080/BookWeb/BookReport">讀書心得</a> 
				<a class="dropdown-item text-muted" href="#">Another action</a> 
				<a class="dropdown-item text-muted" href="//localhost:8080/BookWeb/BookReport/EditBookReport">編輯資訊</a>
			</div>

		</nav>
	</div>
<<<<<<< Updated upstream
=======
	<script>
		/* $.cookie('name', 'value') */
		
		var mb_ID = $.cookie('loginMb_ID');
		var mb_Account = $.cookie('loginMb_Account');
		if ( typeof(mb_ID) != "undefined"){
			$("#login").html(mb_Account)
		}else{
			$('#logout').hide()
		};
		
		$('#logout').click(function(){
			 $.cookie("loginMb_ID", null);
			 $("#login").html("登入")
		})
		
	</script>
>>>>>>> Stashed changes
</body>
</html>