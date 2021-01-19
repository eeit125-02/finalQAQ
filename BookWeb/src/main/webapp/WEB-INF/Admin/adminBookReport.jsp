<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


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
	})
	
	function viewData(reportId){
		console.log(reportId)
		/* $('#change123').load( "http://localhost:8080/BookWeb/BookReport/"+reportId ); */
		
		swal.fire({
			  title: "<i>Title</i>", 
			  html: "<div id = \"change1\"><div>",  
			  confirmButtonText: "V <u>redu</u>", 
		});
		$('#change1').load( "http://localhost:8080/BookWeb/BookReport/"+reportId )
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
							swal({
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
