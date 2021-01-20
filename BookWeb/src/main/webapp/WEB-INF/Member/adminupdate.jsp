<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- <link rel="stylesheet" href="login.css">   -->
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
/* @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css); */
/* body { */
/* 	font-family: "cwTeXYen", sans-serif; */
/* 	font-weight: 800; */
/* 	line-height: 2; */
/* 	font-size: 18px; */
/* } */

#adminupdate {
	border-radius: 25px;
	padding: 20px;
	background-color:#F3F3FA;
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

.send button {
	font-size: 16px;
	text-align: center;
}

.send {
	margin: 0px;
	text-align: center;
}

span {
	font-size: 10px;
}

.space { 
 	margin-bottom: 25px; 
 } 

form{
margin:auto
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>

<div class="container media"><br>
	
		<form action="<c:url value='/adminupdate' />" method="post">
			<fieldset id="adminupdate">
				<legend>會員修改</legend>
				<input name="account" value="${member.mb_Account}" type="hidden">
				<div>
					<label>密碼:</label> <input type="password" name="pwd" id="pwd"
						value="" size="12" onblur="Checkpwd()"> <span id="idsp1"></span><br />
				</div><br>
				<div>
					<label>姓名:</label> <input type="text" id="name" name="name"
						size="12" value="${member.mb_Name}">
				</div>
				<br>
<!-- 				<div class="space"> -->
<!-- 					<label>性別:</label> <input type="radio" name="sex" id="sex_m" -->
<!-- 						onblur="" value="男">男 <input type="radio" name="sex" -->
<!-- 						id="sex_g" onblur="" value="女">女 <span id="idsp3"></span> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<label>生日:</label> <input type="date" name="date" id="date" -->
<!-- 						onblur=""> <span id="idsp4"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
				<div>
					<label>地址:</label> <input type="text" name="address" id="address"
						value="${member.mb_Address}"> <span id="idsp5"></span><br />
				</div>
				<br />
				<div>
					<label>電話:</label> <input type="text" name="tel" id="tel" value="${member.mb_Tel}">
					<span id="idsp6"></span><br />
				</div>
				<br />
				<div>
					<label>E-mail:</label> <input type="email" name="mail" id="mail"
						value="${member.mb_Mail}"> <span id="idsp7"></span><br />
				</div>
				<br>
<!-- 				<div> -->
<%-- 					<label>頭像:</label> <input type="file" name="pic" id="pic" value="${member.mb_pic}"> --%>
<!-- 					<span id="idsp7"></span><br /> -->
<!-- 				</div> -->
<!-- 				<br /> -->
<!-- 				<div> -->
<!-- 					<label>喜好類型:</label><br /> <input type="checkbox" name="type" -->
<!-- 						id="type1" value="中">XX <input type="checkbox" name="type" -->
<!-- 						id="type2" value="新">XX <input type="checkbox" name="type" -->
<!-- 						id="type3" value="七">XX <input type="checkbox" name="type" -->
<!-- 						id="type4" value="七">XX <input type="checkbox" name="type" -->
<!-- 						id="type5" value="八">XX<br> <input type="checkbox" -->
<!-- 						name="type" id="type6" value="九">XX <input type="checkbox" -->
<!-- 						name="type" id="type7" value="十">XX <input type="checkbox" -->
<!-- 						name="type" id="type8" value="十1">XX <input -->
<!-- 						type="checkbox" name="type" id="type9" value="二">XX <span -->
<!-- 						id="idsp8"></span><br /> -->
<!-- 				</div> -->
				<br>
				<div class="send">
					<button type="submit" name="submit" id="submit" value="${id}">送出</button>
					<button type="reset" value="清除">清除</button>
				</div>
			</fieldset>
		</form>

	</div>

</body>

</html>