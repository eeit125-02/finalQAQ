<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
.check{
	text-align: center;
}
.back{
    margin: auto;
    width: 815px;
}
span{
	color: red;
	font-size: 10px;
}
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">
<!-- 		<label id="test"></label> -->

		<!-- 內容開始 -->
		<form:form method="POST" modelAttribute="newonebook" id="form" enctype="multipart/form-data">

			<div class="back">
				<h2 class="check">新增書目資訊</h2>
				<hr>

				<form:hidden path="bk_ID" name="page"/>
				<form:hidden path="bk_BookType" />
				<form:hidden path="bk_Price" />

					<div class="form-group">
						<form:label path="bk_Name">書名</form:label><span id="idsp1">　</span><br />
						<form:input path="bk_Name" id="bk_Name" class="form-control" placeholder="必填"  required="required" />
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Author">作者</form:label><span id="idsp2">　</span><br />
							<form:input path="bk_Author" id="bk_Author" class="form-control" required="required"
								placeholder="必填" />
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Translator">譯者</form:label><span id="idsp3">　</span><br />
							<form:input path="bk_Translator" id="bk_Translator" class="form-control" />
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Publish">出版社</form:label><span id="idsp4">　</span><br />
							<form:input path="bk_Publish" id="bk_Publish" class="form-control" required="required"
								placeholder="必填" />
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Date">出版日期</form:label><span id="idsp5">　</span><br />
							<form:input path="bk_Date" id="bk_Date" class="form-control" type="date" required="required" placeholder="必填" />
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-5" style="margin:auto">
							<form:label path="bk_Publisher_Place">出版地</form:label><span id="idsp6">　</span><br />
							<form:input path="bk_Publisher_Place" id="bk_Publisher_Place" class="form-control" />
						</div>

						<div class="form-group col-md-5" style="margin:auto">
							<form:label path="bk_Pic">封面圖片</form:label><span id="idsp7">　</span><br />
							<input class="form-control" name="file" type="file" id="imgInp"/>
							
<%-- 							<form:input path="bk_Pic" class="form-control" name="file" type="file" /> --%>
<%-- 							<form:hidden path="bk_Pic" /> --%>
						</div>
						<div class="form-group col-md-2">
							<img id="blah" src="${pageContext.request.contextPath}/image/bottlestar.png" alt="圖片預覽" width="100%;" />
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-5">
							<form:label path="bk_ISBN">ISBN</form:label><span id="idsp8">　</span><br />
							<form:input path="bk_ISBN" id="bk_ISBN" class="form-control" placeholder="必填，請輸入數字組合"  required="required"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						</div>

						<div class="form-group col-md-5">
							<form:label path="bk_Language">語言</form:label><span id="idsp9">　</span><br />
							<form:input path="bk_Language" id="bk_Language" class="form-control" />
							<%-- 	    <form:checkboxes path="bk_Language" /> --%>
							<!--       <label for="inputState">語言</label> -->
							<!--       <select id="inputState" class="form-control"> -->
							<!--         <option selected>繁體中文</option> -->
							<!--         <option>簡體中文</option> -->
							<!--         <option>英文</option> -->
							<!--         <option>日文</option> -->
							<!--         <option>德文</option> -->
							<!--         <option>法文</option> -->
							<!--       </select> -->
						</div>

						<div class="form-group col-md-2">
							<form:label path="bk_Page">頁數</form:label><span id="idsp10">　</span><br />
							<form:input path="bk_Page" type="number" id="bk_Page" class="form-control" placeholder="請輸入整數"  />
<%-- 							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  --%>
<%-- 							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" --%>
							
						</div>
					</div>
					
<%-- <form:form method="POST" modelAttribute="typeForm" id="form1" enctype="multipart/form-data">						 --%>
					<div class="form-row">
						<div class="form-group col-md-6">
						<label>書籍類型</label>
<%-- 						<form:select path="sty_Name" class="form-control" > --%>
						<form:select path="" class="form-control" >
							<form:option path="" value="NONE" label="請選擇主類別" />                   
                        	<form:options items="${maintype}" itemLabel="sty_Name"/>
						</form:select>
						</div>
						
						<div class="form-group col-md-6">
						<label>書籍類型</label>
						<form:select path="" class="form-control" placeholder="請選擇子類別"></form:select>
					
						</div>
					</div>
<%-- </form:form> --%>
										
					<form:label path="bk_Content">內容簡介</form:label><span id="idsp11">　</span><br />
					<form:textarea path="bk_Content" id="bk_Content" class="form-control" rows="6" />
			</div>
		
			<br>
		<div class="check">
			<button id="send" type="submit" class="btn btn-outline-danger btn-sm">確認新增</button>
		</div>
		</form:form>
	</div>

	<!-- 內容結束 -->

<script>

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}

	$("#imgInp").change(function() {
	  readURL(this);
	});

</script>

	<!-- body -->

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>
</html>