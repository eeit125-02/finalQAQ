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

.text {
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}

/* @media ( min-width : 768px) { */
/* 	.bd-placeholder-img-lg { */
/* 		font-size: 3.5rem; */
/* 	} */
/* } */

/* Opacity #1 */
/* .hover11 figure img { */
/* 	opacity: 1; */
/* 	-webkit-transition: .3s ease-in-out; */
/* 	transition: .3s ease-in-out; */
/* } */
/* .hover11 figure:hover img { */
/* 	opacity: .5; */
/* } */


CSS
.hvrbox,
.hvrbox * {
	box-sizing: border-box;
}
.hvrbox {
	position: relative;
	display: inline-block;
	overflow: hidden;
	max-width: 100%;
	height: auto;
}
.hvrbox img {
	max-width: 100%;
}
.hvrbox .hvrbox-layer_bottom {
	display: block;
}
.hvrbox .hvrbox-layer_top {
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	color: #fff;
	padding: 15px;
	-moz-transition: all 0.4s ease-in-out 0s;
	-webkit-transition: all 0.4s ease-in-out 0s;
	-ms-transition: all 0.4s ease-in-out 0s;
	transition: all 0.4s ease-in-out 0s;
}
.hvrbox:hover .hvrbox-layer_top,
.hvrbox.active .hvrbox-layer_top {
	opacity: 1;
}
.hvrbox .hvrbox-text {
	text-align: center;
	font-size: 18px;
	display: inline-block;
	position: absolute;
	top: 50%;
	left: 50%;
	-moz-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
.hvrbox .hvrbox-text_mobile {
	font-size: 15px;
	border-top: 1px solid rgb(179, 179, 179); /* for old browsers */
	border-top: 1px solid rgba(179, 179, 179, 0.7);
	margin-top: 5px;
	padding-top: 2px;
	display: none;
}
.hvrbox.active .hvrbox-text_mobile {
	display: block;
}
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
.hvrbox,
.hvrbox * {
	box-sizing: border-box;
}
.hvrbox {
	position: relative;
	display: inline-block;
	overflow: hidden;
	max-width: 100%;
	height: auto;
}
.hvrbox img {
	max-width: 100%;
}
.hvrbox .hvrbox-layer_bottom {
	display: block;
}
.hvrbox .hvrbox-layer_top {
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	color: #fff;
	padding: 15px;
	-moz-transition: all 0.4s ease-in-out 0s;
	-webkit-transition: all 0.4s ease-in-out 0s;
	-ms-transition: all 0.4s ease-in-out 0s;
	transition: all 0.4s ease-in-out 0s;
}
.hvrbox:hover .hvrbox-layer_top,
.hvrbox.active .hvrbox-layer_top {
	opacity: 1;
}
.hvrbox .hvrbox-text {
	text-align: center;
	font-size: 18px;
	display: inline-block;
	position: absolute;
	top: 50%;
	left: 50%;
	-moz-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
.hvrbox .hvrbox-text_mobile {
	font-size: 15px;
	border-top: 1px solid rgb(179, 179, 179); /* for old browsers */
	border-top: 1px solid rgba(179, 179, 179, 0.7);
	margin-top: 5px;
	padding-top: 2px;
	display: none;
}
.hvrbox.active .hvrbox-text_mobile {
	display: block;
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
	<div class=text style="position: absolute;top:100px;left:100px;width:350px; height:250px;background-color:black;
	background-image: url('${pageContext.request.contextPath}/image/act2.jpg');background-size: 100% 100%;
    background-repeat: no-repeat">

	</div>
	<div style="position: absolute;top:100px;left:450px;width:350px; height:250px;background-color:green;
	background-image: url('${pageContext.request.contextPath}/image/discussion.jpg');background-size: 100% 100%;
    background-repeat: no-repeat">

	</div>
	<div style="position: absolute;top:350px;left:100px;width:350px; height:250px;background-color:yellow;
	background-image: url('${pageContext.request.contextPath}/image/act2.jpg');background-size: 100% 100%;
    background-repeat: no-repeat">

	</div>
	<div style="position: absolute;top:350px;left:450px;width:350px; height:250px;background-color:pink;
	background-image: url('${pageContext.request.contextPath}/image/act2.jpg');background-size: 100% 100%;
    background-repeat: no-repeat">

	</div>
	
	
	<div class="hover11 column">
  <div>
    <figure><img src="https://picsum.photos/300/200?image=244" /></figure>
    <span>Hover</span>
  </div>
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