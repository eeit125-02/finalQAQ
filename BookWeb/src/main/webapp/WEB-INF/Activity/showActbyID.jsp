<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
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

.btn-group .button {
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

/* .btn-group .button:hover { */
/*   background-color: #3e8e41; */
/* } */

</style>


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
		<div style='text-align:center'>
		<br>
			<h1>${aib.mb_Name}的活動創建紀錄</h1>
			<hr><br>
			<c:if test='${empty mbactlist}'>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			查無您的活動創建紀錄<br>
			</c:if>
			<c:if test='${not empty mbactlist}'>

				<table border='1' id="myTable" class="display" width="1200px">
					<thead>
					<tr>
						<th>會員ID</th>				
						<th>會員帳號</th>				
						<th>活動名稱</th>
<!-- 						<th>活動主題</th> -->
<!-- 						<th>活動日期</th> -->
<!-- 						<th>活動時間</th> -->
<!-- 						<th>活動地點</th> -->
<!-- 						<th>活動簡介</th> -->
<!-- 						<th>活動嘉賓</th> -->
<!-- 						<th>活動標籤</th> -->
<!-- 						<th>活動場所</th> -->
<!-- 						<th>活動名額</th> -->
<!-- 						<th>報名人數</th> -->
						<th >操作</th>
<!-- 						<th >刪除</th> -->
					</tr>
					</thead>


					<c:forEach var='ajb' varStatus='vs' items='${mbactlist}'>

						<tbody>
						<tr>
							<td>${aib.mb_ID}</td>
							<td>${aib.mb_Account}</td>
							<td>${ajb.act_Name}</td>
<%-- 							<td>${ajb.act_Theme}</td> --%>
<%-- 							<td>${ajb.act_Date}</td> --%>
<%-- 							<td>${ajb.act_Time}</td> --%>
<%-- 							<td>${ajb.act_Loc}</td> --%>
<%-- 							<td>${ajb.act_Intro}</td> --%>
<%-- 							<td>${ajb.act_Guest}</td> --%>
<%-- 							<td>${ajb.act_Tag}</td> --%>
<%-- 							<td>${ajb.act_Place}</td> --%>
<%-- 							<td>${ajb.act_Pax}</td> --%>
<%-- 							<td>${ajb.act_Differentpax}</td> --%>
							<td>

							<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter${ajb.act_Name}">查看</button>
							<a href="<c:url value='/showUpdateForm'/>?act_ID=${ajb.act_ID}"><button class="btn btn-outline-primary">修改</button></a>
							<a href="<c:url value='deleteAct1'/>?mb_ID=${aib.mb_ID}&act_ID=${ajb.act_ID}"><button class="btn btn-outline-danger">刪除</button></a>

							</td>
						</tr>
						</tbody>
					</c:forEach>
				</table>

			</c:if>
			<p />
			<br>
			<a href='${pageContext.request.contextPath}/showActs'><button class="btn btn-outline-info">繼續探索活動</button></a>

		</div>
	</div>
	
	
<!-- 	查看按鍵內的內容 -->
	<c:forEach var='ajb' items='${mbactlist}'>
<%-- 	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModalCenter${ajb.act_Name}">查看</button> --%>
	
<%-- 	<input type ="button" src="${ajb.act_Image}" data-toggle="modal" data-target="#exampleModalCenter${ajb.act_Name}" style="width: 345px; height: 420px; align:center" class="center"></div> --%>
										<div class="modal fade" id="exampleModalCenter${ajb.act_Name}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  										<div class="modal-dialog modal-dialog-centered" role="document">
   										 <div class="modal-content" style="width:800px; height:900px">
    									  <div class="modal-header" >
<!--     									  //彈跳視窗標頭 -->
      										  <h3 class="modal-title"  id="#exampleModalCenter${ajb.act_Name}">${ajb.act_Name}</h3>
												<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://localhost:8080/BookWeb/toLogin" data-color="default" data-size="large" data-count="false" style="display: none;"></div>
 													<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
       											 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     											     <span aria-hidden="true">&times;</span>
     												   </button>
     														 </div>
     														 
<!--      									//彈跳視窗內容 -->
     										 <div class="modal-body" style="width:800px; height:900px">
     										 <div class="container">
											 <div class="media">
     										 <input type ="image" src="${ajb.act_Image}"  style="width: 350px; height: 390px; align:center">
     										 
     										 <div class="media-body ml-5">
     										 
     										 <form  class="col-ml-4">
     										 <br>
											 <div class="form-group">
											 <div style="font-size:20px">活動標籤:<br><a href="#" class="btn btn-info" style="font-size:1em">${ajb.act_Tag}</a> 
											</div>
											 </div>
											 
											 <div class="form-group">
										     <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/date.png style="width:22px;height:22px">${ajb.act_Date}</div>
											 </div>
											 
											 <div class="form-group">
											 <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/time.png style="width:22px;height:22px">${ajb.act_Time}</div>										     									     
										     </div>
										     
										      <div class="form-group">
										     <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/map1.png style="width:22px;height:22px" >${ajb.act_Loc}</div>
										     </div>     
										     
										     <div class="form-group">
										     <div style="font-size:20px">活動嘉賓:${ajb.act_Guest}</div>
										     </div>
										     
										     <div class="form-group">
										     <div style="font-size:20px">活動名額:${ajb.act_Differentpax}/${ajb.act_Pax}</div>
										     </div>										  
										     
      										 </form>
										     </div>
										     		
										     <hr>
      										 </div>
      										 <br><br>
											<h3 align="center">活動簡介:</h3>
											<hr>
											<div>${ajb.act_Intro}</div>
											<br>
											
											
											
     									 <div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        									<input type="hidden" id="ID" value="${ajb.act_ID}">
        									<input type="hidden" id="check" value="${check}">
      										 <a href="<c:url value='/showJoinForm'/>?act_ID=${ajb.act_ID}"><button type="button" id="joinact" class="btn btn-primary">報名</button></a>       										 
     										   </div>
  											  </div>
 											 </div>
											</div>				
										   </div>
										   </div>
										   </c:forEach>
<!-- 										   </div> -->
<!--       										//頁尾 -->
									<!-- 	查看按鍵內的內容 -->
	
	

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

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
       	$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>
</html>