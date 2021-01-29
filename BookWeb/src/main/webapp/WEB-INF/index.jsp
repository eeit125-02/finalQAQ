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

@import url('https://fonts.googleapis.com/css2?family=Lobster+Two&display=swap');

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
.loader {
bottom: 0;
height: 100%;
left: 0;
position: fixed;
right: 0;
top: 0;
width: 100%;
z-index: 1111;
background: #FFFFFF;
overflow-x: hidden;
}
/* @media ( min-width : 768px) { */
/* 	.bd-placeholder-img-lg { */
/* 		font-size: 3.5rem; */
/* 	} */
/* } */


.img_div {
    margin: 20px 400px 0 400px;
    position: relative;
    width: 531px;
    height: 354px;
}
.mask {
    position: absolute;
    top: 0;
    left: 0;
    width: 400px;
    height: 300px;
    background: rgba(101, 101, 101, 0.6);
    color: #ffffff;
    opacity: 0;
}
.mask h3 {
    text-align: center;
}


.img_div a:hover .mask {
    opacity: 1;           
}



</style>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
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
        <br><span style="font-size:30px;">歡迎來到屬於你的 書‧適圈</span>
        <p style="font-size:16px;color:#808080;word-break: break-all;padding:10px 8px">
        　我們期望為每個人打造出專屬的書籍網站，除了基本的查詢功能，可自訂個人化收藏清單、撰寫與閱讀書籍評論，也提供二手書的交流平台；同時能舉辦或參與書籍為主的活動，並在本站論壇進行各種相關討論。本站集中以書籍為主題，延伸出兼具動與靜等多方面的功能，讓愛好書籍的人可以獲得深入與全面的使用體驗。
        </p>
        </div>
        
        <div style="width:100px;height:45px;background-color:#C68463;margin-left:230px;margin-top:0px;">
        <a style="color:white;font-size:18px;" href="//eeit125g2.ddns.net:8080/BookWeb/toCity">登入會員</a>
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

<div class="container" style="position: relative; font-family: 'Noto Serif TC', serif;color:#C68463">
	<fieldset style="background-color:#f7efe8; width:950px; height:800px">
	<legend style="font-size:35px;font-family: 'Lobster Two', cursive;font-style:italic">Our Services</legend>
		
	


<div class="img_div" style="position: absolute;top:80px;right:270px;width:400px; height:300px">
   <img src="${pageContext.request.contextPath}/image/shop.jpg"  width="400px" height="300px">        
            <a href='<c:url value="/qaqTest"/>'>
            <div class="mask">
              <h3 style=";text-align:center;line-height:300px">二手書圖</h3>
                </div>
        </a>
</div>


<div class="img_div" style="position: absolute;top:80px;left:100px;width:400px; height:300px;">
   <img src="${pageContext.request.contextPath}/image/bookreport1111.jpg"  width="400px" height="300px">        
            <a href='//eeit125g2.ddns.net:8080/BookWeb/BookReport/searchBookReport/all/1'>
            <div class="mask"> 
              <h3 style=";text-align:center;line-height:300px">閱讀履歷</h3>
                </div>
        </a>
</div>


<div class="img_div" style="position: absolute;top:420px;right:270px;width:400px; height:300px;">
    <img src="${pageContext.request.contextPath}/image/act2.jpg"  width="400px" height="300px">        
            <a href='<c:url value="/showActs"/>'>
            <div class="mask">
              <h3 style=";text-align:center;line-height:300px">共樂聚落</h3>
                </div>
        </a>
</div>

<div class="img_div" style="position: absolute;top:420px;left:100px;width:400px; height:300px">
    <img src="${pageContext.request.contextPath}/image/discuss.jpg"  width="400px" height="300px">        
            <a href='<c:url value="/Discussion/mainpage"/>'>
            <div class="mask">
              <h3 style=";text-align:center;line-height:300px">書適論壇</h3>
                </div>
        </a>
</div>
	
	

<%-- 	<div style="position: absolute;top:350px;left:80px;width:350px; height:250px;background-color:yellow; --%>
<%-- 	background-image: url('${pageContext.request.contextPath}/image/discussion.jpg');background-size:100% 100%; --%>
<!-- 	box-shadow:3px 3px 12px gray;padding:3px; -->
<%-- 	background-repeat: no-repeat"> --%>
<!-- 	</div> -->


<%-- 	<div style="position: absolute;top:350px;left:450px;width:350px; height:250px;background-color:pink; --%>
<%-- 	background-image: url('${pageContext.request.contextPath}/image/br1.jpg');background-size:100% 100%; --%>
<!-- 	box-shadow:3px 3px 12px gray;padding:3px; -->
<%-- 	background-repeat: no-repeat"> --%>
<!-- 	</div> -->



	
	</fieldset>
</div>









	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
<div class = "loader" style="height: 100%;width:100%">
</div>
	<script>
		$("#bookWebheader").load("//eeit125g2.ddns.net:8080/BookWeb/header");
		$("#bookWebFooter").load("//eeit125g2.ddns.net:8080/BookWeb/footer");
		
jQuery(window).on("load",function(){
	jQuery(".loader").fadeOut(1000)});
	
	
	</script>

</body>
</html>