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
<title>書適圈</title>
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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<style>
#mb_modify {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	height: 900px;
	width: 600px;
}

p {
	border: solid 1px border-radius:10px
}
.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}
.tr1{
background-color:#68b0ab

}

.tr2{
background-color:#e0ece4
}
/* @media ( min-width : 768px) { */
/* 	.bd-placeholder-img-lg { */
/* 		font-size: 3.5rem; */
/* 	} */
/* } */
</style>
</head>

<body>
<!-- 	<div class="container media"> -->
			<form:form method="POST" modelAttribute="MemberBean" enctype="multipart/form-data">
			<fieldset id="mb_modify">
				<div>
					<img src="${mb_inf.mb_pic}" id="show" width="200" height="200"><br>		
					<input id="myfile" type="file" name="file" style="margin-left:90px"/>
					<input type="hidden" id="test" name="test">
				</div>
				<legend>會員修改</legend>
				<table class="table">
					<tr class="tr1">
						<th scope="col">帳號</th>
						<th scope="col">生日</th>
					</tr>
					<tr class="table-light">
						<td>${account}</td>
						<td><form:input type="date" path="mb_Birthday" value="${mb_inf.mb_Birthday}"/></td>
					</tr>
					<tr class="tr2">
						<th scope="col">地址</th>
						<th scope="col">電話</th>
					</tr>
					<tr class="table-light">
						<td><form:input type="text" id="address" value="${mb_inf.mb_Address}" path="mb_Address" /></td>
						<td><form:input type="text" id="tel" value="${mb_inf.mb_Tel}" path="mb_Tel"/><span id="idsp6"></span></td>
					</tr>

					<tr class="tr2">
						<th colspan="2">E-mail</th>
					</tr>
					<tr class="table-light">
						<td colspan="2"><form:input type="email" id="mail" path="mb_Mail" value="${mb_inf.mb_Mail}"/></td>
					</tr>

					<tr class="tr2">
						<th colspan="2">喜好類型</th>
					</tr>
					<tr class="table-light">
						<td colspan="2">
							<form:checkbox  id="type1" value="文學創作 " path="mb_type" checked="checked"/>文學創作 
							<form:checkbox  id="type2" value="圖文漫畫" path="mb_type" />圖文漫畫 
							<form:checkbox  id="type3" value="商業/理財" path="mb_type" />商業/理財<br> 
							<form:checkbox  id="type4" value="人文/社會" path="mb_type" />人文/社會 
							<form:checkbox  id="type5" value="藝術/生活" path="mb_type"/>藝術/生活
							<form:checkbox  id="type6" value="旅遊/飲食" path="mb_type"/>旅遊/飲食 <br>
							<form:checkbox  id="type7" value="親子/童書" path="mb_type"/>親子/童書 
							<form:checkbox  id="type8" value="學習/考用" path="mb_type"/>學習/考用 
							<form:checkbox  id="type9" value="醫療/科學" path="mb_type"/>醫療/科學
						</td>
					</tr>
				</table>
				<div>
					<button type="submit">送出</button>
					<button type="reset">清除</button>
				</div>
			</fieldset>
		</form:form>
<!-- 	</div> -->

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
	</script>
	<script type="text/javascript">
	$(function() {
				$("#myfile").change(function() {
					var readFile = new FileReader();
					var mfile = $("#myfile")[0].files[0];  //注意這裡必須時$("#myfile")[0]，document.getElementById('file')等價與$("#myfile")[0]
					readFile.readAsDataURL(mfile);
					$("#test").val("abc");
					readFile.onload = function() {
						var img = $("#show");
						img.attr("src", this.result);
					}
				});
			})	
	</script>
</body>
</html>