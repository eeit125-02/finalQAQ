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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bottle.css">
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
span{
padding:5px;
}
::placeholder{
color:#336666;
}
.inputt{
padding:2px 5px;
border: none;
background-color:#D1E9E9;
border-radius:10px;
text-align: center;
}
.inputt:focus::placeholder{
color:#D1E9E9;
}
.inputt:focus{
outline:none;
}
.tagtype{
color:	#984B4B;
padding:3px 12px;
border: none;
background-color:#E1C4C4;
border-radius:10px;
text-align: center;
}
label{
background-color:#FFF4C1;
margin-right:10px;
}
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
       	$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
	
	$(document).ready(function() {
		loadBookCollectList();
	});		
</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class="blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
		<label id="test"></label>

		<!-- 內容開始 -->

		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<div class="collect">
				<a class="btn btn-outline-dark" href="<c:url value='SearchBook/Search' />" role="button">搜尋首頁</a>
			</div>
			<br>
			<h3>收藏清單：</h3>
						<nav class="navbar navbar-light bg-light justify-content-between">
							<a class="navbar-brand"></a>
							
<!--     <ul class="navbar-nav mr-auto"> -->
<!--       <li class="nav-item active" style="float:right;"> -->
<!--         <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> -->
<!--       </li> -->
<!-- 	</ul>						 -->
							<form class="form-inline">
									<button class="btn btn btn-link"
									type="button" onclick="loadBookCollectList();">顯示全部收藏</button>
								<input class="form-control mr-sm-2" type="search" id="keyword"
									placeholder="書名or標籤關鍵字" name="keyword" required="required">
								<button class="btn btn-outline-primary my-2 my-sm-0"
									type="button" onclick="searchword();">查詢</button>
							</form>
<!-- 							</div> -->
						</nav>
			
		<div class="bookcollectlist" id="bookcollectlist">

		</div>

	</div>

<script>

			function loadBookCollectList() {
				$.ajax({
					async : true,
					type : 'POST',
					url : "collectlist/getBookCollectList/",
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					error : function() {
						swal("尚未登入", "請先登入會員～","error")
						window.location.href="//localhost:8080/BookWeb/toLogin";
					},
					success : function(data) {
						$("#bookcollectlist").empty();
						var insertData = "<div>";
						for (let i = 0; i < data.length; i++) {
// 							insertData += "<div class=\"row\">"
							insertData = "<div class=\"row\">"
								+"<div class=\"col-sm-2\">"
								+"<img class=\"itemcov\" alt=\"\" src=\""
								+data[i].bk_Pic
								+"\" width=\"150\">"
								+"</div>"
								+"<div class=\"col-sm-10\">"
								+"<h3>"
								+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
								+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
								+data[i].bk_ID+"\">"+data[i].bk_Name+"</button></form>"
								+"</h3>"
								+"｜ 作者："+data[i].bk_Author
								+" ｜  出版社："+data[i].bk_Publish
								+"｜  出版日期："+data[i].bk_Date
								+"<br>"
								+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
								+data[i].bk_Content
								+"</p>"	
								+"</div>"
								+"</div>"
								+"<div class=\"no\" style=\"margin:auto\">"
								
// 								+"<span class='badge badge-light'>自訂標籤</span>"
								+"<label>自訂標籤</label>"
								+"<span id='tag1"+data[i].bc_ID+"'></span>"								
								+"<span id='tag2"+data[i].bc_ID+"'></span>"								
								+"<span id='tag3"+data[i].bc_ID+"'></span>"								

								+"<button id=\"cancel\" type=\"submit\" class=\"btn btn-outline-danger btn-sm collect\" onclick=\"deletebc(" + data[i].bc_ID + ");\"value=\""
								+data[i].bc_ID
								+"\">"
								+ "<img "
								+ "src=\"${pageContext.request.contextPath}/image/heartred.png\""
								+ " id=\"Img/heart\" width=\"18px\">" 
								+" 取消收藏</button>"
								+"</div>"
// 								+"<br>"
								+"<hr>"
					$("#bookcollectlist").append(insertData);	
					loadTagList(data[i].bc_ID);
					}
// 					insertData += "</div>"
// 					$("#bookcollectlist").html(insertData);	
					}
				});
			}
			
			function searchword() {
// 				var check = {
// 						key : $('#keyword').val() ,
// 				};
				let i = $('#keyword').val();
				console.log("&&&&&&&&&&&&&&&&&&&&&&&&&"+$('#keyword').val());
				let editURL = "collectlist/searchbctag/"+i;
				$.ajax({
					async : true,
					type : 'POST',
					url : editURL ,
// 					data : check,
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					error : function() {
						swal("不可為空", "請輸入關鍵字～","error")
					},
					success : function(data) {
						$("#bookcollectlist").empty();
						
						if(data.length==0){
							var insertZero = "<br><img alt='查無資料' src='${pageContext.request.contextPath}/image/no_data.png' width='125px' style='position:relative;left:100px;'>" 
							+"<h4 style='display: inline-block;'>　　　　　查無資料</h4></div>"
							$("#bookcollectlist").append(insertZero);
						}else{
						var insertData = "<div>";		
						for (let i = 0; i < data.length; i++) {
// 							insertData += "<div class=\"row\">"
							insertData = "<div class=\"row\">"
								+"<div class=\"col-sm-2\">"
								+"<img class=\"itemcov\" alt=\"\" src=\""
								+data[i].bk_Pic
								+"\" width=\"150\">"
								+"</div>"
								+"<div class=\"col-sm-10\">"
								+"<h3>"
								+"<form name=a1 action=\"<c:url value='/bookpage' />\" method=\"get\">"
								+"<button type=\"submit\" name=\"page\"class=\"btn btn-link btn-lg\" value=\""
								+data[i].bk_ID+"\">"+data[i].bk_Name+"</button></form>"
								+"</h3>"
								+"｜ 作者："+data[i].bk_Author
								+" ｜  出版社："+data[i].bk_Publish
								+"｜  出版日期："+data[i].bk_Date
								+"<br>"
								+"<p class=\"ellipsis\"style=\"padding-top:15px\">"
								+data[i].bk_Content
								+"</p>"	
								+"</div>"
								+"</div>"
								+"<div class=\"no\" style=\"margin:auto\">"
								
// 								+"<span class='badge badge-light'>自訂標籤</span>"
								+"<label>自訂標籤</label>"
								+"<span id='tag1"+data[i].bc_ID+"'></span>"								
								+"<span id='tag2"+data[i].bc_ID+"'></span>"								
								+"<span id='tag3"+data[i].bc_ID+"'></span>"								

								+"<button id=\"cancel\" type=\"submit\" class=\"btn btn-outline-danger btn-sm collect\" onclick=\"deletebc(" + data[i].bc_ID + ");\"value=\""
								+data[i].bc_ID
								+"\">"
								+ "<img "
								+ "src=\"${pageContext.request.contextPath}/image/heartred.png\""
								+ " id=\"Img/heart\" width=\"18px\">" 
								+" 取消收藏</button>"
								+"</div>"
// 								+"<br>"
								+"<hr>"
					$("#bookcollectlist").append(insertData);	
					loadTagList(data[i].bc_ID);
					}
						}
// 					insertData += "</div>"
// 					$("#bookcollectlist").html(insertData);	
					}
				});
			}
			
			function deletebc(i){
				let bc_ID = i;
				console.log(i);
				this.input
				let editURL = "collectlist/deletecollect/"+i;
				$.ajax({
				async : true,
				type : 'GET',
				url : editURL,
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) { 
					if (data) { 
					loadBookCollectList();
					swal("刪除成功", "你已經把這本書取消收藏囉～","info");
					console.log("whyyyyyyyyyyyyyyyyyyyyyyyyyyy");
					}else {
					alert('刪除失敗 ');
					} 
				} 
			});
			
		}
			
			
			
			function loadTagList(a) {
				let bc_ID = a;
				let editURL = "searchbook/checktag/"+a;
				$.ajax({
					async : true,
					type : 'GET',
					url : editURL,
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(data) {
						if (data.bc_Tag_one != null) {		
							var htmltag1ok = "<span class='tagtype' id='oldtag1"+a+"'>"+data.bc_Tag_one+"</span>"
							+"<button type='submit' class='btn btn-link btn-sm' onclick='deletetag1("+a+");' value=''>"
							+"<img src='${pageContext.request.contextPath}/image/X.png' width='15px'>"
							+"</button>"
							$('#tag1'+a).html(htmltag1ok);
						}else {
							var htmltag1 ="<input class='inputt' id='newtag1"+a+"' placeholder='標籤1' onkeydown='this.onkeyup();' onkeyup='this.size=(this.value.length>4?this.value.length:4);' size='4'>"
								+"<button type='submit' class='btn btn-link btn-sm' onclick='insertag("+a+");' value=''>"
								+"<img src='${pageContext.request.contextPath}/image/O.png' width='18px'>"
								+"</button>"
							$('#tag1'+a).html(htmltag1);
						}
						
						if (data.bc_Tag_two != null) {		
							var htmltag1ok = "<span class='tagtype' id='oldtag2"+a+"'>"+data.bc_Tag_two+"</span>"
							+"<button type='submit' class='btn btn-link btn-sm' onclick='deletetag2("+a+");' value=''>"
							+"<img src='${pageContext.request.contextPath}/image/X.png' width='15px'>"
							+"</button>"
							$('#tag2'+a).html(htmltag1ok);
						}else {
							var htmltag1 ="<input class='inputt' id='newtag2"+a+"' placeholder='標籤2' onkeydown='this.onkeyup();' onkeyup='this.size=(this.value.length>4?this.value.length:4);' size='4'>"
								+"<button type='submit' class='btn btn-link btn-sm' onclick='insertag("+a+");' value=''>"
								+"<img src='${pageContext.request.contextPath}/image/O.png' width='18px'>"
								+"</button>"
							$('#tag2'+a).html(htmltag1);
						}
						
						if (data.bc_Tag_three != null) {		
							var htmltag1ok = "<span class='tagtype' id='oldtag3"+a+"'>"+data.bc_Tag_three+"</span>"
							+"<button type='submit' class='btn btn-link btn-sm' onclick='deletetag3("+a+");' value=''>"
							+"<img src='${pageContext.request.contextPath}/image/X.png' width='15px'>"
							+"</button>"
							$('#tag3'+a).html(htmltag1ok);
						}else {
							var htmltag1 ="<input class='inputt' id='newtag3"+a+"' placeholder='標籤3' onkeydown='this.onkeyup();' onkeyup='this.size=(this.value.length>4?this.value.length:4);' size='4'>"
								+"<button type='submit' class='btn btn-link btn-sm' onclick='insertag("+a+");' value=''>"
								+"<img src='${pageContext.request.contextPath}/image/O.png' width='18px'>"
								+"</button>"
							$('#tag3'+a).html(htmltag1);
						}
						
					}
				});
			}
			
			
			
			
			function insertag(b){
				let bc_ID = b;
				var insertHtml0="";
				var check = {
						a : $('#newtag1'+b).val() ,
						c : $('#newtag2'+b).val() ,
						d : $('#newtag3'+b).val() ,
						b : bc_ID
				};
			
			$.ajax({
				async : true,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/setbctag',
				data : check,
				dataType : 'json',
				error : function() {
					alert('123');
				},
				success : function(data) { 
					console.log(data.bc_ID + "11111111111111111111111111111");
					loadTagList(data.bc_ID);
					} 

			});
			
		}
	
			
			
			function deletetag1(c){
				let bc_ID = c;
				var check = {
						a : $('#oldtag1'+c).html() ,
						c : null ,
						d : null ,
						b : bc_ID
				};
			$.ajax({
				async : true,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/deletebctag',
				data : check,
				dataType : 'json',
				error : function() {
					alert('123');
				},
				success : function(data) { 
					console.log(data.bc_ID + "222222");
					loadTagList(data.bc_ID);
					} 

			});
			
		}	
			function deletetag2(c){
				let bc_ID = c;
				var check = {
						a : null ,
						c : $('#oldtag2'+c).html() ,
						d : null ,
						b : bc_ID
				};				
			$.ajax({
				async : true,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/deletebctag',
				data : check,
				dataType : 'json',
				error : function() {
					alert('123');
				},
				success : function(data) { 
					console.log(data.bc_ID + "222222");
					loadTagList(data.bc_ID);
					} 

			});
			
		}	
			function deletetag3(c){
				let bc_ID = c;
				var check = {
						a : null ,
						c : null ,
						d : $('#oldtag3'+c).html() ,
						b : bc_ID
				};
			$.ajax({
				async : true,
				type : 'POST',
				url : 'http://localhost:8080/BookWeb/deletebctag',
				data : check,
				dataType : 'json',
				error : function() {
					alert('123');
				},
				success : function(data) { 
					console.log(data.bc_ID + "222222");
					loadTagList(data.bc_ID);
					} 

			});
			
		}	
					
			</script>
			
			
<script>			
window.onload=function(){
	document.querySelector(".inputt").addEventListener("input",function(){
			    this.style.width="0px";//讓 scrollWidth 獲取最小值，達到回縮的效果
			    this.style.width=this.scrollWidth+"px";
			  });}
</script>

	<!-- 內容結束 -->

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->

</body>
</html>