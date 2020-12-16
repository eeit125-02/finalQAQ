<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
</style>

<script>
	$(document).ready(function() {
		$("#bookWebheader").load("<c:url value='/header'/>");
		$("#bookWebFooter").load("<c:url value='/footer'/>");
	});
</script>
<title>書適論壇</title>
</head>

<body>
	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container-fluid" style="margin: 20px 0px">
		<div class="row">
			<!-- sidebar area -->
			<div class="col-2 text-center">
				<!-- ====================================================sidebar==================================================== -->
				<h2>書適論壇</h2>
				<br>
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-novel-list" data-toggle="list" href="#list-novel"
						role="tab">討論天地</a> <a
						class="list-group-item list-group-item-action"
						id="list-member-list" data-toggle="list" href="#list-member"
						role="tab">會員專區</a> <a
						class="list-group-item list-group-item-action"
						id="list-manager-list" data-toggle="list" href="#list-manager"
						role="tab">管理員專區</a>
				</div>
			</div>

			<!-- content area -->
			<div class="col-10" style='text-align: center;'>

				<!-- content connect to sidebar -->
				<div class="tab-content" id="nav-tabContent">

					<!-- =====================================================discussion board area===================================================== -->
					<div class="tab-pane fade show active" id="list-novel"
						role="tabpanel">
						<!-- search keyword -->
						<nav class="navbar navbar-light bg-light justify-content-between">
							<a class="navbar-brand">搜尋貼文關鍵字­</a>
							<form class="form-inline">
								<input class="form-control mr-sm-2" type="search"
									placeholder="請輸入關鍵字­">
								<button class="btn btn-outline-primary my-2 my-sm-0"
									type="button" id="search_keyword">Search</button>
							</form>
						</nav>
						<br>


						<!-- discussion board top tab -->
						<ul class="nav nav-tabs" id="novelTab" role="tablist">

							<li class="nav-item"><a class="nav-link" id="novel_rule-tab"
								data-toggle="tab" href="#novel_rule" role="tab">板規</a></li>

							<li class="nav-item"><a class="nav-link active"
								id="novel_latest-tab" data-toggle="tab" href="#novel_latest"
								role="tab">最新貼文</a></li>

							<li class="nav-item"><a class="nav-link"
								id="novel_search-tab" data-toggle="tab" href="#novel_search"
								role="tab">搜尋結果</a></li>

						</ul>
						<br>

						<!-- content connect to top tab -->
						<div class="tab-content" id="novelTabContent">
							<!-- content of rule tab -->
							<div class="tab-pane fade" id="novel_rule" role="tabpanel">
								<h1>請當有禮貌的小朋友</h1>
							</div>

							<!-- content of latest post tab -->
							<div class="tab-pane fade show active" id="novel_latest"
								role="tabpanel">

								<!-- post and command -->
								<c:forEach var="stored_post" items="${allPost}">
									<div
										style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
										<p>[member] ${stored_post.post_time}</p>
										<h3>${stored_post.post_title}</h3>
										<p>${stored_post.post_content}</p>

										<form:form method='post' action='add_command'
											modelAttribute="commandBean">
											<div class="input-group mb-3">
												<form:input type="text" class="form-control"
													id="command_input" path="command_content"
													placeholder="請輸入留言" />
												<form:hidden path="command_time" />
												<form:hidden path="mb_id" />
												<form:hidden path="postBean.post_id"
													value="${stored_post.post_id}" />
												<form:hidden path="postBean.post_title"
													value="${stored_post.post_title}" />
												<form:hidden path="postBean.post_content"
													value="${stored_post.post_content}" />
												<form:hidden path="postBean.mb_id"
													value="${stored_post.mb_id}" />
												<form:hidden path="postBean.post_time"
													value="${stored_post.post_time}" />
												<div class="input-group-append">
													<button class="btn btn-outline-secondary" id="command_btn"
														type="submit">留言</button>
												</div>
											</div>
										</form:form>

										<c:forEach var="stored_command" items="${allCommand}">
											<c:set var="pi" value="${stored_post.post_id}" />
											<c:set var="ci" value="${stored_command.postBean.post_id}" />
											<c:if test="${pi==ci}">
												<div
													style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
													<p>[member] ${stored_command.command_time}</p>
													<p>${stored_command.command_content}</p>
												</div>
											</c:if>
										</c:forEach>

									</div>
									<br>
								</c:forEach>

							</div>

							<!-- content of keyword searching tab -->
							<div class="tab-pane fade" id="novel_search" role="tabpanel">

								<!-- post and command -->
								<div
									style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
									<p>[member] [time]</p>
									<h3>[post title]</h3>
									<p>[post content]</p>
									<span>留言 [no.]</span> <br> <br>

									<div class="input-group mb-3">
										<input type="text" class="form-control" id="command_input"
											placeholder="請輸入留言">
										<div class="input-group-append">
											<button class="btn btn-outline-secondary" id="command_btn"
												type="button">留言</button>
										</div>

									</div>
									<div
										style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
										<p>[member] [time]</p>
										<p>[command]</p>
									</div>
								</div>
								<br>

							</div>
						</div>
					</div>
					<!-- =====================================================member page===================================================== -->
					<div class="tab-pane fade" id="list-member" role="tabpanel">
						<h3>[會員名稱] 的個人頁面</h3>
						<br>

						<!-- member page top tab -->
						<ul class="nav nav-pills mb-3 justify-content-center"
							id="pills-tab" role="tablist" style="text-align: center;">
							<li class="nav-item"><a class="nav-link active"
								id="pills-member_new_post-tab" data-toggle="pill"
								href="#pills-member_new_post" role="tab">新增貼文</a></li>
							<li class="nav-item"><a class="nav-link"
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

									<form:form method='post' action='add_post'
										modelAttribute="postBean">
										<div class="form-group row">
											<label for="new_title" class="col-2 text-center h5">貼文標題</label>
											<div class="col-9">
												<form:input type="text" class="form-control" id="post_title"
													path="post_title" placeholder="請輸入貼文標題" />
											</div>
										</div>
										<div class="form-group row">
											<label for="new_content" class="col-2 text-center h5">貼文內容</label>
											<div class="col-9">
												<form:textarea class="form-control" id="post_content"
													path="post_content" rows="6" placeholder="請輸入貼文內容"></form:textarea>
											</div>
										</div>
										<form:hidden path="post_time" />
										<form:hidden path="mb_id" />
										<div class="text-center">
											<button type="submit" class="btn btn-primary">送出貼文</button>
										</div>
									</form:form>
								</div>
							</div>

							<!-- personal post record -->

							<div class="tab-pane fade" id="pills-member_post" role="tabpanel">
								<c:forEach var="stored_post" items="${allPost}">
									<div
										style="border: #ADADAD 2px solid; border-radius: 5px; text-align: left; padding: 10px; margin: 0px 10px">
										<form class="form-inline float-right">

											<button class="btn btn-outline-secondary btn-sm"
												type="button" style="margin-right: 10px" data-toggle="modal"
												data-target="#edit_post">修改</button>

											<button class="btn btn-outline-secondary btn-sm"
												type="submit">刪除</button>
										</form>

										<!-- edit post jump out -->
										<div class="modal fade" id="edit_post" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="edit_postLabel">修改貼文頁面</h5>
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>

													<div class="modal-body">

														<div class="form-group">
															<label for="article-name" class="col-form-label h5">貼文標題</label>
															<input type="text" class="form-control" id="article-name"
																value="${stored_post.post_title}">
														</div>
														<div class="form-group">
															<label for="article-text" class="col-form-label h5">貼文內容</label>
															<textarea class="form-control" id="article-text"
																rows="10">${stored_post.post_content}</textarea>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">取消</button>
														<button type="button" class="btn btn-primary">送出修改內容</button>
													</div>
												</div>
											</div>
										</div>



										<p>[member] ${stored_post.post_time}</p>
										<h3>${stored_post.post_title}</h3>
										<p>${stored_post.post_content}</p>

										<form:form method='post' action='add_command'
											modelAttribute="commandBean">
											<div class="input-group mb-3">
												<form:input type="text" class="form-control"
													id="command_input" path="command_content"
													placeholder="請輸入留言" />
												<form:hidden path="command_time" />
												<form:hidden path="mb_id" />
												<form:hidden path="postBean.post_id"
													value="${stored_post.post_id}" />
												<form:hidden path="postBean.post_title"
													value="${stored_post.post_title}" />
												<form:hidden path="postBean.post_content"
													value="${stored_post.post_content}" />
												<form:hidden path="postBean.mb_id"
													value="${stored_post.mb_id}" />
												<form:hidden path="postBean.post_time"
													value="${stored_post.post_time}" />
												<div class="input-group-append">
													<button class="btn btn-outline-secondary" id="command_btn"
														type="submit">留言</button>
												</div>
											</div>
										</form:form>

										<c:forEach var="stored_command" items="${allCommand}">
											<c:set var="pi" value="${stored_post.post_id}" />
											<c:set var="ci" value="${stored_command.postBean.post_id}" />
											<c:if test="${pi==ci}">
												<div
													style="background-color: #C4E1FF; margin: 10px; padding: 5px; border-radius: 10px;">
													<p>[member] ${stored_command.command_time}</p>
													<p>${stored_command.command_content}</p>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<br>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
				<!-- =====================================================manager page===================================================== -->
				<div class="tab-pane fade" id="list-manager" role="tabpanel">
					管理員專區</div>
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