<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
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

th{
text-align:center;
}

td{
width:100px;
border:solid 1px;
text-align:center;
}
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
       	$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>
<title>書適圈</title>
</head>
<body>

	<!-- header -->
	<header class=" blog-header " id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container media">
		<br>




		<p>&nbsp;</p>
		<hr>
		<div style="text-align:center">
		<br>
			<h1>${name}的報名紀錄</h1>
			<hr><br>
			<c:if test='${empty mbjoinlist}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			查無您的報名紀錄<br>
			</c:if>
			<c:if test='${not empty mbjoinlist}'>

				<table border='1' id="myTable" class="display" width="1200px">
				<thead>
					<tr>
						<th>會員ID</th>				
						<th>會員帳號</th>				
						<th>活動名稱</th>
						<th>會員名稱</th>
						<th>email</th>
						<th>聯絡電話</th>
						<th>操作</th>
					</tr>
					</thead>


					<c:forEach var='ajb' varStatus='vs' items='${mbjoinlist}'>

						<tbody>
						<tr>
							<td>${ajb.member.mb_ID}</td>
							<td>${ajb.member.mb_Account}</td>
							<td>${ajb.act.act_Name}</td>
							<td>${ajb.member.mb_Name}</td>
							<td>${ajb.member.mb_Mail}</td>
							<td>${ajb.member.mb_Tel}</td>
							<td>
							<a href="<c:url value='/showJoinUpdateForm'/>?join_ID=${ajb.join_ID}"><button class="btn btn-outline-info">修改</a></button>
							<a href="<c:url value='deleteJoin'/>?join_ID=${ajb.join_ID}&act_ID=${ajb.act.act_ID}"><button class="btn btn-outline-info">刪除</a></button>
							</td>			
						</tr>
						</tbody>
					</c:forEach>
				</table>
			
			</c:if>
			<p />
			<br>

			<a href='${pageContext.request.contextPath}/showActs'><button class="btn btn-outline-info">繼續探索活動</button></a>
<!-- 			<button onclick="window.location.href='showCreateForm'">新增活動1</button> -->
		</div>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->
</body>
<script>
$(document).ready(function () {
    $('#myTable').DataTable({
     bFilter: true,
     bPaginate: true, // 顯示換頁
     searching: true, // 顯示搜尋
     info: true, // 顯示資訊
     fixedHeader: true,  // 標題置頂
     destroy:true,
  	 language:{
      "processing": "處理中...",
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
});
</script>
</html>