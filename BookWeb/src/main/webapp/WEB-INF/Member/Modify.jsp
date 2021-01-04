<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
#mb_pwd {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	height: 900px;
	width: 600px
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
</style>
</head>

<body>
		<form action="<c:url value='/Update'/>" method="post">
			<fieldset id="mb_pwd">
				<legend>會員個資</legend>
				<table class="table" >
					<tr class="tr1">
						<th colspan="2">帳號</th>
					</tr>
					<tr class="table-light">
						<td colspan="2">${account}</td>
					</tr>
					<tr class="tr2">
						<th colspan="2" >密碼
						<p style="color: gray; margin:0px;">(1.不可空白，2.至少6個字且必須包含英文字母、數字)</p>
						</th>
					</tr>
					<tr class="table-light">
						<td><input type="password" name="pwd" id="pwd" 
						value="" size="12" onblur="Checkpwd()"style=""><span id="idsp1" style="color: red"></span></td>
					</tr>
					<tr class="tr2">
						<th colspan="2">確認密碼</th>
					</tr>
					<tr class="table-light">
						<td><input type="password" name="pwd1" id="pwd1"
						value="" size="12" onblur="Checkpwd1()"><span id="idsp2" style="color: red"></span></td>
					</tr>
					</table>
					<button type="submit" name="Update">送出</button>
					<button type="reset">清除</button>
			</fieldset>
				</form>
	<script>

		function Checkpwd() {
			let pwd = document.getElementById("pwd").value
			let pwdlen = pwd.length;
			let sp = document.getElementById("idsp1")
			var rex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/;
			if (pwd.length >= 6 && rex.test(pwd)) {
				sp.innerHTML = "正確"
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
				sp.innerHTML = "正確"
			} else
				sp.innerHTML = "錯誤"

		}
	</script>
</body>

</html>