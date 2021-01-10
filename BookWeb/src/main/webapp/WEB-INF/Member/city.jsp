<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
	background-color: #F3F3FA;
	height:300px;
	width: 200px;
	float:left;
}
 
legend {
	text-align: center;
}

div {
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
</style>
</head>
<body>
<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->
	<div class="container media" style="width:1500px; margin-left:400px" >
	<fieldset id="city">
		<legend>會員中心</legend>
		<div>
				<div><button  id="admin1" name="admin" class="btn btn-outline-secondary">會員資訊</button>
				</div>
				<div><button  id="inf" name="mb_inf" class="btn btn-outline-secondary">會員資訊</button>
				</div>
				<div><button  id="third" name="third" class="btn btn-outline-secondary">會員資訊</button>
				</div>
				<button  id="Modify" name="Modify" class="btn btn-outline-secondary">會員修改</button>
				<div>
				<button  id="pwdModify" name="pwdModify" class="btn btn-outline-secondary">密碼修改</button>
				</div>
				<form name=a3 class=a3 action="<c:url value='/collectlist' />" method="get">
				<div>
				<button type="submit" name="list" class="btn btn-outline-secondary">收藏清單</button>
				</div>
			
			</form>
		</div>
	</fieldset>
	<div id="change123" style="width:900px;margin-left:10px ">
									<fieldset id="mb_inf">
									<legend>會員資料</legend>
									<form>
									<div>
									<img src="${loginUser.mb_pic}" style="width: 200px; height: 200px; text-align:center; border-radius: 50%;"/>
									</div>
									<br>
									<table class="table" >
								    <tr class="tr1">
									<th scope="col" >帳號</th>
									<th scope="col" >姓名</th>
									</tr>
									<tr class="table-light">
									<td>${loginUser.mb_Account}</td>
									<td>${loginUser.mb_Name}</td>
									</tr>

								<tr class="tr2">
									<th scope="col">性別</th>
									<th scope="col">電話</th>
								</tr>
								<tr class="table-light">
									<td>${loginUser.mb_Sex}</td>
									<td>${loginUser.mb_Tel}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">生日</th>
								</tr>
								<tr class="table-light">
									<td colspan="2">${loginUser.mb_Birthday}</td>
								</tr>

								<tr class="tr2">
					      		<th colspan="2">Email</th>
								</tr>
								<tr class="table-light">
									<td colspan="2">${loginUser.mb_Mail}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">地址</th>
								</tr>
								<tr  class="table-light">
									<td colspan="2">${loginUser.mb_Address}</td>
								</tr>

								<tr class="tr2">
									<th colspan="2">喜好類型</th>
									</tr>
								<tr  class="table-light">
									<td colspan="2">${loginUser.mb_type}</td>
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
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
        $("#bookWebFooter").load("<c:url value='/footer'/>");
	}); 
	$('#admin1').click(function(){
		$('#change123').load("//localhost:8080/BookWeb/adminall")
	})
        var check = $("#test").val();
        if(check=="third"){
        	$("#inf").hide();
			$("#pwdModify").hide();
			$("#admin1").hide();
		}else if(check=="admin"){
			$("#pwdModify").hide();
			$("#Modify").hide();
			$("#inf").hide();
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
										+"<td><input type=\"date\" name=\"mb_Birthday\" value=\""+data.mb_Birthday+"\"/></td>"
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
		
		function showImage(){
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
	</script>
</html>