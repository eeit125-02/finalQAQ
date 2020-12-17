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
<title>Document</title>
<link rel="stylesheet" href="css/login.css">
c
<style>
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);

body {
	font-family: "cwTeXYen", sans-serif;
	font-weight: 800;
	line-height: 2;
	font-size: 18px;
}

fieldset {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: beige;
	width: 400px
}

legend {
	text-align: center;
	font-size: 30px;
}

p {
	margin-top: 5px;
	font-size: 10px
}

input {
	border-top: white;
	border-left: white;
	border-right: white;
	border-bottom: 1px solid gray;
}

div {
	margin-left: 50px;
}

.a11 button {
	font-size: 16px;
	text-align: center;
}

.a11 {
	margin: 0px;
	text-align: center;
}

span {
	font-size: 10px;
}

.a4 {
	margin-bottom: 25px;
}

.a5 {
	margin-bottom: 25px;
}
</style>
</head>

<body>
	<form action="<c:url value="/confirm" />" method="post">
		<fieldset>
			<legend>會員確認</legend>
			<div class="a2">
				<label >帳號:</label>
				<h3 id="mb_Account">${reg_member.mb_Account}</h3>
			</div>
			<div class="a3">
				<label>密碼:</label>
				<h3 id="mb_Password">${reg_member.mb_Password}</h3>
			</div>
			<div class="a1">
				<label>姓名:</label>
				<h3 id="mb_Name">${reg_member.mb_Name}</h3>
			</div>
			<br>
			<div class="a5">
				<label>性別:</label>
				<h3 id="mb_Sex">${reg_member.mb_Sex}</h3>
			</div>
			<div class="a6">
				<label>生日:</label>
				<h3 id="mb_Birthday">${reg_member.mb_Birthday}</h3>
			</div>
			<br />
			<div class="a7">
				<label>地址:</label>
				<h3 id="mb_Address">${reg_member.mb_Address}</h3>
			</div>
			<br />
			<div class="a8">
				<label>電話:</label>
				<h3 id="mb_Tel">${reg_member.mb_Tel}</h3>
			</div>
			<br />
			<div class="a9">
				<label>E-mail:</label>
				<h3 id="mb_Mail">${reg_member.mb_Mail}</h3>
			</div>
			<br />
			<div class="a10">
				<label>喜好類型:</label><br />
				<h3 id="mb_type">${reg_member.mb_type}</h3>
			</div>
			<div class="a11">
				<button type="button" id="submit1" name="confirm">送出</button> 
				<button><a href="<c:url value="/toRegiste" />" />返回</button>
			</div>
			<br>
		</fieldset>
			</form>
</body>
<script>
$(document).ready(function(){
	$('#submit1').click(function(){
		window.alert('註冊成功');
		$('form').eq(0).submit();
	})
})
// $('#submit1').click(function(){
// 	let mb_Account = $('#mb_Account').html();
// 	let mb_Password = $('#mb_Password').html();
// 	let mb_Name = $('#mb_Name').html();
// 	console.log(mb_Name);
// 	let mb_Sex = $('#mb_Sex').html();
// 	let mb_Birthday = $('#mb_Birthday').html();
// 	let mb_mb_Address = $('#mb_Address').html();
// 	let mb_mb_Tel = $('#mb_Tel').html();
// 	let mb_Mail = $('#mb_Mail').html();
// 	let mb_type = $('#mb_type').html();
// 	let editURL = location.href + "/upDateBookReport/"+mb_Account+"/"+mb_Password+"/"+ mb_Name+"/"+mb_Sex+"/"+mb_Birthday+"/"+mb_Address+"/"+mb_Tel+"/"+mb_Mail+"/"+mb_type;
// 	$.ajax({
// 		async : false,
// 		type : 'POST',
// 		url : editURL,
// 		dataType : "json",
// 		contentType : "application/json;charset=utf-8",
// 		success : function(data) {
// 			if(data){
// 				console.log(data);
// 			}
// 		}
// 	});
// });
</script>
</html>