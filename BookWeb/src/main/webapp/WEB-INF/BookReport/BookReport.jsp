
<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="com.web.book.model.*"
import="java.util.List"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<style>
        .bd-placeholder-img {
          font-size: 1.  125rem;
          text-anchor: middle;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
		
	</style>
    <title>閱讀履歷</title>
</head>
<body>
	
 	<!-- 標題及工作列 -->
    <div class="container">
        <header class="blog-header py-3">
			<div class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="#">書適圈</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<form action=".\login.jsp">
						<button type="submit" class="btn btn-sm btn-outline-secondary">登入</button>
					</form>
				</div>
			</div>
        </header>
      
        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-between">
				<!-- <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					圖書漂流瓶
				</a>
                <div class="dropdown-menu text-muted" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item text-muted" href="#">Action</a>
                    <a class="dropdown-item text-muted" href="#">Another action</a>
                    <a class="dropdown-item text-muted" href="#">Something else here</a>
                </div>
                <a class="p-2 text-muted" href="#">二手書交易系統</a>
                <a class="p-2 text-muted" href="#">共讀趣／閱讀沙龍</a>
				<a class="p-2 text-muted" href="#">討論區</a> -->
				<form action=".\Search.jsp">
					<button type="submit"  class="btn btn-link text-muted">圖書漂流瓶</button>
				</form>
				<form action=".\qaqmid.jsp">
					<button type="submit"  class="btn btn-link text-muted">二手書交易系統</button>
				</form>
				<form action=".\index.jsp">
					<button type="submit"  class="btn btn-link text-muted">共讀趣／閱讀沙龍</button>
				</form>
				<form action=".\mainpage.jsp">
					<button type="submit"  class="btn btn-link text-muted">討論區</button>
				</form>
				<form action=".\BookReportServlet" method="post">
                	<button type="submit"  class="btn btn-link text-muted">閱讀履歷</button>
				</form>
                <!-- <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    閱讀履歷
                </a>
                <div class="dropdown-menu text-muted" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item text-muted" href="#">Action</a>
                    <a class="dropdown-item text-muted" href="#">Another action</a>
                    <a class="dropdown-item text-muted" href="#">Something else here</a>
                </div> -->
            </nav>
        </div>
    </div>
    <!-- 標題及工作列 -->

    <!-- 版主介紹 -->
    <!-- <div class="container media">
      <img src="..." class="align-self-start mr-3" alt="...">
      <div class="media-body">
        <h4 class="mt-0 text-muted">會員名稱</h4>
        <h5 class="mt-0 text-muted">履歷名稱</h5>
        <p style="height: 100px;">簡介</p>
      </div>
    </div> -->
    <!-- 版主介紹 -->
    
    <!--功能列-->
    <nav class="container">
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-read-tab" data-toggle="tab" href="#nav-read" role="tab" aria-controls="nav-home" aria-selected="true">讀書心得</a>
        <a class="nav-item nav-link" id="nav-fav-tab" data-toggle="tab" href="#nav-fav" role="tab" aria-controls="nav-contact" aria-selected="false">收藏</a>
        <a class="nav-item nav-link" id="nav-com-tab" data-toggle="tab" href="#nav-com" role="tab" aria-controls="nav-contact" aria-selected="false">評論</a>
      </div>
    </nav>
    <!--功能列-->
    
	<form action=".\BookReportServlet" method="post" id="form1">
		<%
			List<BookReportBean> bookReportTable = (List<BookReportBean>)request.getAttribute("bookReportTable");
		%>
	    <!--功能列畫面-->
	    <div class="container tab-content" id="nav-tabContent">
	    
	    	<br>
			<!-- 閱讀心得 -->
			<div class="tab-pane fade show active" id="nav-read" role="tabpanel" aria-labelledby="nav-read-tab">
				<div class="row">
				<%
					for( BookReportBean reportData : bookReportTable ){
				%>
				<c:forEach var="bookReport" items="${ bookReportList }">
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm "  >
						<svg class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
							<image xlink:href="${ bookReport.book.bk_ID }" width="100%" height="100%"/>
						</svg>
						<div class="card-body">
							<p>${bookReport.book.bk_Name}<p>
							<p class="card-text">評分：${bookReport.BR_Score}</p>
							<input type="hidden" id = "${bookReport.BR_ID}edit_pic" name="${bookReport.BR_ID}BkPic" value="${bookReport.getBook().getBk_Pic()}">
							<input type="hidden" id = "${bookReport.BR_ID}edit_BkName" name="${bookReport.BR_ID}BkName" value="${bookReport.getBook().getBk_Name()}">
							<input type="hidden" id = "${bookReport.BR_ID}edit_MbID" name="${bookReport.BR_ID}MbID" value="${bookReport.getMember().getmB_ID()}">
							<input type="hidden" id = "${bookReport.BR_ID}edit_BkID" name="${bookReport.BR_ID}BkID" value="<%=reportData.getBook().getBk_ID()%>">
							<input type="hidden" id = "${bookReport.BR_ID}edit_BrContent" name="${bookReport.BR_ID}BrContent" value="<%=reportData.getBr_Content()%>">
							<input type="hidden" id = "${bookReport.BR_ID}edit_BkWriter" name="${bookReport.BR_ID}BkWriter" value="<%=reportData.getBook().getBk_Author() %>">
							<input type="hidden" id = "${bookReport.BR_ID}edit_BkPublish" name="${bookReport.BR_ID}BkPublish" value="<%=reportData.getBook().getBk_Publish() %>">
							<input type="hidden" id = "${bookReport.BR_ID)}edit_BrScore" name="${bookReport.BR_ID}BrScore" value="<%=reportData.getBr_Score()%>">
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">		
									<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#editModal" id = "editFirst"  name = "editButtons" value = "${bookReport.getBR_ID()}" >Edit</button>
									<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#deletModal" id = "deleteFirst"  name = "beleteButtons" value = "${bookReport.getBR_ID()}" >Delete</button>
								</div>
								<small class="text-muted">創建日期：<br><%=reportData.getBr_DateTime()%></small>
							</div>
						</div>
						</div>
					</div>
				</c:forEach>
				<%
					}
				%>
				</div>
			</div>
			<!-- 閱讀心得 -->
	
			<!-- 收藏 -->
			<div class="tab-pane fade" id="nav-fav" role="tabpanel" aria-labelledby="nav-fav-tab">
				<div class="row mb-2">
					<div class="col-md-6">
						<div class="card flex-md-row mb-4 shadow-sm h-md-250">
						<div class="card-body d-flex flex-column align-items-start">
							<h3 class="mb-0">
							<a class="text-dark" href="#">書名</a>
							</h3>
							<div class="mb-1 text-muted">日期</div>
							<p class="card-text mb-auto">大綱</p>
							<a href="#">閱讀全文</a>
						</div>
						<svg class="bd-placeholder-img card-img-right flex-auto  d-lg-block" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
							<title>Placeholder</title>
							<rect fill="#55595c" width="100%" height="100%"></rect>
							<text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text>
						</svg>
						</div>
					</div>
				</div>
			</div>
			<!-- 收藏 -->
	
			<!-- 評論 -->
			<div class="tab-pane fade" id="nav-com" role="tabpanel" aria-labelledby="nav-com-tab">
				<ul class="list-unstyled">
				<li class="media my-4">
					<img src="..." class="mr-3" alt="...">
					<div class="media-body">
					<h5 class="mt-0 mb-1">使用者</h5>
					<label>書籍: </label><br>
					<label>評分</label><br>
					<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
					</div>
				</li>
				</ul>
			</div>
			<!-- 評論 -->
	
	    </div>
	    <!--功能列畫面-->
	
	
	
	    <!--編輯畫面-->
			<div class="modal" role="dialog" id="editModal" tabindex="-1">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">更改內容</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="media">
							<img id = "BkPicE" src="" class="w-25 p-3" alt="...">
							<div class="media-body">
								<h5 class="mt-0" id = "BkNameE">書名：</h5>
								<p class="mt-0" id = "BkWriterE">作者：</p>
								<p class="mt-0" id = "BkPublishE">出版社：</p>
								評分：<select name = "BrScore1" >
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>分
							</div>
						</div>
						<label for="message-text" class="col-form-label">心得:</label>
						<textarea class="form-control" id="BrContentE" style="height: 350px;" name="BrContent1"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id ="editButton" name="editButton" value = "edit">Save changes</button>
					</div>
					</div>
				</div>
			</div>
	    <!--編輯畫面-->
				
		
		<!--刪除確認-->
			<div class="modal" id="deletModal" tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
						<h5 class="modal-title">確認</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						</div>
						<div class="modal-body">
						<p>確認是否要刪除心得</p>
						</div>
						<div class="modal-footer">
							<button type="submit"  class="btn btn-link" id = "deleteSecond" name="beleteButton" value = "123">Yes</button>
							<button type="button" class="btn btn-link" data-dismiss="modal">No</button>
						</div>
					</div>
				</div>
			</div>
		<!--刪除確認-->
	</form>

		<script>
				$()
				$(".btn-outline-secondary").click(function() {
					console.log($(this).val());
					let br_id = $(this).val();

					if ($(this).prop("name") == "beleteButtons"){
						console.log($(this).prop("name"));
						$("#deleteSecond").val($(this).val());
					}

					if ($(this).prop("name") == "editButtons"){

						let bkPic = "#"+br_id+"edit_pic";
						console.log($(bkPic).val());
						$("#BkPicE").attr("src",$(bkPic).val());
						$().val($(bkPic).val());
						let bkName = "#"+br_id+"edit_BkName";
						console.log($(bkName).val());
						$("#BkNameE").html( "書名："+$(bkName).val());
						let bkWriter = "#"+br_id+"edit_BkWriter";
						console.log($(bkWriter).val());
						$("#BkWriterE").html("作者："+$(bkWriter).val());
						let bkPublish = "#"+br_id+"edit_BkPublish";
						console.log($(bkPublish).val());
						$("#BkPublishE").html("出版社："+$(bkPublish).val());
						// let brScore = "#"+br_id+"edit_BrScore";
						// console.log($(brScore).val());
						// $("#BrScore").val($(brScore).val());
						let brContent = "#"+br_id+"edit_BrContent";
						console.log($(brContent).val());
						$("#BrContentE").val($(brContent).val());
						let mb_id = "#"+br_id+"edit_MbID";
						console.log($(mb_id).val());
						$("#MbId").val($(mb_id).val());
						let bk_id = "#"+br_id+"edit_BkID";
						console.log($(bk_id).val());
						$("#BkId").val($(bk_id).val());
						$("#editButton").val($(this).val());

					}
					
					
				});
				
				$("#deleteSecond").click(function() {
					console.log("Success delete : "+$(this).val());
				});
		  </script>
	
	
	
</body>
</html>