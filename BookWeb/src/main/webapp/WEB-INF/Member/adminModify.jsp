<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="memberbean.*"
	import="member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
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
<title>Document</title>
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
<style>
.switch {
position: relative;
display: inline-block;
width: 50px;
height: 24px;
}

.switch input {
opacity: 0;
width: 0;
height: 0;
}

.slider {
position: absolute;
cursor: pointer;
top: 0;
left: 0;
right: 0;
bottom: 0;
background-color: #ccc;
-webkit-transition: .4s;
transition: .4s;
border-radius: 34px;
}

.slider:before {
/* 未開顏色 */
position: absolute;
content: "";
height: 20px;
width: 20px;
left: 2px;
top: 2px;
background-color: white;
-webkit-transition: .4s;
transition: .4s;
border-radius: 50%;
}

input:checked + .slider {
/* 以開顏色 */
background-color: purple;
}

input:checked + .slider:before {
/* 按鈕顏色 */
-webkit-transform: translateX(26px);
-ms-transform: translateX(26px);
transform: translateX(26px);
}
#admin {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: #F3F3FA;
	width: 1100px;
	height:1900px
}

.a tr, .a td, .a th {
	text-align: center;
	border: 5px solid white;
	border-radius: 20px;
}

form {
	margin: auto
}

button {
	margin-right: 10px;
}

legend {
	text-align: center;
	font-size: 18px;
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
</style>
</head>
<body>
	<div class="container media">
		<br>
			<fieldset id="admin">
				<legend>會員清單</legend>
	<label for="site-search" style="align:left">Search the site:</label>
	<input type="search" id="site-search" name="search" aria-label="Search through site content">
	<button id="searchbtn" name="searchbtn">Search</button>
		<form action="<c:url value='/delete' />" method="post">
				<table class="table"  width="100%"  id="change">
					<c:forEach items="${memberall}" var="u" varStatus="loop">
						<c:if test="${loop.index == 0}">
							<tr>
								<th>帳號</th>
								<th>密碼</th>
								<th>姓名</th>
								<th>註冊日期</th>
								<th></th>
								<th></th>
							</tr>
						</c:if>
						<tr>
							<td>${u.getMb_Account()}</td>
							<td>${u.getMb_Password()}</td>
							<td>${u.getMb_Name()}</td>
							<td>${u.getMb_Date()}</td>
							<td><button type="submit" name="delete"
									class="btn btn-outline-secondary" value="${u.getMb_ID()}">刪除</button>
									<button type="submit" name="update"
										class="btn btn-outline-secondary" value="${u.getMb_Account()}">修改</button></td>
										
							<td><label class="switch"> <input type="checkbox">
									<span id="ball" class="slider" check="${u.checkColume}"></span>
							</label>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
				<a href="<c:url value='/toCity'/>">返回</a>
			</fieldset>
	</div>
</body>
	<script>
	$('#searchbtn').click(function(){
		console.log($('#site-search').val())
	$.ajax({
		type : 'POST',
		url : "admin_search?account=" + $('#site-search').val(),
		data:{
// 			'search':$('#site-search').val() 
		},
		dataType : "json",
		success : function(data) {
			console.log(data.inf.checkColume)
			
			var insertData = "";
			insertData = ("<c:forEach items='"+data.inf+"' var='u'>"
						+"<tr>"
						+"<td>"+data.inf.mb_Account+"</td>"
						+"<td>"+data.inf.mb_Password+"</td>"
						+"<td>"+data.inf.mb_Name+"</td>"
						+"<td>"+data.infDate+"</td>"
						+"<td><button type=\"submit\" name=\"delete\""
						+"class=\"btn btn-outline-secondary\" value=\""+data.inf.mb_ID+"\">刪除"
						+"<button type=\"submit\" name=\"update\""
							+"class=\"btn btn-outline-secondary\" value=\""+data.infcheck+"\">修改</td>"
						
				+"<td><label class=\"switch\"> <input type=\"checkbox\">"
						+"<span id=\"ball\" class=\"slider\" check=\""+data.inf.checkColume+"\"></span>"
				+"</label>"
				+"</td>"
			+"</tr>"
		+"</c:forEach>")
		$('#change').html(insertData);
			already();
		}
	});	
})

		$(document).ready(function() {
			already();
			check();
		});
		
		function already(){
		console.log("AAA")
		$(".slider").each(function(){
			if($(this).attr("check") == "true"){
				$(this).click();
			}
		$(this).click(function(){
			let s = $(this);
			let c = s.parent().parent().parent().children('td').eq(0).html();
			console.log(c);
			$.ajax({
				type : 'POST',
				url : "adminchange",
				data:{
					'ac':c },
				success : function() {
					if (s.attr("check") == "true") {
						s.attr("check","false");
					} else {
						s.attr("check","true");
					}
				}
			});	
		})
		})
		}
	</script>

</html>