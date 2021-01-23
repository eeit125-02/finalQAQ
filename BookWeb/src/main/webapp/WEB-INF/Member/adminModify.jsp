<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="memberbean.*"
	import="member.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
<!-- 	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!-- 	crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" -->
<!-- 	crossorigin="anonymous"> -->
	
<style>
/* //aaaa */
.switch {
position: relative;
display: inline-block;
width: 50px;
height: 24px;
}

.switch input {
opacity: 0;
width: 0;
height: 0;
}

.slider {
position: absolute;
cursor: pointer;
top: 0;
left: 0;
right: 0;
bottom: 0;
background-color: #ccc;
-webkit-transition: .4s;
transition: .4s;
border-radius: 34px;
}

.slider:before {
/* 未開顏色 */
position: absolute;
content: "";
height: 20px;
width: 20px;
left: 2px;
top: 2px;
background-color: white;
-webkit-transition: .4s;
transition: .4s;
border-radius: 50%;
}

input:checked + .slider {
/* 以開顏色 */
background-color: purple;
}

input:checked + .slider:before {
/* 按鈕顏色 */
-webkit-transform: translateX(26px);
-ms-transform: translateX(26px);
transform: translateX(26px);
}
/* aaaa */
#admin {
	border-radius: 25px;
	padding: 20px;
	margin: auto;
	background-color: #F3F3FA;
 	width: 100%;
	height:1900px;
/* 	text-align: center; */
/* 	min-width: 0; */
}

.a tr, .a td, .a th {
	text-align: center;
	border: 5px solid white;
	border-radius: 20px;
}

button {
	margin-right: 10px;
}

legend {
	text-align: center;
	font-size: 18px;
}


</style>
</head>
<body id="abc">
	<div class="container">
		<br>
			<fieldset id="admin" style="text-align:center">
				<legend>會員清單</legend>
<%-- 		<form action="<c:url value='admindelete' />" method="post" id="admindelete"> --%>
				<table class="table"  width="100%"  id="change">
					<c:forEach items="${memberall}" var="u" varStatus="loop">
						<c:if test="${loop.index == 0}">
							<thead><tr>
								<th>帳號</th>
								<th>姓名</th>
								<th>註冊日期</th>
								<th></th>
								<th></th>
							</tr>
							</thead>
						</c:if>
						<tr>
							<td>${u.mb_Account}</td>
							<td>${u.mb_Name}</td>
							<td>${u.mb_Date}</td>
							<td><button type="button" id="delete${u.mb_ID}"
									class="btn btn-outline-secondary" >刪除</button>								
						<input type="hidden" id="dl${u.mb_ID}" name="dl" value="${u.mb_ID}"></td>	
							<td><label class="switch"> <input type="checkbox">
									<span id="ball" class="slider" check="${u.checkColume}"></span>
							</label>
							</td>
<!-- aaa -->
						</tr>
						<script>
						$('#delete${u.mb_ID}').click(function(){
							console.log("123")
							let a = $('#dl${u.mb_ID}').val()
							alert("確定刪除")
							window.location.href="http://localhost:8080/BookWeb/admindelete?dl="+a
									console.log("+++++++++")
						})
						</script>
					</c:forEach>
				</table>
<!-- 			</form> -->
			</fieldset>
	</div>
</body>
	<script>
	$('#searchbtn').click(function(){
		console.log($('#site-search').val())
		$.ajax({
			type : 'POST',
			url : "admin_search?account=" + $('#site-search').val(),
			data:{
	// 			'search':$('#site-search').val() 
			},
			dataType : "json",
			success : function(data) {
				console.log(data.inf.checkColume)
				
				var insertData = "";
				insertData = ("<c:forEach items='"+data.inf+"' var='u'>"
							+"<tr>"
							+"<td>"+data.inf.mb_Account+"</td>"
							+"<td>"+data.inf.mb_Name+"</td>"
							+"<td>"+data.infDate+"</td>"
							+"<td><button type=\"submit\" name=\"delete\""
							+"class=\"btn btn-outline-secondary\" value=\""+data.inf.mb_ID+"\">刪除"
							+"<button type=\"submit\" name=\"update\""
							+"class=\"btn btn-outline-secondary\" value=\""+data.infcheck+"\">修改</td>"						
							+"<td><label class=\"switch\"> <input type=\"checkbox\">"
							+"<span id=\"ball\" class=\"slider\" check=\""+data.inf.checkColume+"\"></span>"
							+"</label>"
							+"</td>"
							+"</tr>"
							+"</c:forEach>")
							
			$('#change').html(insertData);
				already();
			}
		});	
	})

		$(document).ready(function() {
			already();
			dataTable();

		});
// aaaa
		function already(){
		console.log("AAA")
		$(".slider").each(function(){
			if($(this).attr("check") == "true"){
				$(this).click();
			}
		$(this).click(function(){
			let s = $(this);
			let c = s.parent().parent().parent().children('td').eq(0).html();
			console.log(c);
			$.ajax({
				type : 'POST',
				url : "adminchange",
				data:{
					'ac':c },
				success : function() {
					if (s.attr("check") == "true") {
						s.attr("check","false");
					} else {
						s.attr("check","true");
					}
				}
			});	
		})
		})
		}
// aaaa	
		function dataTable() {
			
			    $('#change').DataTable({
			     bFilter: true,
			     bPaginate: true, // 顯示換頁
			    searching: true, // 顯示搜尋
			    info: true, // 顯示資訊
			    fixedHeader: true,  // 標題置頂
			  destroy:true,
			  language:{
			      "processing": "處理中...",
			      "loadingRecords": "載入中...",
			      "lengthMenu": "顯示_MENU_項結果",
			      "zeroRecords": "沒有符合的結果",
			      "info": "顯示第_START_至_END_項結果，共_TOTAL_項",
			      "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
			      "infoFiltered": "(從_MAX_項結果中過濾)",
			      "search": "搜尋:",
			      "paginate": {
			          "first": "第一頁",
			          "previous": "上一頁",
			          "next": "下一頁",
			          "last": "最後一頁"
			      },
			      "aria": {
			          "sortAscending": ": 升冪排列",
			          "sortDescending": ": 降冪排列"
			      },
			      "select": {
			          "1": "%d 列已選擇",
			          "2": "%d 列已選擇",
			          "_": "%d 列已選擇"
			      }
			  } 
			});
		}
/* 		 "<div id=\"change123\" class=\"container\" style=\"text-align:center\">"
        +"<fieldset id=\"mb_inf\">"
        +"<legend>會員資料</legend>"
        +"<form>"
        +"<div>"
        +"<img src=\""+${login.mb_pic}+"\" style=\"width: 200px; height: 200px; text-align:center; border-radius: 50%;\"/>"
        +"</div>"
        +"<br>"
        +"<table class=\"table\" >"
        +"<tr class=\"tr1\" style=\"background-color:#68b0ab\">"
        +"<th scope=\"col\" >帳號</th>"
        +"<th scope=\"col\" >姓名</th>"
        +"</tr>"
        +"<tr class=\"table-light\">"
        +"<td>"+${login.mb_Account}+"</td>"
        +"<td>+"${login.mb_Name}+"</td>"
        +"</tr>"
	    +"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
	        +"<th scope=\"col\">性別</th>"
	        +"<th scope=\"col\">電話</th>"
	    +"</tr>"
	    +"<tr class=\"table-light\">"
	        +"<td>"+${login.mb_Sex}+"</td>" */
		
        /* <div style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
        <p>貼文會員<br>貼文時間</p>
        <h3><strong>貼文標題</strong></h3>
        <p>貼文內容</p>
   		</div> */
      
	</script>

</html>