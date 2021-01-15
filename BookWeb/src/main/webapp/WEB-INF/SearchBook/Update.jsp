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
<!-- CK EDITOR的東東 -->
<script src="//cdn.ckeditor.com/4.15.1/full/ckeditor.js"></script>
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
		<form:form method="POST" modelAttribute="pageresult" enctype="multipart/form-data">

			<div class="back">
				<h2 class="check">更新書目資訊</h2>
				<hr>

				<form:hidden path="bk_ID" />
				<form:hidden path="bk_BookType" />
				<form:hidden path="bk_Price" />
				<form:hidden path="bk_Click" />

					<div class="form-group">
						<form:label path="bk_Name">書名</form:label>
						<form:input path="bk_Name" class="form-control" placeholder="必填"  required="required"/>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Author">作者</form:label>
							<form:input path="bk_Author" class="form-control"
								placeholder="必填"  required="required"/>
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Translator">譯者</form:label>
							<form:input path="bk_Translator" class="form-control" />
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="bk_Publish">出版社</form:label>
							<form:input path="bk_Publish" class="form-control" required="required"
								placeholder="必填" />
						</div>

						<div class="form-group col-md-6">
							<form:label path="bk_Date">出版日期</form:label>
							<form:input path="bk_Date" class="form-control" type="date" required="required"/>
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-5" style="margin:auto">
							<form:label path="bk_Publisher_Place">出版地</form:label>
							<form:input path="bk_Publisher_Place" class="form-control" />
						</div>

						<div class="form-group col-md-5" style="margin:auto">
							<form:label path="bk_Pic">封面圖片</form:label>
							<input class="form-control" name="file" type="file" id="imgInp" required="required"/>
<%-- 							<form:input path="" class="form-control" type="file" /> --%>
<%-- 							<form:hidden path="bk_Pic" /> --%>
						</div>
						
						<div class="form-group col-md-2">
							<img id="blah" src="${pageresult.bk_Pic}" alt="圖片預覽" width="100%;" />
						</div>
					</div>


					<div class="form-row">
						<div class="form-group col-md-5">
							<form:label path="bk_ISBN">ISBN</form:label>
							<form:input path="bk_ISBN" class="form-control" placeholder="必填，請輸入數字組合"  required="required"
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						</div>

						<div class="form-group col-md-5">
							<form:label path="bk_Language">語言</form:label>
							<form:input path="bk_Language" class="form-control"/>
						</div>

						<div class="form-group col-md-2">
							<form:label path="bk_Page">頁數</form:label>
							<form:input path="bk_Page" class="form-control"  placeholder="請輸入正整數"  
							onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" 
							onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
						</div>

					</div>
					
					
					
				<br>	
				<div class="row" style="background-color:#D3D3D3;border-radius:15px;padding:10px"> 
					<div class="col-sm-2">目前類型：</div>
					<div class="col-sm-9">
		<c:forEach items="${pageresulttype}" var="row">					
					<a href="#" class="badge badge-secondary" style="font-size:1em">${row.getSearchtype().getSty_Name()}</a>
		</c:forEach>										
					</div>
					<br>
				</div>
					
					<br>
					<div class="form-row">
						<div class="form-group col-md-5">
						
						<label>書籍類型（主）</label>
						<form:select path="" class="form-control selectCategory" name="types" id="a0">
							<form:option path="" value="0" label="請選擇主類別" />                   
                        	<form:options items="${maintype}" itemLabel="sty_Name" itemValue="sty_ID"/>
						</form:select>
						</div>
						
						<div class="form-group col-md-5">
						<label>（次）</label>
<%-- 						<form:select path="" class="form-control" id="selectSubcat" name="types"> --%>
						<form:select path="" class="form-control" id="ba0" name="types">
							<form:option path="" value="0" label="請選擇子類別" />                   
<%--                         	<form:options items="${maintype}" itemLabel="sty_Name" itemValue="sty_ID"/> --%>
						</form:select>
						</div>
						
						<div class="form-group col-md-2" style="position:relative;">
						<button id="newtype" type="button" class="btn btn-outline-secondary" style="position:absolute; bottom:0px;">新增書本類型</button>
						</div>	
					</div>
					
					<div class="form-row" id="newtypeposition">
					</div>				
												
					<form:label path="bk_Content">內容簡介</form:label>
					<form:textarea path="bk_Content" class="form-control" rows="6" id="editor" />
			</div>
		
			<br>
		<div class="check">
			<button type="submit" class="btn btn-outline-danger btn-sm">確認修改</button>
		</div>
		</form:form>
	</div>

	<!-- 內容結束 -->

<script>

var count = 0;
var sbmcount = count + 1 ;

$(document).on('change', ".selectCategory", function() {
    var categoryId = $(this).val();
    var id = $(this).attr("id"); 
    var sb = "#b"+id;
    var plzsuccess = id;

    $.ajax({ 
     type: 'POST', 
     url: "searchbook/secondarytype/" + categoryId, 
     success: function(data){ 
	　  var slctSubcat=$(sb) , option=""; 
      slctSubcat.empty(); 

      for(var i=0; i<data.length; i++){ 
       option = option + "<option value='"+data[i].sty_ID + "'>"+data[i].sty_Name + "</option>"; 
      } 
      slctSubcat.append(option); 

     }, 

     error:function(){ 
    	 alert("123");
     } 

    }); 
}); 


$("#newtype").click(function(){
	
    $("#newtypeposition").append(	
			"<div class=\"form-group col-md-5\">"
			+"<label>書籍類型（主）</label>"
			+"<select class='form-control selectCategory'id=a"+sbmcount+" name='types'>"
			+"<option value='NONE'>請選擇主類別</option>"
			+"<option value='1'>文學創作</option>"
			+"<option value='10'>圖文漫畫</option>"
			+"<option value='18'>商業/理財</option>"
			+"<option value='28'>人文/社會</option>"
			+"<option value='37'>藝術/生活</option>"
			+"<option value='47'>旅遊/飲食</option>"
			+"<option value='57'>親子/童書</option>"
			+"<option value='63'>學習/考用</option>"
			+"<option value='70'>醫療/科學</option>"
			+"</select>"
			+"</div>"
			+"<div class='form-group col-md-5'>"
			+"<label>（次）</label>"
			+"<select path='' class='form-control' id=ba"+sbmcount+" name='types'>"
			+"<option path='' value='NONE' label='請選擇子類別' />"	
			+"</select>"
			+"</div>"
    );     
    sbmcount = sbmcount + 1;
});


<!-- 		CK EDITOR的東東 -->

    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );




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