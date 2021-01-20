<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="${pageContext.request.contextPath}/js/jquery.rateyo.js"></script>



<table id="bookReport_Table" class="display">
    <thead>
        <tr>
            <th>會員帳號</th>
            <th>心得編號</th>
            <th>標題</th>
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

<Script>
	
	var reportTable;

	$(document).ready( function () {
		getDataTable();
	})
	
	function getDataTable(){
		reportTable = $('#bookReport_Table').DataTable({
			"ajax": {
	            "url": "http://localhost:8080/BookWeb/Admin/getAllBookReport",
	            "type": "POST",
	            "dataSrc": ""
	        },
	        "columns": [
	            { "data": "mbAccount" },
	            { "data": "brId" },
	            { "data": "brName" },
	            { "data": "brTime" },
	            { data: "brId",
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
	
	function viewData(reportId){
		var insertHtml;
		$.ajax({
			async : false,
			type : 'POST',
			url : "http://localhost:8080/BookWeb/BookReport/viewBookReport/"+reportId,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				
				insertHtml = "<div class=\"media\">"
						   + "<img id=\"bkPic\" src=\""+ data.bk_Pic +"\" class=\"w-25 h-25 p-2\">"
						   + "<div class=\"media-body ml-5\">"
						   + "<form class=\"col-ml-4\">"
						   + "<br>"
						   + "<div class=\"form-inline\">"
						   + "<p class=\"messageSize\" id=\"brTitel\">閱讀標題："+ data.br_Name +"</p> "
						   + "</div>"
						   + "<div class=\"form-inline\">"
						   + "<p class=\"messageSize\" id=\"userAccount\">撰寫者："+ data.userAccount +"</p>"
						   + "</div>"
						   + "<div class=\"form-inline\">"
						   + "<p class=\"messageSize\" id=\"bkName\">書名："+ data.bk_Name +"</p>"
						   + "</div>"
						   + "<div id=\"bookWriter\" class=\"form-inline\">"
						   + "<p class=\"messageSize\" id=\"bkAuthor\">作者："+ data.bk_Author +"</p>"
						   + "</div>"
						   + "<div class=\"form-inline\">"
						   + "<p class=\"messageSize\" id=\"bkPublish\">出版社："+ data.bk_Publish +"</p>"
						   + "</div>"
						   + "<div class=\"form-inline\">"
						   + "<p class=\"messageSize\">評分：</p>"
						   + "<div id=\"rateYo\"></div>"
						   + "</div>"
						   + "</form>"
						   + "</div>"
						   + "</div>"
						   + "<br>"
						   + "<h3>心得:</h3>"
						   + "<hr>"
						   + "<p>"+ data.br_Content +"</p>"
						   
			   swal.fire({
					  width: '850px',
					  html: insertHtml,  
					  confirmButtonText: "ok", 
				});
						   
				$("#rateYo").rateYo({
					rating: data.br_Score,
				    spacing: "10px",
				    readOnly: true
				    
				});
			}
		});
		
	}
	
	function DelData(deleteBrId){
		console.log(deleteBrId)
		swal({
			  title: "確定要刪除",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willDelete) => {
			  if (willDelete) {
				 $.ajax({
					async : false,
					type : 'POST',
					url : "http://localhost:8080/BookWeb/Admin/deleteBookReport",
					data : {brId:deleteBrId},
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
