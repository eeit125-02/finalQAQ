<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@200&display=swap" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />	
<style>
.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

/* -------- */
.Product_block_hot{
	width: 500px;
    height: 400px;
    position: relative;
    text-align: center;
/*     border:2px solid black; */
}

.leftone{
	font-size:25px;
    position: absolute;//設為絕對定位(absolute)
    font-weight: bold;
    top: 50px;
    right : 400px; 
/*     右邊上面都設0，則出現在右上方 */
    color: #BB7857;
    display: block;
    background: white;
    width: 400px;
    height: 319px;
    text-align: center;
/*     border-style:outset; */
    box-shadow:-6px 6px rgba(247,239,232,1);
    font-family: 'Noto Serif TC', serif;

}

/* @media ( min-width : 768px) { */
/* 	.bd-placeholder-img-lg { */
/* 		font-size: 3.5rem; */
/* 	} */
/* } */
</style>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader" style="background-color:#bb7857"></header>
	<!-- header -->

	<div class="container">
	<!-- body -->
	<br>

	
					<div class="form-row">
						<div class="form-group col-md-1">	
						</div>	
						<div class="form-group col-md-9">	
	
	 <div class="Product_block_hot" style="float:right">
	 <div class="leftone">
        <div>
        <span><br>歡迎來到 屬於你的　書‧適圈</span>
        <p style="font-size:16px;color:#808080;word-break: break-all;padding:15px 5px">
        　我們期望為每個人打造出專屬的書籍網站，除了基本的查詢功能，可自訂個人化收藏清單、撰寫與閱讀書籍評論，也提供二手書的交流平台；同時能舉辦或參與書籍為主的活動，並在本站論壇進行各種相關討論。本站集中以書籍為主題，延伸出兼具動與靜等多方面的功能，讓愛好書籍的人可以獲得深入與全面的使用體驗。
        </p>
        </div>
        
        <div style="width:115px;height:45px;background-color:#C68463;margin-left:230px;margin-top:0px;">
        <a style="color:white;font-size:16px;">登入會員</a>
        </div>
        
       </div> 
        <div class="color" style="width:667px;height:444px;background-color:green;
        box-shadow:4px 4px #BB7857;
        background-image: url('${pageContext.request.contextPath}/image/a.jpg');">
        </div>
    </div>
	
					</div>
						<div class="form-group col-md-1">	
						</div>
	</div>
	</div>
	
	<!-- body -->

<div class="container" style="position: relative; font-family: 'Noto Serif TC', serif;">
	<fieldset style="background-color:#f7efe8; width:800px; height:1000px">
	<legend>　　　功能清單</legend>
	<div style="position: absolute;top:100px;left:100px;width:250px; height:150px;background-color:black">

	</div>
	<div style="position: absolute;top:100px;left:450px;width:250px; height:150px;background-color:green">

	</div>
	<div style="position: absolute;top:350px;left:100px;width:250px; height:150px;background-color:yellow">

	</div>
	<div style="position: absolute;top:350px;left:450px;width:250px; height:150px;background-color:pink">

	</div>
	
	
	</fieldset>
</div>









	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

	<script>
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");
	</script>

</body>
</html>