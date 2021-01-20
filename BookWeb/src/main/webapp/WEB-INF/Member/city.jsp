<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- sidemenu -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
<!-- sidemenu -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
<style>
#admin,#mb_modify,#mb_pwd,#mb_inf {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	height: 900px;
	width: 600px;
}
p {
	border: solid 1px border-radius:10px
}

.tr1{
background-color:#68b0ab

}

.tr2{
background-color:#e0ece4
}

 #city { 
 	border-radius: 25px; 
 	padding: 20px; 
 	background-color: 	#F0F0F0; 
 	height:auto; 
	width: 200px; 
 	float:left; 
 } 
 
legend {
	text-align: center;
}

#change123 { 
 	text-align: center; 
} 

.btn {
	margin:5px;
}

.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
.dropbtn {
 
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}

</style>
</head>
<body>
<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container media" >
	<div id="city" >
	
	<div class="dropdown">	
		<button class="btn btn-outline-secondary dropbtn" >會員中心</button>
				<div class="dropdown-content">
				<button  id="admin1" name="admin" class="btn btn-outline-secondary">會員資訊</button>				
				<button  id="inf" name="mb_inf" class="btn btn-outline-secondary">會員資訊</button>				
				<button  id="third" name="third" class="btn btn-outline-secondary">會員資訊</button>				
				<button  id="Modify" name="Modify" class="btn btn-outline-secondary">會員修改</button>				
				<button  id="pwdModify" name="pwdModify" class="btn btn-outline-secondary">密碼修改</button>
				</div>
				</div>
				<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<div>
				<button type="submit" name="list" class="btn btn-outline-secondary">收藏清單</button>
				</div>
				</form>
				<form name=a3 class=a3 action="<c:url value='/myStore' />" method="get">
				<div>
				<button type="submit" name="sell" class="btn btn-outline-secondary">我的賣場</button>
				</div>
				</form>	
				<form name=a3 class=a3 action="<c:url value='/showJoinbyID' />" method="get">
				<div>
				<button type="submit" name="getjoinrecords" class="btn btn-outline-secondary">報名紀錄</button>
				</div>
				</form>
				<div>
				<button type="button" id="editBookReport" name="getjoinrecords" class="btn btn-outline-secondary">讀書心得</button>
				</div>
		
	</div>
	
	

<!-- 新的會員CITY -->
<!-- <div class="row"> -->
<!--     uncomment code for absolute positioning tweek see top comment in css -->
<!--     <div class="absolute-wrapper"> </div> -->
<!--     Menu -->
<!--     <div class="side-menu"> -->
    
<!--     <nav class="navbar navbar-default" role="navigation"> -->
<!--     Brand and toggle get grouped for better mobile display -->
<!--     <div class="navbar-header "> -->
<!--         <div class="brand-wrapper"> -->
<!--             Hamburger -->
<!--             <button type="button" class="navbar-toggle"> -->
<!--                 <span class="sr-only">Toggle navigation</span> -->
<!--                 <span class="icon-bar"></span> -->
<!--                 <span class="icon-bar"></span> -->
<!--                 <span class="icon-bar"></span> -->
<!--             </button> -->




<!--             Search body -->
<!--             <div id="search" class="panel-collapse collapse"> -->
<!--                 <div class="panel-body"> -->
<!--                     <form class="navbar-form" role="search"> -->
<!--                         <div class="form-group"> -->
<!--                             <input type="text" class="form-control" placeholder="Search"> -->
<!--                         </div> -->
<!--                         <button type="submit" class="btn btn-default "><span class="glyphicon glyphicon-ok"></span></button> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

<!--     </div> -->

<!--     Main Menu -->
<!--     <div class="side-menu-container"> -->
<!--         <ul class="nav navbar-nav"> -->

<!--             <li><a href="#"><span class="glyphicon glyphicon-send"></span> Link</a></li> -->
<!--             <li class="active"><a href="#"><span class="glyphicon glyphicon-plane"></span> Active Link</a></li> -->
<!--             <li><a href="#"><span class="glyphicon glyphicon-cloud"></span> Link</a></li> -->

<!--             Dropdown -->
<!--             <li class="panel panel-default" id="dropdown"> -->
<!--                 <a data-toggle="collapse" href="#dropdown-lvl1"> -->
<!--                     <span class="glyphicon glyphicon-user"></span> Sub Level <span class="caret"></span> -->
<!--                 </a> -->

<!--                 Dropdown level 1 -->
<!--                 <div id="dropdown-lvl1" class="panel-collapse collapse"> -->
<!--                     <div class="panel-body"> -->
<!--                         <ul class="nav navbar-nav"> -->
<!--                             <li><a href="#">Link</a></li> -->
<!--                             <li><a href="#">Link</a></li> -->
<!--                             <li><a href="#">Link</a></li> -->

<!--                             Dropdown level 2 -->
<!--                             <li class="panel panel-default" id="dropdown"> -->
<!--                                 <a data-toggle="collapse" href="#dropdown-lvl2"> -->
<!--                                     <span class="glyphicon glyphicon-off"></span> Sub Level <span class="caret"></span> -->
<!--                                 </a> -->
<!--                                 <div id="dropdown-lvl2" class="panel-collapse collapse"> -->
<!--                                     <div class="panel-body"> -->
<!--                                         <ul class="nav navbar-nav"> -->
<!--                                             <li><a href="#">Link</a></li> -->
<!--                                             <li><a href="#">Link</a></li> -->
<!--                                             <li><a href="#">Link</a></li> -->
<!--                                         </ul> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->

<!--             <li><a href="#"><span class="glyphicon glyphicon-signal"></span> Link</a></li> -->

<!--         </ul> -->
<!--     </div>/.navbar-collapse -->
<!-- </nav> -->
    
<!--     </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- 新的會員CITY -->	
	
	
	
	<div id="change123" style="width:1500px;margin-left:10px ">
									<fieldset id="mb_inf">
									<legend>會員資料</legend>
									<form>
									<div>
									<img src="${login.mb_pic}" style="width: 200px; height: 200px; text-align:center; border-radius: 50%;"/>
									</div>
									<br>
									<table class="table" >
								    <tr class="tr1">
									<th scope="col" >帳號</th>
									<th scope="col" >姓名</th>
									</tr>
									<tr class="table-light">
									<td>${login.mb_Account}</td>
									<td>${login.mb_Name}</td>
									</tr>

								<tr class="tr2">
									<th scope="col">性別</th>
									<th scope="col">電話</th>
								</tr>
								<tr class="table-light">
									<td>${login.mb_Sex}</td>
									<td>${login.mb_Tel}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">生日</th>
								</tr>
								<tr class="table-light">
									<td colspan="2">${login.mb_Birthday}</td>
								</tr>

								<tr class="tr2">
					      		<th colspan="2">Email</th>
								</tr>
								<tr class="table-light">
									<td colspan="2">${login.mb_Mail}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">地址</th>
								</tr>
								<tr  class="table-light">
									<td colspan="2">${login.mb_Address}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">喜好類型</th>
									</tr>
								<tr  class="table-light">
									<td colspan="2">${login.mb_type}</td>
								</tr>

							</table>
						</form>
					</fieldset>
					</div>
	</div>
	<input id="test" type="hidden" value="${third}">
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	</body>
	
	<script>
	$(function () {
	    $('.navbar-toggle').click(function () {
	        $('.navbar-nav').toggleClass('slide-in');
	        $('.side-body').toggleClass('body-slide-in');
	        $('#search').removeClass('in').addClass('collapse').slideUp(200);

	        /// uncomment code for absolute positioning tweek see top comment in css
	        //$('.absolute-wrapper').toggleClass('slide-in');
	        
	    });
	   
	   // Remove menu for searching
	   $('#search-trigger').click(function () {
	        $('.navbar-nav').removeClass('slide-in');
	        $('.side-body').removeClass('body-slide-in');

	        /// uncomment code for absolute positioning tweek see top comment in css
	        //$('.absolute-wrapper').removeClass('slide-in');

	    });
	});

	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
	}); 
        var check = $("#test").val();
        if(check=="third"){
        	$("#inf").hide();
			$("#pwdModify").hide();
			$("#admin1").hide();
		}else if(check=="admin"){
			$("#pwdModify").hide();
			$("#Modify").hide();
			$("#inf").hide();
			$("#third").hide();
		}else{
			$("#third").hide();
			$("#admin1").hide();
		}
		
        if(check=="third"){
        	$.ajax({
				async : false,
				cache : false,
				url : "mb_inf",
				type : 'POST',
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					console.log(data)
					var insertData = "";
						insertData ="<fieldset id=\"mb_inf\">"
									+"<legend>會員資料</legend>"
									+"<form>"
									+"<div>"
									+"<img src=\""+data.login.mb_pic+"\" style=\"width: 200px; height: 200px; text-align:center; border-radius: 50%;\" />"
									+"</div>"
									+"<br>"
									+"<table class=\"table\" >"
									+"<tr class=\"tr1\">"
									+"<th scope=\"col\" >帳號</th>"
									+"<th scope=\"col\" >姓名</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Account+"</td>"
									+"<td>"+data.login.mb_Name+"</td>"
									+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th scope=\"col\">電話</th>"
									+"<th scope=\"col\">生日</th>"
								+"</tr>"
								+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Tel+"</td>"
									+"<td>"+data.mb_Birthday+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">地址</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_Address+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">喜好類型</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_type+"</td>"
								+"</tr>"

							+"</table>"
						+"</form>"
					+"</fieldset>"	
		 			$('#change123').html(insertData);
				}
	 });
        }
       
        $("#third").click(function(){
        	$.ajax({
				async : false,
				cache : false,
				url : "mb_inf",
				type : 'POST',
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					console.log(data)
					var insertData = "";
						insertData ="<fieldset id=\"mb_inf\">"
									+"<legend>會員資料</legend>"
									+"<form>"
									+"<div>"
									+"<img src=\""+data.login.mb_pic+"\" style=\"width: 200px; height: 200px; text-align:center; border-radius: 50%;\" />"
									+"</div>"
									+"<br>"
									+"<table class=\"table\" >"
									+"<tr class=\"tr1\">"
									+"<th scope=\"col\" >帳號</th>"
									+"<th scope=\"col\" >姓名</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Account+"</td>"
									+"<td>"+data.login.mb_Name+"</td>"
									+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th scope=\"col\">電話</th>"
									+"<th scope=\"col\">生日</th>"
								+"</tr>"
								+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Tel+"</td>"
									+"<td>"+data.mb_Birthday+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">地址</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_Address+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">喜好類型</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_type+"</td>"
								+"</tr>"

							+"</table>"
						+"</form>"
					+"</fieldset>"	
		 			$('#change123').html(insertData);
				}
	 });
        })
           
        
       $("#inf").click(function(){
		 $.ajax({
				async : false,
				cache : false,
				url : "mb_inf",
				type : 'POST',
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					console.log(data)
					var insertData = "";
						insertData ="<fieldset id=\"mb_inf\">"
									+"<legend>會員資料</legend>"
									+"<form>"
									+"<div>"
									+"<img src=\""+data.login.mb_pic+"\" style=\"width: 200px; height: 200px; text-align:center; border-radius: 50%;\" />"
									+"</div>"
									+"<br>"
									+"<table class=\"table\" >"
									+"<tr class=\"tr1\">"
									+"<th scope=\"col\" >帳號</th>"
									+"<th scope=\"col\" >姓名</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Account+"</td>"
									+"<td>"+data.login.mb_Name+"</td>"
									+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th scope=\"col\">性別</th>"
									+"<th scope=\"col\">電話</th>"
								+"</tr>"
								+"<tr class=\"table-light\">"
									+"<td>"+data.login.mb_Sex+"</td>"
									+"<td>"+data.login.mb_Tel+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">生日</th>"
								+"</tr>"
								+"<tr class=\"table-light\">"
									+"<td colspan=\"2\">"+data.mb_Birthday+"</td>"
								+"</tr>"
					
								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">Email</th>"
								+"</tr>"
								+"<tr class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_Mail+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">地址</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_Address+"</td>"
								+"</tr>"

								+"<tr class=\"tr2\">"
									+"<th colspan=\"2\">喜好類型</th>"
								+"</tr>"
								+"<tr  class=\"table-light\">"
									+"<td colspan=\"2\">"+data.login.mb_type+"</td>"
								+"</tr>"

							+"</table>"
						+"</form>"
					+"</fieldset>"	
		 			$('#change123').html(insertData);
				}
	 });
	 }) 
	  $("#pwdModify").click(function(){
		  $.ajax({
				async : false,
				cache : false,
				url : "Modify",
				type : 'POST',
				contentType : "application/json;charset=utf-8",
				success : function(data) {
						insertData = "<form action=\"<c:url value='/Update' />\" method=\"post\">"
									 +"<fieldset id=\"mb_pwd\">"
									 +"<legend>密碼修改</legend>"
						+"<table class=\"table\">"
							+"<tr class=\"tr1\">"
								+"<th colspan=\"2\">帳號</th>"
							+"</tr>"
							+"<tr class=\"table-light\">"
								+"<td colspan=\"2\">"+data.mb_Account+"</td>"
							+"</tr>"
							+"<tr class=\"tr2\">"
							+"<th colspan=\"2\" >舊密碼"
							+"</th>"
							+"</tr>"
							+"<tr class=\"table-light\">"
							+"<td><input type=\"password\" name=\"oldpwd\" id=\"oldpwd\" size=\"12\" ></td>"
							+"</tr>"
							+"<input type=\"hidden\" id=\"old\" value=\""+data.pwd+"\">"
							+"<tr class=\"tr2\">"
								+"<th colspan=\"2\" >新密碼"
								+"<p style=\"color: gray; margin:0px;\">(1.不可空白，2.至少6個字且必須包含英文字母、數字)</p>"
								+"</th>"
							+"</tr>"
							+"<tr class=\"table-light\">"
								+"<td><input type=\"password\" name=\"pwd\" id=\"pwd\" size=\"12\" ><span id=\"idsp1\" style=\"color: red\"></span></td>"
							+"</tr>"
							+"<tr class=\"tr2\">"
								+"<th colspan=\"2\">確認密碼</th>"
							+"</tr>"
							+"<tr class=\"table-light\">"
							+"<td><input type=\"password\" name=\"pwd1\" id=\"pwd1\" size=\"12\" ><span id=\"idsp2\" style=\"color: red\"></span></td>"
							+"</tr>"
							+"</table>"
							+"<input type=\"button\" id=\"Update\" name=\"Update\" value=\"送出\">"
							+"<button type=\"reset\">清除</button>"
					+"</fieldset>"
						+"</form>"
		 			$('#change123').html(insertData);
						Modify();
				}
	 });
	 })
	  
	 $("#Modify").click(function(){
				 $.ajax({
						async : false,
						type : 'POST',
						url : "toMbUpdate",
						success : function(data) {
							console.log(data.mb_Birthday)
								insertData = "<form action=\"<c:url value='/MbUpdate'/>\" method=\"post\" enctype=\"multipart/form-data\">"
											+"<fieldset id=\"mb_modify\">"
								+"<div>"
									+"<img src=\""+data.mb_inf.mb_pic+"\" id=\"show\" width=\"200\" height=\"200\" style=\"border-radius: 50%;\"><br>"		
									+"<input id=\"myfile\" type=\"file\" name=\"file\" style=\"margin-left:90px\"/>"
									+"<input type=\"hidden\" id=\"test\" name=\"test\">"
								+"</div>"
								+"<legend>會員修改</legend>"
								+"<table class=\"table\">"
									+"<tr class=\"tr1\">"
										+"<th scope=\"col\">帳號</th>"
										+"<th scope=\"col\">生日</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
										+"<td>"+data.mb_inf.mb_Account+"</td>"
										+"<td><input type=\"date\" name=\"mb_Birthday\" id=\"birthday\" value=\""+data.mb_Birthday+"\"/></td>"
									+"</tr>"
									+"<tr class=\"tr2\">"
										+"<th scope=\"col\">地址</th>"
										+"<th scope=\"col\">電話</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
										+"<td><input type=\"text\" id=\"address\" value=\""+data.mb_inf.mb_Address+"\" name=\"mb_Address\" /></td>"
										+"<td><input type=\"text\" id=\"tel\" value=\""+data.mb_inf.mb_Tel+"\" name=\"mb_Tel\"/><span id=\"idsp6\"></span></td>"
									+"</tr>"
									+"<tr class=\"tr2\">"
										+"<th colspan=\"2\">喜好類型</th>"
									+"</tr>"
									+"<tr class=\"table-light\">"
										+"<td colspan=\"2\">"
											+"<input type=\"checkbox\" id=\"type1\" value=\"文學創作\" name=\"mb_type\" checked=\"checked\"/>文學創作" 
											+"<input type=\"checkbox\" id=\"type2\" value=\"圖文漫畫\" name=\"mb_type\" />圖文漫畫" 
											+"<input type=\"checkbox\" id=\"type3\" value=\"商業/理財\" name=\"mb_type\" />商業/理財<br>" 
											+"<input type=\"checkbox\" id=\"type4\" value=\"人文/社會\" name=\"mb_type\" />人文/社會" 
											+"<input type=\"checkbox\" id=\"type5\" value=\"藝術/生活\" name=\"mb_type\"/>藝術/生活"
											+"<input type=\"checkbox\" id=\"type6\" value=\"旅遊/飲食\" name=\"mb_type\"/>旅遊/飲食 <br>"
											+"<input type=\"checkbox\" id=\"type7\" value=\"親子/童書\" name=\"mb_type\"/>親子/童書" 
											+"<input type=\"checkbox\" id=\"type8\" value=\"學習/考用\" name=\"mb_type\"/>學習/考用" 
											+"<input type=\"checkbox\" id=\"type9\" value=\"醫療/科學\" name=\"mb_type\"/>醫療/科學"
										+"</td>"
									+"</tr>"
								+"</table>"
								+"<div>"
									+"<button type=\"submit\">送出</button>"
									+"<button type=\"reset\">清除</button>"
								+"</div>"
							+"</fieldset>"
						+"</form>"
				 			$('#change123').html(insertData);
						showImage();
						},
						error:function(){
							alert("fuck")
						}
			 });
			 })
		
			 $('#admin1').click(function(){
			$('#change123').load("//localhost:8080/BookWeb/adminall",function(){
// 				dataTable();
				console.log("11111111111111111")
			})
		})	 
			 
// 			$('#admin1').click(function(){
// 				 $.ajax({
// 						async : false,
// 						cache : false,
// 						url : "mb_inf",
// 						type : 'POST',
// 						dataType : "json",
// 						contentType : "application/json;charset=utf-8",
// 						success : function(data) {
// 							console.log(data)
							
// 								insertData += 	<div class="container media">
// 							<br>
// 							<fieldset id="admin">
// 								<legend>會員清單</legend>
// 					<label for="site-search" style="align:left">Search the site:</label>
// 					<input type="search" id="site-search" name="search" aria-label="Search through site content">
// 					<button id="searchbtn" name="searchbtn">Search</button>
// 						<form action="<c:url value='/delete' />" method="post">
// 								<table class="table"  width="100%"  id="change">
// 									<c:forEach items="${memberall}" var="u" varStatus="loop">
// 										<c:if test="${loop.index == 0}">
// 											<tr>
// 												<th>帳號</th>
// 												<th>密碼</th>
// 												<th>姓名</th>
// 												<th>註冊日期</th>
// 												<th></th>
// 												<th></th>
// 											</tr>
// 										</c:if>
// 										<tr>
// 											<td>${u.getMb_Account()}</td>
// 											<td>${u.getMb_Password()}</td>
// 											<td>${u.getMb_Name()}</td>
// 											<td>${u.getMb_Date()}</td>
// 											<td><button type="submit" name="delete"
// 													class="btn btn-outline-secondary" value="${u.getMb_ID()}">刪除</button>
// 													<button type="submit" name="update"
// 														class="btn btn-outline-secondary" value="${u.getMb_Account()}">修改</button></td>
														
// 											<td><label class="switch"> <input type="checkbox">
// 													<span id="ball" class="slider" check="${u.checkColume}"></span>
// 											</label>
// 											</td>
// 										</tr>
// 									</c:forEach>
// 								</table>
// 							</form>
// 								<a href="<c:url value='/toCity'/>">返回</a>
// 							</fieldset>
// 					</div>
		
// 						}
// 						})	 
// 			})
			 
			 
			 
		function showImage(){
        	$(document).ready(function() {
        		$("#bookWebheader").load("<c:url value='/header'/>");
        		$("#bookWebFooter").load("<c:url value='/footer'/>");		
        		       //得到当前时间
        			var date_now = new Date();
        			//得到当前年份
        			var year = date_now.getFullYear();
        			//得到当前月份
        			//注：
        			//  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一
        			//  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份
        			var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
        			//得到当前日子（多少号）
        			var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
        			//设置input标签的max属性
        			$("#birthday").attr("max",year+"-"+month+"-"+date);		
        	});
        	
    	   $("#myfile").change(function() {
   			console.log("123")
   			var readFile = new FileReader();
   			var mfile = $("#myfile")[0].files[0];  //注意這裡必須時$("#myfile")[0]，document.getElementById('file')等價與$("#myfile")[0]
   			readFile.readAsDataURL(mfile);
   			$("#test").val("abc");
   			readFile.onload = function() {
   				var img = $("#show");
   				img.attr("src", this.result);
   			}
   		});	  	   
       }
		
       
      
//        $("#admin1").click(function(){
// 			 $.ajax({
// 					async : false,
// 					type : 'POST',
// 					url : "adminall",
// 					success : function(data) {
						
// 							insertData =
    function Modify(){
    	let old = $('#old').val();
		console.log(old)
	var b1=false;
	var b2=false;
	var b3=false;
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
		$("#bookWebFooter").load("<c:url value='/footer'/>");		
		       //得到当前时间
			var date_now = new Date();
			//得到当前年份
			var year = date_now.getFullYear();
			//得到当前月份
			//注：
			//  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一
			//  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份
			var month = date_now.getMonth()+1 < 10 ? "0"+(date_now.getMonth()+1) : (date_now.getMonth()+1);
			//得到当前日子（多少号）
			var date = date_now.getDate() < 10 ? "0"+date_now.getDate() : date_now.getDate();
			//设置input标签的max属性
			$("#birthday").attr("max",year+"-"+month+"-"+date);		
	});
	$('#pwd').blur(function(){
		let pwd = document.getElementById("pwd").value
		let pwdlen = pwd.length;
		let sp = document.getElementById("idsp1")
		var rex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;
		if (pwd.length >= 6 && rex.test(pwd)) {
			b1=true;
			sp.innerHTML = "ok"
		} else if (pwd == "") {
			sp.innerHTML = "密碼不可為空白"
		} else if (pwd.length < 6) {
			sp.innerHTML = "密碼不足6碼"
		} else if (pwd != rex.test(pwd)) {
			sp.innerHTML = "密碼須包含英文、數字及特殊符號"
		} else {
			sp.innerHTML = "錯誤"
		}
	})

	$('#pwd1').blur(function(){
		let pwd = document.getElementById("pwd").value
		let pwd1 = document.getElementById("pwd1").value
		sp = document.getElementById("idsp2")
		if (pwd1 ==pwd && pwd1 != "") {
				b2=true;
			sp.innerHTML = "ok"
		} else
			sp.innerHTML = "錯誤"

	})	
		$('#Update').click(function(){
		let old = $('#old').val();
		let oldpwd = $('#oldpwd').val();
		console.log(oldpwd)
		console.log("123")
		 $.ajax({
						async : false,
						type : 'POST',
						data : {'oldpwd':oldpwd},
						url : "checkpwd",
						success : function(data) {	
						if(data){
							b3=true;						
						}else{
							b3=false;
						}
		 }
		})
		if(b1!=true || b2!=true){
			alert("資料有誤");
		}else if(b3==false){
			alert("舊密碼錯誤");
		}else{
			$('form').submit();
		}
	})
}
</script>
	<script>
		function Checkpwd() {
			let pwd = document.getElementById("pwd").value
			let pwdlen = pwd.length;
			let sp = document.getElementById("idsp1")
			var rex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;
			if (pwd.length >= 6 && rex.test(pwd)) {
				sp.innerHTML = ""
			} else if (pwd == "") {
				sp.innerHTML = "密碼不可為空白"
			} else if (pwd.length < 6) {
				sp.innerHTML = "密碼不足6碼"
			} else if (pwd != rex.test(pwd)) {
				sp.innerHTML = "密碼須包含英文、數字及特殊符號"
			} else {
				sp.innerHTML = "錯誤"
			}
		}

		function Checkpwd1() {
			let pwd = document.getElementById("pwd").value
			let pwd1 = document.getElementById("pwd1").value
			sp = document.getElementById("idsp2")
			if (pwd == pwd1 && pwd1 != "") {
				sp.innerHTML = ""
			} else
				sp.innerHTML = "錯誤"
		}
		</script>
	<script>
		$('#tel').blur(function() {
			var i, j, strTemp;
			var sp = document.getElementById("idsp6")
			var TEL = $('#tel').val();
			strTemp = "0123456789-()#";
			for (i = 0; i < TEL.length; i++) {
				j = strTemp.indexOf(TEL.charAt(i));
				if (j == -1) {
					sp.innerHTML="字元不合法"
					//說明有字元不合法    
				}else{
					sp.innerHTML=""
				}
			}
			//說明合法    
		})
		
		
		$('#editBookReport').click(function(){
			let form = $("<form method='post'></form>");
			form.attr({"action":"//localhost:8080/BookWeb/BookReport/EditBookReport"});
			$(document.body).append(form);
			form.submit();
		});
		
	</script>
	
	
</html>