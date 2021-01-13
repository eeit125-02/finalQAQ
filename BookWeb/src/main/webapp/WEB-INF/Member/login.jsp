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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member.css">
<style>
fieldset {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: #F3F3FA;
	width: 400px
}

legend {
	text-align: center;
	font-size: 30px;
}

#ab1 {
	text-align: center;
}

#a1 {
	text-align: left;
	margin-left: 100px;
}

.login button {
	margin: auto;
	margin-top: 20px;
	font-size: large; 
	background-color: white;
	border-radius: 10px;
	margin-bottom: 10px;
	width: 115px;
}

.sp {
	font-size: 16px;
}

form {
	margin: auto;
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

	<div class="container media" id="ab1">
		<form action="<c:url value='/login' />" method="post" id="login1">
			<fieldset>
				<legend>會員登入</legend>
				<div>
					<label>帳號:</label> <input type="text" name="account" id="account"
						size="12">
				</div>
				<div>
					<label>密碼:</label> <input type="password" name="pwd" id="pwd"
						size="12">
				</div>
				<div id="a1">
					<label for="inputCode">驗證碼：</label> <input type="text"
						id="inputCode" maxlength="7" autocomplete="off" /> <span
						id="text_show" style="text-font: 10px"></span>
				</div>
				<div align="center" style="padding: 1px 150px;">
					<div id="checkCode"></div>
					<br>
				</div>
				<div class="login" align="center">
					<button type="button" id="login123" style="margin: 5px">登入</button>
				</div>
				<div>
					<span id="sp" style="color: red"></span>
				</div>
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-3"> -->
				<!--用戶一鍵Google登入或綁定Google帳戶時使用↓-->
				<button class="btn btn-outline-dark" type="button"   style="text-transform:none ;background-color: white;">Facebook
				<img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="http://localhost:8080/BookWeb/image/FB.png" />
				</button>
				<button class="btn btn-outline-dark" type="button"  id="btnSignIn" style="text-transform:none ;background-color: white;">Google
				<img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
				</button>
				<hr />
				<div>
					<a href="<c:url value='/toRegiste' />"
						style="text-decoration: none">新帳號註冊</a>&nbsp;
					<a href="<c:url value='/toforget'/>">忘記密碼?</a>
				</div>
			</fieldset>
		<input type="hidden" id="file" name="file" value="https://firebasestorage.googleapis.com/v0/b/bookweb-50d11.appspot.com/o/member%2Fa123456?alt=media"/>
		</form>	
	</div>
	<form action="<c:url value='/toCity'/>" id="fm"></form>
	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
	<script>
		$(document).ready(function() {
			$("#bookWebheader").load("<c:url value='/header'/>");
			$("#bookWebFooter").load("<c:url value='/footer'/>");
		});

		var code;
		function createCode() {
			code = "";
			var codeLength = 6; //驗證碼的長度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b',
					'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n',
					'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
					'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
					'Y', 'Z');
			for (var index = 0; index < codeLength; index++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
			if (checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}
		var a = false;
		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			var textShow = document.getElementById("text_show")
			console.log(inputCode);
			console.log(code);
			if (inputCode.length <= 0) {
				textShow.innerHTML = "輸入驗證碼";
				textShow.style.color = "red";
				a=false
			} else if (inputCode != code) {
				textShow.innerHTML = "驗證碼有誤";
				textShow.style.color = "red";
				a=false
				// 				createCode();
			} else {
				textShow.innerHTML = "正確";
				textShow.style.color = "green";
				a = true;
			}
		}
		$('#inputCode').keyup(function() {
			validateCode();
		})

		window.onload = function() {
			// 			checkCode();
			createCode();
			document.getElementById("checkCode").onclick = function() {
				createCode()
			}
			inputCode.onclick = function() {
				validateCode();
			}
		}
		$('#login123').click(	
						function() {
							let mb_Account = $('#account').val();
							let mb_Password = $('#pwd').val();
							var sp = $("#sp");
							console.log(a)
							if (mb_Account == "" || mb_Password == "" || inputCode == "") {
								sp.text("輸入錯誤");
							}
							var editURL = location.href + "/checklogin/"
									+ mb_Account + "/" + mb_Password;
							var editURL1 = location.href + "/checkColume/"
									+ mb_Account;
							$.ajax({
								async : false,
								type : 'POST',
								url : editURL,
								dataType : "json",
								contentType : "application/json;charset=utf-8",
								success : function(data) {
									console.log(data)
									console.log(a);
									if (data && a) {
										$.ajax({
											async : false,
											type : 'POST',
											url : editURL1,
											dataType : "json",
											contentType : "application/json;charset=utf-8",
											success : function(Colume) {
												if (Colume) {
													$('#login1').submit();
												} else {
													sp.text("已被停權");
												}
											}
										});										
									} else {
										sp.text("輸入錯誤");
									}
								}
							});			
						})

		$(document).keypress(function(event) {
			var keynum = (event.keyCode ? event.keyCode : event.which);
			if (keynum == '13') {
				$("#send").click();
			}
		})
	</script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<!--CLIENT_ID請自己改成從 後端組態檔讀取，例如：ASP.net的Web.config-->
	<script type="text/javascript">
		let CLIENT_ID = "396111240196-ccf0tvsk8a723kppjblafocbfnmnbvbr.apps.googleusercontent.com";
		//let API_KEY = '';//Javascript SDK無須 API 金鑰
		// Array of API discovery doc URLs for APIs
		let DISCOVERY_DOCS = [ "https://www.googleapis.com/discovery/v1/apis/people/v1/rest" ];
	</script>
	<!--執行Google API必須的.js，callback function名稱請自訂 -->
	<!--↓https://apis.google.com/js/platform.js 或 https://apis.google.com/js/api.js 兩者網址都行得通 這裡採用跟官網寫法一樣-->
	<script async defer src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};GoogleClientInit()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()">
		
	</script>
	<!--以下請另外放置到 *.js檔案-->
	<script type="text/javascript">
		//jQuery處理button click event 當畫面DOM都載入時....
		$(function() {
			$("#btnSignIn").on("click", function() {
				$("#content").html("");//清空顯示結果
				GoogleLogin();//Google 登入
			});
			$("#btnDisconnect").on("click", function() {
				Google_disconnect();//和Google App斷連
			});
		});

		function GoogleClientInit() {
			//官網範例寫client:auth2，但本人實測由於待會要呼叫gapi.client.init而不是gapi.auth2.init，所以給client即可
			gapi.load('client', function() {
				gapi.client.init({
					//client_id 和 scope 兩者參數必填
					clientId : CLIENT_ID,
					//scope列表參考：https://developers.google.com/people/api/rest/v1/people/get
					//"profile"是簡寫，要用完整scope名稱也可以
					scope : "profile",//"https://www.googleapis.com/auth/userinfo.profile",
					discoveryDocs : DISCOVERY_DOCS
				});

			});//end gapi.load
		}//end GoogleClientInit function
		var sp = $("#sp");
		var googlename;
		var googlemail;
		function GoogleLogin() {
			let auth2 = gapi.auth2.getAuthInstance();//取得GoogleAuth物件
			auth2.signIn().then(function(GoogleUser) {
								console.log("Google登入成功");
								let user_id = GoogleUser.getId();//取得user id，不過要發送至Server端的話，為了資安請使用id_token，本人另一篇文章有範例：https://dotblogs.com.tw/shadow/2019/01/31/113026
								console.log(`user_id:${user_id}`);
								let AuthResponse = GoogleUser
										.getAuthResponse(true);//true會回傳包含access token ，false則不會
								let id_token = AuthResponse.id_token;//取得id_token
								//people.get方法參考：https://developers.google.com/people/api/rest/v1/people/get
								gapi.client.people.people
										.get(
												{
													'resourceName' : 'people/me',
													//通常你會想要知道的用戶個資↓
													'personFields' : 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
												})
										.then(
												function(res) {

													//success
													let str = JSON
															.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
													//顯示授權你網站存取的用戶個資
													console.log(res)
													console
															.log(res.result.names[0].displayName)
													console
															.log(res.result.emailAddresses[0].value)
													//↑通常metadata標記primary:true的個資就是你該抓的資料
													googlename = res.result.names[0].displayName;
													googlemail = res.result.emailAddresses[0].value;
													var pic = $("#pic").val();	
													console.log(pic);
													//請再自行Parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/
													//最終，取得用戶個資後看要填在畫面表單上或是透過Ajax儲存到資料庫(記得是傳id_token給你的Web Server而不是明碼的user_id喔)，本範例就不贅述，請自行努力XD
													var login = 'tothird'
													$.ajax({
																type : 'POST',
																url : login,
																data : {'file' : pic,'email' : googlemail,'name' : googlename
																},
																dataType : "json",
																success:function(data) {
																	console.log(pic);
																	if(data){
																	//註冊成功頁面跳轉，
																	alert("成功")
																	$('#fm').submit();
																	}else{
																		alert("已被停權");
																	}
																	}
															});
												});

							}, function(error) {
								console.log("Google登入失敗");
								console.log(error);
							});

		}//end function GoogleLogin

		function Google_disconnect() {
			let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件

			auth2.disconnect().then(function() {
				console.log('User disconnect.');
			});
		}
	</script>
</body>
</html>