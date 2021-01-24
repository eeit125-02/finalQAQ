<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- 引用sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 引用CK Editor -->
<script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>





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

.show_part_content{
	width:500px;
	height:30px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}

.show_part_title{
	width:300px;
	height:30px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}

</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
		$("#bookWebFooter").load("<c:url value='/footer'/>");
	});
</script>
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
<title>書適圈</title>
</head>

<body>

<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>

	<!-- header -->
	<header class="blog-header" id="bookWebheader"></header>
	<!-- header -->

	<div class="container">
		<div class="row">
			<!-- sidebar area -->
			<div class="col-2 text-center">
				<br>
				<!-- ====================================================sidebar==================================================== -->
				<h2>書適論壇</h2>
				<br>
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-novel-list" data-toggle="list" href="#list-novel"
						role="tab">討論天地</a> 
						<a
						class="list-group-item list-group-item-action"
						id="list-member-list" data-toggle="list" href="#list-member"
						role="tab">會員專區</a> 
						
						<script>
						$('#list-member-list').click(function(){
							if('${loginUser.mb_ID}'==''){
								$('#list-member').html('<br><br><h1>請先登入會員帳號</h1>')
							} 
						})
						</script>
						
						<a
						class="list-group-item list-group-item-action"
						id="list-manager-list" data-toggle="list" href="#list-manager"
						role="tab">管理員專區</a>
						
						<script>
						$('#list-manager-list').click(function(){
							if('${loginUser.mb_ID}'!=='14'){
								$('#list-manager').html('<br><br><h1>請先登入管理員帳號</h1>')
							} 
						})
						</script>
						
				</div>
						<br><br>
						
						<form class="form-inline" action='catch_exception' method="post">
						<button id="catch_exception" class="btn btn-outline-warning" type="submit">錯誤<br>攔截</button>
						</form>
						
			</div>

			<!-- content area -->
			<div class="col-10" style='text-align: center;'>
			<br>
				<!-- content connect to sidebar -->
				<div class="tab-content" id="nav-tabContent">

					<!-- =====================================================discussion board area===================================================== -->
					<div class="tab-pane fade show active" id="list-novel"
						role="tabpanel">
						<!-- search keyword -->
						<nav class="navbar navbar-light bg-light justify-content-between">
							<a class="navbar-brand">搜尋貼文關鍵字
									<button id="lazy_search" class="btn btn-outline-info" style="border-radius:50%;">press</button>
							</a>
							<form class="form-inline" action='search_keyword' method="post">
								<input class="form-control mr-sm-2" type="search" id="get_lazy_search"
									placeholder="請輸入關鍵字" name="keyword">
								<button class="btn btn-outline-primary my-2 my-sm-0"
									type="submit" id="search_keyword">Search</button>
							</form>
						</nav>
						<br>

							<script>
									$('#lazy_search').click(function(){
										$('#get_lazy_search').val('30');
									})
							</script>

						<!-- discussion board top tab -->
						<ul class="nav nav-tabs nav-fill" id="novelTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="novel_rule-tab"
								data-toggle="tab" href="#novel_rule" role="tab">板規</a></li>
							<li class="nav-item"><a class="nav-link active"
								id="novel_latest-tab" data-toggle="tab" href="#novel_latest"
								role="tab">最新貼文</a></li>
							<li class="nav-item"><a class="nav-link" id="novel_hot-tab"
								data-toggle="tab" href="#novel_hot" role="tab">熱門貼文</a></li>
							<li class="nav-item"><a class="nav-link" id="click-tab"
								data-toggle="tab" href="#click" role="tab">最多瀏覽</a></li>
						</ul>
						<br>

						<!-- content connect to top tab -->
						<div class="tab-content" id="novelTabContent">
							<!-- content of rule tab -->
							<div class="tab-pane fade" id="novel_rule" role="tabpanel">
								<div id="show_rule">
									<c:forEach var="rule" items="${rule}">${rule.rule_content}</c:forEach>
								</div>
							</div>

							<!-- content of latest post tab -->
							<div class="tab-pane fade show active" id="novel_latest"
								role="tabpanel">

								<!-- post and command table -->
								<table class="table table-hover">
									<thead>
										<tr class="table-primary">
											<th scope="col"
												style="width: 52%; text-align: left; vertical-align: middle">貼文標題</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文作者</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文時間</th>
											<th scope="col" style="width: 12%; vertical-align: middle">留言數</th>
											<th scope="col" style="width: 12%; vertical-align: middle">點擊數</th>											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="stored_post" items="${allPost}">
											<tr>
												<td style="text-align: left; vertical-align: middle">
												<c:url
														value="show_detail" var="show_detail">
														<c:param name="post_detail_id"
															value=" ${stored_post.post_id}" />
													</c:url>
													<form action="${show_detail}" method="post">
														<button type="submit" class="btn btn-link">
												<div class="show_part_title text-left" >${stored_post.post_title}</div>
												</button>
													</form>
													</td>
												<td style="vertical-align: middle">${stored_post.memberbean.mb_Name}</td>
												<td style="vertical-align: middle; background-color:	#ECF5FF">${stored_post.post_time}</td>
												<td style="vertical-align: middle"><c:set
														var="command_qty" value="${0}" /> <c:forEach
														var="stored_command" items="${allCommand}">
														<c:set var="pi" value="${stored_post.post_id}" />
														<c:set var="ci" value="${stored_command.postBean.post_id}" />
														<c:if test="${pi==ci}">
															<c:set var="command_qty" value="${command_qty+1}" />
														</c:if>
													</c:forEach> <!-- 	引用icon --> <svg xmlns="http://www.w3.org/2000/svg"
														width="16" height="16" fill="currentColor"
														class="bi bi-chat" viewBox="0 0 16 16">
  															<path
															d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
														</svg> <i class="bi bi-chat"></i> ${command_qty}</td>
												<td style="vertical-align: middle">${stored_post.click}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

							<!-- content of hot post tab -->
							<div class="tab-pane fade" id="novel_hot" role="tabpanel">

								<!-- post and command table -->
								<table class="table table-hover tablesorter" id="myTable">
									<thead>
										<tr class="table-primary">
											<th scope="col"
												style="width: 52%; text-align: left; vertical-align: middle">貼文標題</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文作者</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文時間</th>
											<th scope="col" style="width: 12%; vertical-align: middle">留言數</th>
											<th scope="col" style="width: 12%; vertical-align: middle">點擊數</th>											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="stored_post" items="${hotPost}">
											<tr>
												<td style="text-align: left; vertical-align: middle">
												<c:url
														value="show_detail" var="show_detail">
														<c:param name="post_detail_id"
															value=" ${stored_post.post_id}" />
													</c:url>
													<form action="${show_detail}" method="post">
														<button type="submit" class="btn btn-link">
												<div class="show_part_title text-left" >${stored_post.post_title}</div>
												</button>
													</form>
													</td>
												<td style="vertical-align: middle">${stored_post.memberbean.mb_Name}</td>
												<td style="vertical-align: middle">${stored_post.post_time}</td>
												<td style="vertical-align: middle; background-color:	#ECF5FF"><c:set
														var="command_qty" value="${0}" /> <c:forEach
														var="stored_command" items="${allCommand}">
														<c:set var="pi" value="${stored_post.post_id}" />
														<c:set var="ci" value="${stored_command.postBean.post_id}" />
														<c:if test="${pi==ci}">
															<c:set var="command_qty" value="${command_qty+1}" />
														</c:if>
													</c:forEach> <!-- 	引用icon --> <svg xmlns="http://www.w3.org/2000/svg"
														width="16" height="16" fill="currentColor"
														class="bi bi-chat" viewBox="0 0 16 16">
  															<path
															d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
														</svg> <i class="bi bi-chat"></i> ${command_qty}</td>
												<td style="vertical-align: middle">${stored_post.click}</td>												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							<!-- content of post click sorted tab -->
							<div class="tab-pane fade" id="click" role="tabpanel">
							<table class="table table-hover tablesorter" id="myTable">
									<thead>
										<tr class="table-primary">
											<th scope="col"
												style="width: 52%; text-align: left; vertical-align: middle">貼文標題</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文作者</th>
											<th scope="col" style="width: 12%; vertical-align: middle">貼文時間</th>
											<th scope="col" style="width: 12%; vertical-align: middle">留言數</th>
											<th scope="col" style="width: 12%; vertical-align: middle">點擊數</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="stored_post" items="${clickPost}">
											<tr>
												<td style="text-align: left; vertical-align: middle">
												<c:url
														value="show_detail" var="show_detail">
														<c:param name="post_detail_id"
															value=" ${stored_post.post_id}" />
													</c:url>
													<form action="${show_detail}" method="post">
														<button type="submit" class="btn btn-link">
												<div class="show_part_title text-left" >${stored_post.post_title}</div>
												</button>
													</form>
													</td>
												<td style="vertical-align: middle">${stored_post.memberbean.mb_Name}</td>
												<td style="vertical-align: middle">${stored_post.post_time}</td>
												<td style="vertical-align: middle"><c:set
														var="command_qty" value="${0}" /> <c:forEach
														var="stored_command" items="${allCommand}">
														<c:set var="pi" value="${stored_post.post_id}" />
														<c:set var="ci" value="${stored_command.postBean.post_id}" />
														<c:if test="${pi==ci}">
															<c:set var="command_qty" value="${command_qty+1}" />
														</c:if>
													</c:forEach> <!-- 	引用icon --> <svg xmlns="http://www.w3.org/2000/svg"
														width="16" height="16" fill="currentColor"
														class="bi bi-chat" viewBox="0 0 16 16">
  															<path
															d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
														</svg> <i class="bi bi-chat"></i> ${command_qty}</td>
												<td style="vertical-align: middle; background-color:	#ECF5FF">${stored_post.click}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							

						</div>
					</div>
					<!-- =====================================================member page===================================================== -->
					<div class="tab-pane fade" id="list-member" role="tabpanel">
						<h3>${loginUser.mb_Name} 的個人頁面</h3>
						<br>

						<!-- member page top button -->
						<ul class="nav nav-pills mb-3 justify-content-center"
							id="pills-tab" role="tablist" style="text-align: center;">
							<li class="nav-item">
							<a class="nav-link active"
								id="pills-member_new_post-tab" data-toggle="pill"
								href="#pills-member_new_post" role="tab">新增貼文</a></li>
							<li class="nav-item">
							<a class="nav-link"
								id="pills-member_post-tab" data-toggle="pill"
								href="#pills-member_post" role="tab">個人貼文紀錄</a></li>
						</ul>
						<div class="tab-content" id="pills-tabContent">

							<!-- write new post page -->
							<div class="tab-pane fade show active" id="pills-member_new_post"
								role="tabpanel">

								<!-- new post form -->
								<div
									style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px; padding-top: 20px">

									
										<div class="form-group row">
											<label for="new_title" class="col-2 text-center h5">貼文標題</label>
											<div class="col-9">
												<input type="text" class="form-control" id="post_title"
													placeholder="請輸入貼文標題" />
											</div>
										</div>
										<div class="form-group row">
											<label for="new_content" class="col-2 text-center h5">貼文內容</label>
											<div class="col-9">
												<textarea class="form-control" id="post_content" name="post_content"
													rows="6" placeholder="請輸入貼文內容"></textarea>
											</div>
										</div>
										
										<div class="text-center">
											<button type="submit" class="btn btn-primary" id="send_added_post">送出貼文</button>
											<button id="lazy_input" class="float-left btn btn-outline-info" style="border-radius:50%;">press</button>
										</div>
									
								</div>
							</div>
							
							<script>
									CKEDITOR.replace('post_content');

									$('#lazy_input').click(function(){
										$('#post_title').val('請幫忙推薦奇幻小說');
										CKEDITOR.instances["post_content"].setData(
												'<p>如題</p>'+ 
												'<p>這應該算是異世界類型的小說吧...</p>'+
												'<p><img alt="" src="http://i.imgur.com/8VhXIvG.png" style="height:187px; width:200px" /></p>'+
												'<p>總之就是主角從現實世界中踏上未知的奇幻大陸</p>'+
												'<h3><strong>有沒有出到結局都沒關係 </strong></h3>'+
												'<h3><strong>比較喜歡注重在人物刻寫生動的作品 </strong></h3>'+
												'<p>各位有推薦的嗎?</p>'
										);
									})
							</script>
							
							<script>
						$('#send_added_post').click(function(){
							if($('#post_title').val()==''||CKEDITOR.instances["post_content"].getData()==''){
								swal({title:'請輸入貼文標題及內容'});
								
							}else{
								$.ajax({
									url : '<c:url value="/Discussion/add_post"/>',
									type : 'POST',
									data : {post_title : $('#post_title').val(),
												   post_content:CKEDITOR.instances["post_content"].getData()},
									dataType : "json",
									success:function(){
										swal({
											  title: "貼文新增成功",
											  icon: "success",
											  button: "ok",
										}).then((goreload)=>{
											if(goreload){
												window.location.hash = 'add_post_reload';
												window.location.reload();
											}})
										}										
								})				
							}
						})
						
						 document.addEventListener("DOMContentLoaded", function() { 
    						if(window.location.hash == "#add_post_reload"){
    						
    						$('#list-novel-list').removeClass('active');
    						$('#list-novel').removeClass('show active');
    						$('#pills-member_new_post-tab').removeClass('active');
    						$('#pills-member_new_post').removeClass('show active');
    					
    						$('#list-member-list').addClass('active');
    						$('#list-member').addClass('show active');
    						$('#pills-member_post-tab').addClass('active');
    						$('#pills-member_post').addClass('show active');
    						}
  					  });
					</script>

							<!-- personal post record -->
							<div class="tab-pane fade" id="pills-member_post" role="tabpanel">
								<c:forEach var="stored_post" items="${allPost}">
								<c:set var="um" value="${loginUser.mb_ID}" />
								<c:set var="pmm" value="${stored_post.memberbean.mb_ID}" />
								<c:if test="${um==pmm}">
									
									
								
									<div
										style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
										
										<form class="form-inline float-right" >
											<button class="btn btn-outline-secondary btn-sm" id="member_delete_btn${stored_post.post_id}"
												type="submit" style="margin-left: 5px" value="${stored_post.post_id}">刪除</button>
										</form>
										
										<script>
											$('#member_delete_btn${stored_post.post_id}').click(function(e){
												e.preventDefault();
												swal({
													  title: "確定刪除 ${stored_post.post_title} 嗎？",
													  icon: "warning",
													  buttons: true,
													  dangerMode: true,
													}).then((godelete)=>{
														if(godelete){
													$.ajax({
														url : '<c:url value="/Discussion/delete_ajax"/>',
														type : 'POST',
														data : {delete_post_id : $(this).val()},
														dataType : "json",
														success:function(delete_post_id){
															swal({
															      title: "貼文刪除成功",
															      icon: "success"
															 }).then((goreload)=>{
																if(goreload){
																	window.location.hash = 'delete_post_reload';
																	window.location.reload();
																}})
															}
													})
												}})													
											})
											
											document.addEventListener("DOMContentLoaded", function() { 
    											if(window.location.hash == "#delete_post_reload"){
    						    												
    												$('#list-novel-list').removeClass('active');
        											$('#list-novel').removeClass('show active');
        											$('#pills-member_new_post-tab').removeClass('active');
        											$('#pills-member_new_post').removeClass('show active');
        					
        											$('#list-member-list').addClass('active');
        											$('#list-member').addClass('show active');
        											$('#pills-member_post-tab').addClass('active');
        											$('#pills-member_post').addClass('show active');
    												}
  											  });
											</script>

										<c:url value="go_edit" var="go_edit">
											<c:param name="edit_post_id" value=" ${stored_post.post_id}" />
											<c:param name="edit_post_title"
												value=" ${stored_post.post_title}" />
											<c:param name="edit_post_content"
												value=" ${stored_post.post_content}" />
										</c:url>
										<form class="form-inline float-right" action="${go_edit}"
											method="post">
											<button class="btn btn-outline-secondary btn-sm"
												type="submit">修改</button>
										</form>

										<p>${stored_post.memberbean.mb_Name}
											<br>${stored_post.post_time}</p>
										<h3><strong>${stored_post.post_title}</strong></h3>



										<button class="btn btn-link" type="button"
											data-toggle="collapse"
											data-target="#show_complete_post${stored_post.post_id}" aria-expanded="false">
											顯示、收攏貼文
										</button>
										
											
										<button class="btn btn-link" type="button"
											data-toggle="collapse" 
											data-target="#show_complete_command${stored_post.post_id}">
											顯示、收攏留言</button>

										<!-- show complete post -->
										<div class="collapse"
											id="show_complete_post${stored_post.post_id}">
											<div class="card card-body" style="border-style: none">
												${stored_post.post_content}</div>
										</div>
										<!-- show complete command -->
										<div class="collapse"
											id="show_complete_command${stored_post.post_id}">
											<div class="card card-body" style="border-style: none">


												<div class="input-group mb-3">
													<input type="text" class="form-control"
														id="command_input${stored_post.post_id}"
														placeholder="請輸入留言" /> 
													<div class="input-group-append">
														<button class="btn btn-outline-secondary normal_command${stored_post.post_id}"
															id="command_btn${stored_post.post_id}" type="submit" value="${stored_post.post_id}">留言</button>
													</div>
												</div>

												<div id="show_command${stored_post.post_id}">
													<c:forEach var="stored_command" items="${allCommand}">
														<c:set var="pi" value="${stored_post.post_id}" />
														<c:set var="ci" value="${stored_command.postBean.post_id}" />
														<c:if test="${pi==ci}">
															<div
																style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
																
																<button class="btn btn-link btn-sm float-right" type="submit"
													data-toggle="collapse" 
													data-target="#nested_command${stored_command.command_id}">
													回覆
												</button>
																
																<p>${stored_command.memberbean.mb_Name}<br>
																	${stored_command.command_time}
																</p>
																<p>${stored_command.command_content}</p>
															</div>
															
															<!-- 	巢狀留言彈出輸入框 -->
							<div class="collapse"
								id="nested_command${stored_command.command_id}">

								<div style="height: 40px">
									<div class=" input-group" style="width: 80%; float: right;">

										<input type="text" class="form-control" id="nested_command_input${stored_command.command_id}"  placeholder="回覆   ${stored_command.command_content}" /> 
										<span class="input-group-append">
											<button class="btn btn-outline-secondary nestcommand${stored_post.post_id} " 
												id="nested_command_btn${stored_command.command_id}" value="${stored_command.command_id}" >
												回覆
											</button>
										</span>
									</div>
								</div>
							</div>
							
							
							<div id="show_nested_command${stored_command.command_id}"></div>
											<c:forEach var="all_nested_command" items="${AllNestedCommand}">
									
									<c:set var="cid" value="${stored_command.command_id}" />
								<c:set var="ncid" value="${all_nested_command.commandBean.command_id}" />
								<c:if test="${cid==ncid}">
									
									<div style="height: 125px; padding-top: 10px; margin-right: 10px">
											<div style="background-color: #B3D9D9; margin: 0px; padding: 5px; border-radius: 10px; width: 78%; float: right;">
													<p>${all_nested_command.memberbean.mb_Name}<br>${all_nested_command.nested_command_time}</p>
													<p>${all_nested_command.nested_command_content}</p>
											</div>
									</div>
															
														</c:if>
													</c:forEach>	
														</c:if>
													</c:forEach>
													</div>
												</div>

							<script>
								$(document).on("click", '.nestcommand${stored_post.post_id}', function(){
									
									if (typeof ($.cookie('Member_ID')) != "undefined") {

										if ($(this).parent().prev().val() =="") {
											swal({title : '請輸入文字'})

										} else {
											$.ajax({
												url : '<c:url value="/Discussion/add_nested_command_ajax"/>',
												type : 'POST',
												data : {nested_command : $(this).parent().prev().val(),
															  command_id : $(this).val()},
												dataType : "json",
												success:function(new_ncb){
													$('#show_nested_command'+new_ncb.cb_id).prepend(
															'<div style="height: 125px; padding-top: 10px; margin-right: 10px">'
															+ '<div style="background-color: #B3D9D9; margin: 0px; padding: 5px; border-radius: 10px; width: 78%; float: right;">'
															+	'<p>' + new_ncb.mb_name+'<br>'+new_ncb.ncb_time+'</p>'
															+	'<p>' + new_ncb.ncb_content+'</p>'
															+'</div></div>'
													)
												}
										})
												$(this).parent().prev().val("");
								}}else{
									swal({title : '請先登入'})
								}						 
									})
								
									
									$(document).on("click", '.normal_command${stored_post.post_id}', function(){
										
										console.log($(this).parent().prev().val())
									
										if (typeof ($.cookie('Member_ID')) != "undefined") {
																			
															if($(this).parent().prev().val()==""){
																swal({title:'請輸入文字'})

																}else{
																			
																	$.ajax({
																		url : '<c:url value="/Dsicussion/add_command_ajax"/>',
																		type : 'POST',
																		data : {new_command : $(this).parent().prev().val(),
																						post_id : $(this).val()},
																		dataType : "json",
																		success : function(new_cb) {
																			$("#show_command"+new_cb.post_id).prepend(
																							'<div style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">'
																							+ '<button class="btn btn-link btn-sm float-right" type="submit" data-toggle="collapse"'
																							+ 'data-target="#nested_command'+new_cb.cb_id+'">回覆</button>'
																									+ '<p>'
																									+ new_cb.mb_name
																									+ '<br>'
																									+ new_cb.cb_time
																									+ '</p>'
																									+ '<p>'
																									+ new_cb.cb_content
																									+ '</p>'
																									+ '</div>'
																									+ '<div class="collapse" id="nested_command'+new_cb.cb_id+'">'
																									+ '<div style="height: 40px">'
																									+ '<div class=" input-group" style="width: 80%; float: right;">'
																									+ '<input type="text" class="form-control" id="command_input'+new_cb.cb_id+'" placeholder="回覆   '+new_cb.cb_content+'" />'
																									+ ' <span class="input-group-append">'
																									+ '<button class="btn btn-outline-secondary nestcommand'+new_cb.post_id+'" id="nested_command_btn'+new_cb.cb_id+'" value="'+new_cb.cb_id+'">'
																									+ '回覆</button>'
																									+ '</span></div></div></div>'
																									+'<div id="show_nested_command'+new_cb.cb_id+'"></div>'
																			);
																						$('#command_input'+new_cb.post_id).val("");
																		}
																						
																	})
																
														}}else{
															swal({title : '請先登入'})
														}					
													})
								</script>


											</div>
										</div>

									<br>
									
									</c:if>
								</c:forEach>

							</div>
						</div>
					</div>

					<!-- =====================================================manager page===================================================== -->
					<div class="tab-pane fade" id="list-manager" role="tabpanel">
					<h3>管理員頁面</h3>
						<br>
						<!-- manager page top button  -->
						<ul class="nav nav-pills mb-3 justify-content-center"
							id="pills-tab" role="tablist" style="text-align: center;">
							<li class="nav-item"><a class="nav-link active"
								id="pills-edit_rule-tab" data-toggle="pill"
								href="#pills-edit_rule" role="tab">修改板規</a></li>

							<li class="nav-item"><a class="nav-link"
								id="pills-manage_post-tab" data-toggle="pill"
								href="#pills-manage_post" role="tab">管理貼文</a></li>
						</ul>
						<div class="tab-content" id="pills-tabContent">

							<!-- edit rule -->
							<div class="tab-pane fade show active" id="pills-edit_rule"
								role="tabpanel">



								<div class=" justify-content-center">

									<div
										style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px; padding-top: 20px">

										<div class="form-group row">
											<label for="last_edit_time" class="col-2 text-center h5">上次修改時間</label>
											<div class="col-9">
												<p id="last_edit_time" class='h5'>
													<c:forEach var="rule" items="${rule}">${rule.rule_time}</c:forEach>
												</p>
											</div>
										</div>

										<div class="form-group row">
											<label for="rule_content" class="col-2 text-center h5">版規內容</label>
											<div class="col-9">
												<textarea class="form-control" id="rule_content"
													name="rule_content" rows="6"><c:forEach
														var="rule" items="${rule}">${rule.rule_content}</c:forEach></textarea>
											</div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary" id="send_rule">送出版規</button>
										</div>

									</div>
								</div>
								
								<script>
									CKEDITOR.replace('rule_content');
								</script>


								<script>
									$('#send_rule').click(function() {
										
											$.ajax({
																	url : '<c:url value="/Discussion/edit_rule"/>',
																	type : 'POST',
																	data : {
																		rule_content : CKEDITOR.instances["rule_content"].getData()
																	},
																	dataType : "json",
																	success : function(rb) {
																		$('#last_edit_time').html(rb.rule_time)
																		$('#show_rule').html(rb.rule_content)
																		swal({
														    			  title: "板規已更新",
														    			  icon: "success",
																		 });
																	}
																})
													})
								</script>

							</div>

							<!-- search & delete post -->
							<div class="tab-pane fade" id="pills-manage_post" role="tabpanel">
								
								<!-- search -->
								<div class="form-inline justify-content-center">
										<input class="form-control" type="search" placeholder="請輸入關鍵字"
											name="keyword_manager" id="keyword_manager" style="margin-right: 10px">
										<button class="btn btn-outline-primary my-2 my-sm-0"
											type="submit" id="search_post_manager">Search</button>
								</div>
										<button id="lazy_manager_search" class="btn btn-outline-info" style="border-radius:50%;margin-top:10px">press</button>
								<br>
								
								<script>
								$(document).on("click", '#lazy_manager_search', function(){
									$('#keyword_manager').val('修改');
								})
								</script>
								
								<h4 id="show_type_keyword"></h4>
								
								<script>
								$(document).on("click", '#search_post_manager', function(){
				
										$.ajax({
											url : '<c:url value="/Discussion/search_keyword_manager"/>',
											type : 'POST',
											data : {keyword : $("#keyword_manager").val()},
											dataType : "json",
 											success: function(post_search_result){											
 												var show_search_result="";
 												if(post_search_result.length==0){
 													$('#show_type_keyword').html('查無資料<br><br>');
 												}else{
 												for(let i=0; i<post_search_result.length; i++){
 													$('#show_type_keyword').html('');
 														show_search_result += 
 															'<div style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">'
														+ '<div style="display:none">'+post_search_result[i].post_title+'</div>'
														+ '<form class="form-inline float-right">'
 														+	'<button class="btn btn-outline-secondary btn-sm manager_delete" id="manager_delete_btn'+post_search_result[i].post_id+'" value="'+post_search_result[i].post_id +'"'	
 														+	'type="submit" style="margin-left: 5px">刪除</button>'	
 														+ '</form>'		
 														+	'<p>'+post_search_result[i].mb_name+'<br>'+post_search_result[i].post_time+'</p>'
 														+	'<h3><strong>'+post_search_result[i].post_title+'</strong></h3>'
 														+	'<button class="btn btn-link" type="button" data-toggle="collapse" '																
 														+	'data-target="#manager_show_complete_post'+post_search_result[i].post_id+'">顯示、收攏貼文</button>'
 														+	'<div class="collapse" id="manager_show_complete_post'+post_search_result[i].post_id+'">'	
														+ '<div class="card card-body" style="border-style: none">' +post_search_result[i].post_content+'</div>'
 														+ '</div></div><br>'
 													}
 												}
 												
 											$('#show_post_manager').html(show_search_result);
 											}
 										}) 																									
										$('#keyword_manager').val("");
										$('keyword_manager').attr("placeholder","請輸入關鍵字");
										})
										
										$(document).on("click", '.manager_delete', function(e){
											e.preventDefault();
											swal({
												  title: "確定刪除 "+ $(this).parent().prev().html()+" 嗎？",
												  icon: "warning",
												  buttons: true,
												  dangerMode: true,
												}).then((godelete)=>{
													if(godelete){
												$.ajax({
													url : '<c:url value="/Discussion/delete_ajax"/>',
													type : 'POST',
													data : {delete_post_id : $(this).val()},
													dataType : "json",
													success:function(delete_post_id){
														swal({
														      title: "貼文刪除成功",
														      icon: "success",
														 }).then((goreload)=>{
															if(goreload){
																window.location.hash = 'manager_delete_post_reload';
																window.location.reload();
															}})
													}
												})	
											}})
										})
										
										document.addEventListener("DOMContentLoaded", function() { 
    													if(window.location.hash == "#manager_delete_post_reload"){
    						
    														$('#list-novel-list').removeClass('active');
        													$('#list-novel').removeClass('show active');
        													$('#pills-edit_rule-tab').removeClass('active');
        													$('#pills-edit_rule').removeClass('show active');
        					
        													$('#list-manager-list').addClass('active');
        													$('#list-manager').addClass('show active');
        													$('#pills-manage_post-tab').addClass('active');
        													$('#pills-manage_post').addClass('show active');
    													}
  												  });
								</script>

									<!-- show all post -->
									<div id="show_post_manager">
									<c:forEach var="stored_post" items="${allPost}">
										<div
											style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">

											
											<form class="form-inline float-right">
												<button class="btn btn-outline-secondary btn-sm" id="manager_delete_btn${stored_post.post_id}"
													type="submit" style="margin-left: 5px" value="${stored_post.post_id}">刪除</button>
											</form>
											
											<script>											
													$('#manager_delete_btn${stored_post.post_id}').click(function(e){
														e.preventDefault();
														swal({
															  title: "確定刪除 ${stored_post.post_title} 嗎？",
															  icon: "warning",
															  buttons: true,
															  dangerMode: true,
															}).then((godelete)=>{
																if(godelete){
															$.ajax({
																url : '<c:url value="/Discussion/delete_ajax"/>',
																type : 'POST',
																data : {delete_post_id : $(this).val()},
																dataType : "json",
																success:function(delete_post_id){
																	swal({
																	      title: "貼文刪除成功",
																	      icon: "success",
																	 }).then((goreload)=>{
																		if(goreload){
																			window.location.hash = 'manager_ajax_delete_post_reload';
																			window.location.reload();
																		}})
																	}
															})	
														}})
													})
													
													document.addEventListener("DOMContentLoaded", function() { 
    													if(window.location.hash == "#manager_ajax_delete_post_reload"){
    						
    														$('#list-novel-list').removeClass('active');
        													$('#list-novel').removeClass('show active');
        													$('#pills-edit_rule-tab').removeClass('active');
        													$('#pills-edit_rule').removeClass('show active');
        					
        													$('#list-manager-list').addClass('active');
        													$('#list-manager').addClass('show active');
        													$('#pills-manage_post-tab').addClass('active');
        													$('#pills-manage_post').addClass('show active');
    													}
  												  });
											</script>

											<p>${stored_post.memberbean.mb_Name}
												<br>${stored_post.post_time}</p>
											<h3><strong>${stored_post.post_title}</strong></h3>

											<button class="btn btn-link" type="button"
												data-toggle="collapse"
												data-target="#manager_show_complete_post${stored_post.post_id}">
												顯示、收攏貼文</button>

											<!-- show complete post -->
											<div class="collapse"
												id="manager_show_complete_post${stored_post.post_id}">
												<div class="card card-body" style="border-style: none">
													${stored_post.post_content}</div>
											</div>
										</div><br>
									</c:forEach>
									</div>

							</div>

						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer class="container py-5" id="bookWebFooter"></footer>
	<!-- footer -->


</body>

</html>