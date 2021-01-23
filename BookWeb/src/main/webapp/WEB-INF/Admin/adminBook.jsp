<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
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

.detail{
text-align:right;
font-size:16px;
}
.a3 {
	margin: 0px;
	display: inline
}
.row2{
	margin:0 auto;
	text-align:center;
	display: block;
}
.collectindex {
	float: right;
}
.s-corner {
   text-align: center;
   width: auto;
   height: 400px;
   box-shadow: 0px 0px 10px #95CACA;
   background: linear-gradient(#95CACA,#95CACA) left top,
   linear-gradient(#95CACA,#95CACA) left bottom,
   linear-gradient(#95CACA,#95CACA) right top,
   linear-gradient(#95CACA,#95CACA) right bottom;
   background-size: 4px 4px;
   background-repeat: no-repeat;
   float: auto;
}
.col-sm-3 {
    text-align: center;
}
#border{
  border: 10px solid transparent;
  padding: 35px;
  border-image: url("${pageContext.request.contextPath}/image/border-image.png") 30 round;
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
	<form id="myForm" action="http://localhost:8080/BookWeb/updatebook" method="get"> 
		<table id="bookReport_Table" class="display" >
		    <thead>
		        <tr>
		            <th style="width:50px;">編號</th>
		            <th style="width:200px;">書名</th>
		            <th style="width:100px;">作者</th>
		            <th style="width:100px;">出版社</th>
		            <th>出版日期</th>
		            <th style="width:200px;">操作</th>
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
	</form>
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
		url : "http://localhost:8080/BookWeb/Admin/getMonthReportWrite",
		dataType : "json",
		success : function(data) {
			monthWriteName = data.month
			monthWriteNum = data.monthNumber
		}
	});
	
	$.ajax({
		async : false,
		type : 'POST',
		url : "http://localhost:8080/BookWeb/Admin/getMonthReportViews",
		dataType : "json",
		success : function(data) {
			monthViewName = data.month
			monthViewNum = data.viewNumber
		}
	});
	
	var myChart = new Chart(writeChart, {
	    type: 'line',
	    data: {
	        labels: monthWriteName,
	        datasets: [{
	        	label: '人數',
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
				text: '每月撰寫心得數量'
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
	            backgroundColor: 'rgba(54, 162, 235, 1)',
	            borderColor: 'rgba(54, 162, 235, 1)'
	        }],
	    },
	    options: {
			title: {
				display: true,
				fontSize: 20,
				text: '每月瀏覽心得數量'
			}
		}
	});
	
	var reportTable;

	$(document).ready( function () {
		getDataTable();
	})
	
	function getDataTable(){
		reportTable = $('#bookReport_Table').DataTable({
			"ajax": {
	            "url": "http://localhost:8080/BookWeb/Admin/getAllBook",
	            "type": "POST",
	            "dataSrc": ""
	        },
	        "columns": [
	            { "data": "bkId" },
	            { "data": "bkName" },
	            { "data": "bkAuthor" },
	            { "data": "bkPublish" },
	            { "data": "bkDate"},
	            { data: "bkId",
	              render: function (data, type, row, meta) { 
	                    return "<button type=\"button\" class=\"btn btn-outline-dark\" onclick='viewData(" + data + ")' value = \""+ data +"\">查看</button>"
			               + "<button type=\"submit\" class=\"btn btn-outline-primary ml-2\" name = \"update\"  value = \""+ data +"\">修改</button>"
			               + "<button type=\"button\" class=\"btn btn-outline-danger ml-2\" onclick='DelData(" + data + ")' value = \""+ data +"\">刪除</button>";

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
	
	function viewData(bookId){
		var insertHtml;
		$.ajax({
			async : false,
			type : 'POST',
			url : "http://localhost:8080/BookWeb/Admin/getBook",
			data :{ bkId : bookId },
			dataType : "json",
			success : function(data) {
				
				insertHtml = "<div class=\"container\">"
							+ "<div class=\"row\">"
							+ "<div class=\"col-sm-5\" style=\"margin:0 auto;\">"
							+ "<p class=\"s-corner\">"
							+ "<img class=\"mainpic\" alt=\"\" src=\"" + data.bkPic + "\" height=\"390\">"
							+ "</p>"
							+ "</div>"
							+ "<div class=\"col-sm-7\">"
							+ "<div class=\"back\">"
							+ "<h2 class=\"title\" align=\"center\">" + data.bkName + "</h2>"
							+ "<hr>"
							+ "<br>"
							+ "<div class=\"row\" style=\"margin-bottom:15px\"> "
							+ "<div class=\"col-sm-2 detail detail2\">作者：</div>"
							+ "<div class=\"col-sm-4 detail2\">" + data.bkAuthor + "</div>"
							+ "<div class=\"col-sm-6\">　譯者：" + data.bkTranslator + "</div>"
							+ "</div>"
							+ "<div class=\"row\" style=\"margin-bottom:15px\"> "
							+ "<div class=\"col-sm-2 detail\">出版社：</div>"
							+ "<div class=\"col-sm-4\">" + data.bkPublish + "</div>"
							+ "<div class=\"col-sm-6 detail2\">" + data.bkPublisherPlace + "</div>"
							+ "</div>"					
							+ "<div class=\"row\" style=\"margin-bottom:15px\"> "
							+ "<div class=\"col-sm-2 detail\">出版日期：</div>"
							+ "<div class=\"col-sm-4\">" + data.bkDate + "</div>"
							+ "<div class=\"col-sm-6\">　語言：" + data.bkLan + "</div>"
							+ "</div>"
							+ "<div class=\"row\" style=\"margin-bottom:15px\"> "
							+ "<div class=\"col-sm-2 detail\">ISBN：</div>"
							+ "<div class=\"col-sm-4\">" + data.bkISBN + "</div>"
							+ "<div class=\"col-sm-6\">　頁數：" + data.bkPage + "</div>"
							+ "</div>"
							+ "<div class=\"row\"> "
							+ "<div class=\"col-sm-2 detail\">類型：</div>"
							+ "<div class=\"col-sm-9\">"
							+ "<a href=\"#\" class=\"badge badge-info\" style=\"font-size:1em\">" + data.bkType + "</a>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "<br>"
							+ "<br>"
							+ "<div class=\"row\">"
							+ "<div class=\"col-sm-12\" id=\"border\">"
							+ "<h5 align=\"center\">內容簡介</h5>"
							+ "<hr>"
							+ "<p style=\"text-indent: 2em;word-wrap:break-word;white-space: pre-wrap;\"contenteditable=\"false\">"
							+ data.bkContent
							+ "</p>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
				swal.fire({
					  width: '1200px',
					  html: insertHtml,  
					  confirmButtonText: "ok"
				});
				
			}
		});
		
	}
	
	
	
	function DelData(deleteBkId){
		console.log(deleteBkId)
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
					url : "http://localhost:8080/BookWeb/Admin/deleteBook",
					data : {bkId : deleteBkId},
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
