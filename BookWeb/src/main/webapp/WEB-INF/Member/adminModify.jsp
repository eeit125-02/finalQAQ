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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	
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
		<div class="form-inline">
			<div style="width:48%;" class = "ml-1">
				<canvas id="writeChart" width="400" height="400"></canvas>
			</div>
			<div style="width:48%;" class = "ml-3">
				<canvas id="viewChart" width="400" height="400"></canvas>
			</div>
		</div>
		<br>
			<fieldset id="admin" style="text-align:center">
				<legend>會員清單</legend>
<%-- 		<form action="<c:url value='admindelete' />" method="post" id="admindelete"> --%>
				<table class="table"  width="100%"  id="change">
					<c:forEach items="${memberall}" var="u" varStatus="loop">
						<c:if test="${loop.index == 0}">
							<thead><tr>
								<th style="width:200px">帳號</th>
								<th style="width:150px">姓名</th>
								<th style="width:90px">註冊日期</th>
								<th></th>
								<th></th>
							</tr>
							</thead>
						</c:if>
						<tr>
							<td>${u.mb_Account}</td>
							<td>${u.mb_Name}</td>
							<td id="date${u.mb_ID}">${u.mb_Date}</td>
							<td>
							<button type="button" id="edit${u.mb_ID}"
									class="btn btn-outline-secondary" onclick='viewData("${u.mb_Account}")' >查看</button>
							<button type="button" id="delete${u.mb_ID}"
									class="btn btn-outline-secondary" >刪除</button>
																
						<input type="hidden" id="dl${u.mb_ID}" name="dl" value="${u.mb_ID}"></td>	
							<td><label class="switch"> <input type="checkbox">
									<span id="ball" class="slider" check="${u.checkColume}"></span>
							</label>
							</td>
<!-- aaa -->
						</tr>
						<script>
						var thisTime =  "${u.mb_Date}";
						var splitTime = thisTime.split(" ")[0];
						console.log(splitTime);
						$('#date${u.mb_ID}').html(splitTime);
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
	
	var writeChart = document.getElementById("writeChart");
	var viewChart = document.getElementById("viewChart");
	
	var monthWriteName;
	var monthWriteNum;
	
	var monthViewName;
	var monthViewNum;
	
	
	$.ajax({
		async : false,
		type : 'POST',
		url : "http://localhost:8080/BookWeb/Admin/getSexRatio",
		dataType : "json",
		success : function(data) {
			monthWriteName = data.name
			monthWriteNum = data.value
		}
	});
	
	$.ajax({
		async : false,
		type : 'POST',
		url : "http://localhost:8080/BookWeb/Admin/getRegistereMonth",
		dataType : "json",
		success : function(data) {
			monthViewName = data.name
			monthViewNum = data.value
		}
	});
	
	var myChart = new Chart(writeChart, {
	    type: 'pie',
	    data: {
	        labels: monthWriteName,
	        datasets: [{
	        	label: '人數',
	            data: monthWriteNum,
	            fill: false,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ]
	        }],
	    },
	    options: {
			title: {
				display: true,
				fontSize: 16,
				text: '會員男女比例'
			}
		}
	});
	
	var myChart = new Chart(viewChart, {
	    type: 'bar',
	    data: {
	        labels: monthViewName,
	        datasets: [{
	        	label: '人數',
	            data: monthViewNum,
	            fill: false,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.5)',
	                'rgba(54, 162, 235, 0.5)',
	                'rgba(255, 206, 86, 0.5)',
	                'rgba(75, 192, 192, 0.5)',
	                'rgba(153, 102, 255, 0.5)',
	                'rgba(255, 159, 64, 0.5)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ]
	        }],
	    },
	    options: {
			title: {
				display: true,
				fontSize: 20,
				text: '近半年活動發布數量'
			}
		}
	});
	
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
		
		function viewData(selectId){
			console.log(selectId)
			var insertHtml;
			$.ajax({
				async : false,
				type : 'POST',
				url : "http://localhost:8080/BookWeb/Admin/getMemebr",
				data :{ member : selectId },
				dataType : "json",
				success : function(data) {
					console.log(data)
					insertHtml =  "<div id=\"change123\" class=\"container\" style=\"text-align:center\">"
							        +"<fieldset id=\"mb_inf\">"
							        +"<legend>會員資料</legend>"
							        +"<form>"
							        +"<div>"
							        +"<img src=\""+ data.mbPic +"\" style=\"width: 200px; height: 200px; text-align:center; border-radius: 50%;\"/>"
							        +"</div>"
							        +"<br>"
							        +"<table class=\"table\" >"
							        +"<tr class=\"tr1\" style=\"background-color:#68b0ab\">"
							        +"<th scope=\"col\" >帳號</th>"
							        +"<th scope=\"col\" >姓名</th>"
							        +"</tr>"
							        +"<tr class=\"table-light\">"
							        +"<td>"+ data.mbAccount +"</td>"
							        +"<td>"+data.mbName+"</td>"
							        +"</tr>"
							   		+"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
							        +"<th scope=\"col\">性別</th>"
							        +"<th scope=\"col\">電話</th>"
								    +"</tr>"
								    +"<tr class=\"table-light\">"
							        +"<td>"+data.mbSex+"</td>"
							        +"<td>"+data.mbTel+"</td>"
								    +"</tr>"
								    +"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
							        +"<th colspan=\"2\">生日</th>"
								    +"</tr>"
								    +"<tr class=\"table-light\">"
							        +"<td colspan=\"2\">"+data.mbBirthday+"</td>"
								    +"</tr>"
								    +"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
							      	+"<th colspan=\"2\">Email</th>"
							    	+"</tr>"
							    	+"<tr class=\"table-light\">"
							        +"<td colspan=\"2\">"+data.mbMail+"</td>"
							    	+"</tr>"
			
							    	+"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
							        +"<th colspan=\"2\">地址</th>"
							    	+"</tr>"
							    	+"<tr  class=\"table-light\">"
							        +"<td colspan=\"2\">"+data.mbAddress+"</td>"
							    	+"</tr>"
							    	+"<tr class=\"tr2\" style=\"background-color:#e0ece4\">"
							        +"<th colspan=\"2\">喜好類型</th>"
							        +"</tr>"
							    	+"<tr  class=\"table-light\">"
							        +"<td colspan=\"2\">"+data.mbType+"</td>"
							    	+"</tr>"
									+"</table>"
									+"</form>"
									+"</fieldset>"
									+"</div>"
							   
									swal.fire({
										  width: '850px',
										  html: insertHtml,  
										  confirmButtonText: "ok"
									});
				}
			});
			
		}
		
		
		
      
	</script>

</html>