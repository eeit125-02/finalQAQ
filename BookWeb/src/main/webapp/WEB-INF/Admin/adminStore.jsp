<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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

.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.messageSize{
	 font-size: 20px;
}
.starSize{
	 font-size: 30px;
	 collor: yellow;
}
.checked {
  font-size: 30px;
  color: orange;
}
.unchecked {
	font-size: 30px;
}
</style>

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
<br>
<div>
	<table id="bookReport_Table" class="display">
	    <thead>
	        <tr>
	            <th>編號</th>
	            <th>會員帳號</th>
	            <th style="width:200px">標題</th>
	            <th>價格</th>
	            <th>撰寫日期</th>
	            <th>操作</th>
	        </tr>
	    </thead>
	    <tbody id="bookReportList">
	        <tr>
	            <td>帳號</td>
	            <td>撰寫編號</td>
	            <td>閱讀標題</td>
	            <td>撰寫時間</td>
	            <td>
	            	<button type="button" class="btn btn-outline-primary" value = "brID">查看</button>
	            	<button type="button" class="btn btn-outline-danger ml-3" value = "brId">刪除</button>
	            </td>
	        </tr>
	    </tbody>
	</table>
</div>


<Script>
	
	var writeChart = document.getElementById("writeChart");
	var viewChart = document.getElementById("viewChart");
	
	var monthWriteName;
	var monthWriteNum;
	
	var monthViewName;
	var monthViewNum;
	
	
	$.ajax({
		async : false,
		type : 'POST',
		url : "http://localhost:8080/BookWeb/Admin/getStoreMonthPrice",
		dataType : "json",
		success : function(data) {
			monthWriteName = data.name
			monthWriteNum = data.value
		}
	});
	
	$.ajax({
		async : false,
		type : 'POST',
		url : "http://localhost:8080/BookWeb/Admin/getStoreMonthPsc",
		dataType : "json",
		success : function(data) {
			monthViewName = data.name
			monthViewNum = data.value
		}
	});
	
	var myChart = new Chart(writeChart, {
	    type: 'line',
	    data: {
	        labels: monthWriteName,
	        datasets: [{
	        	label: '金額',
	            data: monthWriteNum,
	            fill: false,
	            backgroundColor: 'rgba(255, 99, 132)',
	            borderColor: 'rgba(255, 99, 132)'
	        }],
	    },
	    options: {
			title: {
				display: true,
				fontSize: 20,
				text: '近半年交易金額'
			}
		}
	});
	
	var myChart = new Chart(viewChart, {
	    type: 'bar',
	    data: {
	        labels: monthViewName,
	        datasets: [{
	        	label: '數量',
	            data: monthViewNum,
	            fill: false,
	            backgroundColor: 'rgba(54, 162, 235, 1)',
	            borderColor: 'rgba(54, 162, 235, 1)'
	        }],
	    },
	    options: {
			title: {
				display: true,
				fontSize: 20,
				text: '近半年交易數量'
			}
		}
	});
	
	var reportTable;
	var star = 0;

	$(document).ready( function () {
		getDataTable();
	})
	
	function getDataTable(){
		reportTable = $('#bookReport_Table').DataTable({
			"ajax": {
	            "url": "http://localhost:8080/BookWeb/Admin/getAllStrore",
	            "type": "POST",
	            "dataSrc": ""
	        },
	        "deferRender": true,
	        "columns": [
	        	 { "data": "bsId" },
	            { "data": "bsAccount" },
	            { "data": "bkName" },
	            { "data": "bsPrice" },
	            { "data": "bsDate" },
	            { data: "bsId",
	              render: function (data, type, row, meta) { 
	                    return "<button type=\"button\" class=\"btn btn-outline-primary\" onclick='viewData(" + data + ")' value = \""+ data +"\">查看</button>"
			               + "<button type=\"button\" class=\"btn btn-outline-danger ml-3\" onclick='DelData(" + data + ")' value = \""+ data +"\">刪除</button>";

                  }
	            }
	        ],
			destroy: true,
        	language: {
       			"emptyTable": "無資料...",
       			"processing": "處理中...",
       		  	"loadingRecords": "載入中...",
       		  	"lengthMenu": "顯示 _MENU_ 項結果",
       		  	"zeroRecords": "沒有符合的結果",
       		  	"info": "共 _TOTAL_ 項",
       		  	"infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
       		  	"infoFiltered": "(從 _MAX_ 項結果中過濾)",
       		  	"infoPostFix": "",
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
       		  	}
       		}
        }); 
	}
	
	/* function viewData(reportId){
		var insertHtml;
		$.ajax({
			async : false,
			type : 'POST',
			url : "http://localhost:8080/BookWeb/Admin/getStore",
			data: {store:reportId}
			dataType : "json",
			success : function(data) {
				
				insertHtml = "<div class=\"row\">"
						   	+ "<div class=\"col-lg-4\">"
						   	+ "<label for=\"url\"></label> <img alt=\"圖勒?\" width=\"300px\" height=\"400px\" src=\""+data.bkPic+"\"/>"
						   	+ "</div>"
						   	+ "<div class=\"col-lg-8\">"
							+ "<h5>賣場編號:</h5>"
							+ "<span>" + data.bksID + "</span>"
							+ "<hr>"
							+ "<h5>賣家名子:</h5>"
							+ "<span>"+ data.mbName +"</span>"
							+ "<hr>"
							+ "<h5>上架時間:</h5>"
							+ "<span>"+ data.bksDate +"</span>"
							+ "<hr>"
							+ "<h5>書本價格:</h5>"
							+ "<span>"+ data.bsPrice +"</span>"
							+ "<hr>"
							+ "<h5>庫存:</h5>"
							+ "<span>" + data.bsNum +"</span>"
							+ "</div>"
							+ "</div>"
						   
			   swal.fire({
					  width: '850px',
					  html: insertHtml,  
					  confirmButtonText: "ok"
				})
			}
		});
	} */
	function viewData(selectId){
		var insertHtml;
		console.log(selectId);
		$.ajax({
			async : false,
			type : 'POST',
			url : "http://localhost:8080/BookWeb/Admin/getStore",
			data :{ store : selectId },
			dataType : "json",
			success : function(data) {
				
				insertHtml = "<div class=\"row\">"
				   	+ "<div class=\"col-lg-4\">"
				   	+ "<label for=\"url\"></label> <img alt=\"圖勒?\" width=\"300px\" height=\"400px\" src=\""+data.bkPic+"\"/>"
				   	+ "</div>"
				   	+ "<div class=\"col-lg-8\">"
					+ "<h5>賣場編號:</h5>"
					+ "<span>" + data.bksID + "</span>"
					+ "<hr>"
					+ "<h5>賣家名子:</h5>"
					+ "<span>"+ data.mbName +"</span>"
					+ "<hr>"
					+ "<h5>上架時間:</h5>"
					+ "<span>"+ data.bksDate +"</span>"
					+ "<hr>"
					+ "<h5>書本價格:</h5>"
					+ "<span>"+ data.bsPrice +"</span>"
					+ "<hr>"
					+ "<h5>庫存:</h5>"
					+ "<span>" + data.bsNum +"</span>"
					+ "</div>"
					+ "</div>"
						   
			   swal.fire({
					  width: '850px',
					  html: insertHtml,  
					  confirmButtonText: "ok"
				});
			}
		});
		
	}
	
	
	function DelData(deleteBrId){
		swal.fire({
			  title: "確定要刪除",
			  icon: "warning",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes',
			  cancelButtonText: 'No'
			}).then((willDelete) => {
			  if (willDelete.isConfirmed) {
				 $.ajax({
					async : false,
					type : 'POST',
					url : "http://localhost:8080/BookWeb/Admin/deleteStore",
					data : {bksId:deleteBrId},
					dataType : "json",
					success : function(data) {
						if(data && typeof(data) == "boolean"){								
							swal.fire({
							      title: "刪除成功",
							      icon: "success",
							 }).then((willDelete) => {
								 reportTable.ajax.reload()
							 });
						}
					}
				});
			  }
		});
	}
    	
</Script>
