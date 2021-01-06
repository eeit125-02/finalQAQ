<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        div {
            text-align: center;
            margin: 30px;
            margin-bottom: 10px;
           
        }
    
    </style>
</head>
<body>
    <fieldset>
        <legend>尋找密碼</legend>
        <p>請輸入電子郵件或手機號碼</p>
        <hr>
        <form action="<c:url value='/JavaMail' />" method="post">
        <div>
            <input type="text" id="" name="mail">
            <span><button id="send1">送出</button></span>
        </div>
        </form>
    </fieldset>
</body>
<script>
	$("#send1").click(function(){
		alert("請至信箱收取信件後再行登入");
		$('form').submit();
	})
</script>
</html>