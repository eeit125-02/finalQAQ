<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <link rel="stylesheet" href="import.css">   -->
<style>
@import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
body{
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

.a2 input, .a1 input, .a5 input, .a6 input {
	background-color: rgb(206, 203, 203);
}

div {
	margin-left: 50px;
}

.a11 {
	text-align: center;
}

.a11 input {
	font-size: 16px;
	text-align: center;
	border: 1px solid rgb(206, 203, 203);
	background-color: rgb(233, 162, 115);
	border-radius: 15px;
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
<%-- 	<jsp:useBean id="Member" class="model.MemberBean" scope="session" /> --%>
	<form action="./Login" method="post">
		<fieldset>
			<legend>會員修改</legend>
			<div class="a2">
				<label>帳號:</label>
				<jsp:getProperty name="Member" property="mB_Account" />
				<span id="idsp2"></span><br />
				<p style="color: gray;">(1.不可空白 2.至少6個字且必須包含英文字母、數字)</p>
			</div>
			<div class="a3">
				<label>密碼:</label> <input type="password" name="pwd" id="pwd"
					value="" size="12" onblur="Checkpwd()"> <span id="idsp1"></span><br />
				<p style="color: gray;">(1.不可空白，2.至少6個字且必須包含英文字母、數字)</p>
			</div>
			<div class="a4">
				<label>確認密碼:</label> <input type="password" name="pwd1" id="pwd1"
					value="" size="12" onblur="Checkpwd1()"> <span id="idsp9"></span><br />
			</div>

			<!--  <div class="a1">
            <label>姓名:</label>
            <input type="text" id="name" name="name" size="12" value="" readonly>
        </div><br>
        <div class="a5">
            <label>性別:</label>
            <input type="radio" name="sex" id="sex_m" onblur="" value="男">男
            <input type="radio" name="sex" id="sex_g" onblur="" value="女">女
            <span id="idsp3"></span>
        </div>
        <div class="a6">
            <label>生日:</label>
            <input type="date" name="date" id="date" onblur="" readonly>
            <span id="idsp4"></span><br />
        </div><br />
        <div class="a7">
            <label>地址:</label>
            <input type="text" name="address" id="address" onblur="">
            <span id="idsp5"></span><br />
        </div><br />
        <div class="a8">
            <label>電話:</label>
            <input type="text" name="tel" id="tel" onblur="">
            <span id="idsp6"></span><br />
        </div><br />
        <div class="a9">
            <label>E-mail:</label>
            <input type="email" name="mail" id="mail" onblur="">
            <span id="idsp7"></span><br />
        </div><br />
        <div class="a10">
            <label>喜好類型:</label><br />
            <input type="checkbox" name="type" id="type1" value="中">XX
            <input type="checkbox" name="type" id="type2" value="新">XX
            <input type="checkbox" name="type" id="type3" value="七">XX
            <input type="checkbox" name="type" id="type4" value="七">XX
            <input type="checkbox" name="type" id="type5" value="八">XX<br>
            <input type="checkbox" name="type" id="type6" value="九">XX
            <input type="checkbox" name="type" id="type7" value="十">XX
            <input type="checkbox" name="type" id="type8" value="十1">XX
            <input type="checkbox" name="type" id="type9" value="二">XX
            <span id="idsp8"></span><br />
        </div><br>-->
			<div class="a11">
				<input type="submit" name="update" value="送出"></input> <input
					type="reset" value="清除"></input>
			</div>
		</fieldset>


		<script>
			// function Checkname() {
			//     let name = document.getElementById("name").value
			//     let namelen = name.length;
			//     let sp = document.getElementById("idsp")
			//     var rex = /^[\u4E00-\u9FA5]+$/;
			//     if (name.length >= 2 && rex.test(name) && name != "") {
			//         sp.innerHTML = "正確"
			//     }
			//     // else if(name==""){
			//     //     sp.innerHTML="不可為空白"
			//     // }else if(name != rex.test(name)){
			//     //     sp.innerHTML="請輸入中文"
			//     // }else if(name.length <= 1){
			//     //     sp.innerHTML="長度必須大於2"
			//     // }
			//     else {
			//         sp.innerHTML = "錯誤"
			//     }
			// }

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

			function Checkaccount() {
				let account = document.getElementById("account").value
				let accountlen = account.length;
				let sp = document.getElementById("idsp2")
				var rex1 = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/
				if (account == "") {
					sp.innerHTML = "不可為空白"
				} else if (rex1.test(account) && accountlen >= 6) {
					sp.innerHTML = "正確"
				} else {
					sp.innerHTML = "格式錯誤"
				}
			}

			function Checkpwd1() {
				let pwd = document.getElementById("pwd").value
				let pwd1 = document.getElementById("pwd1").value
				sp = document.getElementById("idsp9")
				if (pwd == pwd1 && pwd1 != "") {
					sp.innerHTML = "正確"
				} else
					sp.innerHTML = "錯誤"

			}
			// function Checkdate(){
			//     let date = document.getElementById("dates").value
			//     let sp=document.getElementById("idsp2")
			//     InputDate = date.replace(/-/g,"/");
			//     let d = new Date(InputDate)
			//     let dates1 = InputDate.split("/")
			//     if(dates1[0]== d.getFullYear() && dates1[1] == (d.getMonth() + 1) && dates1[2] == d.getDate()){
			//         sp.innerHTML="正確"
			//     }else 
			//     sp.innerHTML="錯誤"
			// }
		</script>
	</form>
</body>

</html>