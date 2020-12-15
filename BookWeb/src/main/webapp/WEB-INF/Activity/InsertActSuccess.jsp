<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' />
<meta charset="UTF-8">
<title>新增活動成功</title>
</head>
<body>
<h1>新增活動成功</h1>
<!-- 
本文件顯示會員資料新增成功的訊息，要顯示的會員資料由Controller放入『Session範圍』內
，成為Session物件的屬性物件，識別字串為mb, 我們將屬性物件內的帳號與姓名取出，放在
本文件中，一起送回給瀏覽器
-->
親愛的(帳號:${ab.MB_ID})<br>
您已成功新增活動 ,謝謝

</p>
<a href='${pageContext.request.contextPath}/ActHomepage.jsp'>回到活動管理</a>

</body>
</html>