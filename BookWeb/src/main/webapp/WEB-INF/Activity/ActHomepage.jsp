<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!--     href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>Fun Tribe</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<script>
	$(document).ready(function() {
		$("#bookWebheader").load("//localhost:8080/BookWeb/header");
		$("#bookWebFooter").load("//localhost:8080/BookWeb/footer");

	});
</script>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWIiCwzdTb9GmpcVV2ulFDGmVube4SI3Y&callback=initMap" async defer></script>

<style>
p {
	color: #293241;
	font-size: 15px;
	font-family: 'Noto Serif TC', serif;
	text-align: center
}

.menu {
	margin-top: 10px;
	width: 250px;
	height: auto
}

.list {
	font-size: 20px;
}

.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

td {
	width: 100px;
	border: solid 1px;
	text-align: center;
}
</style>
</head>

<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media">
		<!-- body -->

		<div class="row">
			<br>

			<main>
				<!--? Hero Area Start-->
				<div class="slider-area hero-bg1 hero-overly">
					<div
						class="single-slider hero-overly  slider-height1 d-flex align-items-center">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-xl-10 col-lg-10">
									<!-- Hero Caption -->
									<div class="hero__caption pt-100">
										<h1>活動探索</h1>
										<!--                                 <p>Let's uncover the best places to eat, drink, and shop nearest to you.</p> -->
									</div>
									<!--Hero form -->
									<form action="#" class="search-box mb-100">
										<div class="input-form form-inline">
											<input type="text" placeholder="What are you finding?">
										</div>
										<div class="select-form form-inline">
											<div class="select-itms form-inline">
												<select name="select" id="select1">
													<option value="">In where?</option>
													<option value="">Catagories One</option>
													<option value="">Catagories Two</option>
													<option value="">Catagories Three</option>
													<option value="">Catagories Four</option>
												</select>
											</div>
										</div>
										<div class="search-form">
											<button class="btn btn-outline-info">
												<a href="#"><i class="ti-search"></i> Search</a>
											</button>
										</div>
									</form>
									<!-- hero category1 img -->
									<div class="category-img text-center">
										<a href="listing.html"> <img
											src="assets/img/gallery/hero_category1.png" alt=""></a> <a
											href="listing.html"> <img
											src="assets/img/gallery/hero_category2.png" alt=""></a> <a
											href="listing.html"> <img
											src="assets/img/gallery/hero_category3.png" alt=""></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Hero Area End-->


				<!--     <div style="margin-top:30px"> -->
				<!--         <div class="row"> -->
				<!--             <nav class="col-3"> -->
				<!--                 <ul class="menu"> -->
				<!--                     <h5>查詢條件:</h5><br> -->
				<!--                     <li class=list>時間:</li> -->
				<!--                     <div class="st1"> -->
				<!--                         <label for=" " class="t1"></label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="all">全部 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="today">今天 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="tomorrow">明天 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="thiswk">本週 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="thiswknd">本週末 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="Date" value="nextwk">下週 -->
				<!--                         </label><br> -->
				<!--                         <label>選擇日期 -->
				<!--                             <input type="date" name="Date"> -->
				<!--                         </label><br> -->
				<!--                     </div><br> -->
				<!--                     <li class=list>地區:</li> -->
				<!--                     <div class="st1"> -->
				<!--                         <label for=" " class="t1"></label> -->
				<!--                         <label><input type="checkbox" name="location" value="KLU">基隆市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TPH">新北市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TPE">台北市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TYC">桃園市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="HSH">新竹縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="HSC">新竹市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="MAC">苗栗市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="MAL">苗栗縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TXG">台中市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="CWH">彰化縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="CWS">彰化市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="NTC">南投市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="NTO">南投縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="YLH">雲林縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="CHY">嘉義縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="CYI">嘉義市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TNN">台南市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="KHH">高雄市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="IUH">屏東縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="PTS">屏東市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="ILN">宜蘭縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="ILC">宜蘭市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="HWA">花蓮縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="HWC">花蓮市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TTC">台東市</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="TTT">台東縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="PEH">澎湖縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="GNI">綠島</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="KYD">蘭嶼</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="KMN">金門縣</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="MZW">馬祖</label><br> -->
				<!--                         <label><input type="checkbox" name="location" value="LNN">連江縣</label><br> -->
				<!--                     </div><br> -->
				<!--                     <li class=list>類別:</li> -->
				<!--                     <div class="st1"> -->
				<!--                         <label for=" " class="t1"></label> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="sport">書展 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="music">講座 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="movie">公益 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="travel">換書 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="travel">簽書會 -->
				<!--                         </label><br> -->
				<!--                         <label> -->
				<!--                             <input type="checkbox" name="hobby" value="travel">精選咖啡廳 -->
				<!--                         </label><br> -->
				<!--                     </div> -->
				<!--                 </ul> -->
				<!--             </nav> -->


				<!--              <section class="container"> -->
				<!--         <div class="row"> -->
				<%--             <c:forEach var='act' items='${allacts}'> --%>
				<!--             <div class="col-6,col-md-3 " style="width: 360px; height: 360px">         -->
				<%--                 <h2>${act.act_Name}</h2> --%>
				<%--                 <h5>${act.act_Theme}</h5> --%>
				<%--                 <h5>${act.act_Date}</h5> --%>
				<%--                 <img src="${pageContext.request.contextPath}/image/${act.act_Image}" style="width:250px; height: 300px;"/> --%>
				<%--                 <p>${act.act_Theme}</p> --%>
				<%--                 <p>${act.act_Intro}</p> --%>
				<!--                 <br> -->
				<!--                 <h2>咖啡廳推薦</h2> -->
				<!--                 <h5>Title description, Dec 7, 2020</h5> -->
				<!--                 <img src="Images/Coffee shopppp.jpeg" width="300px" height="400px"> -->
				<!--                 <p>Some text..</p> -->
				<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
				<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
				<!--                     exercitation ullamco.</p> -->
				<!--                 <br> -->

				<!--             </div> -->

				<section>
					<div>
						<div class="container" style="text-align: center">
							<h1 >活動清單</h1>
						</div>
					</div>
				</section>
				<hr style="height: 1px; border: none; color: #333; background-color: #333;">
				<section class="container">
					<div class="row">
						<c:forEach var='act' items='${allacts}'>
							<div class="col-6,col-md-3" style="width: 350px; height: 1000px">
								<div class="thumbnail" style="width: 320px; height: 1000px">
									<p>
										<b style='font-size: 25px;'>${act.act_Name}</b>
									</p>
									<p>
										<img src="${act.act_Image}"
											style="width: 300px; height: 380px;" />
									</p>
									<div class="caption">
										<p>${act.act_Theme}</p>
										<p>${act.act_Date}</p>
										<p>${act.act_Loc}</p>
										<p>${act.act_Intro}</p>
																				
										
										<hr>
										<p>
<%-- 										<button class="btn btn-outline-info"><a href="<c:url value='/showUpdateForm'/>?act_ID=${act.act_ID}" />詳細資料</a></button> --%>
										
										<!-- Trigger the modal with a button -->
										<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal${act.act_ID}">詳細資料</button>

										<!-- Modal -->
										<div id="myModal${act.act_ID}" class="modal fade" role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title" style="text-align:center">詳細資料</h4>
													</div>
													<div class="modal-body">
														<p>${act.act_Theme}</p>
										                <p>${act.act_Date}</p>
										                <p>${act.act_Loc}</p>
										                <p>${act.act_Intro}</p>
										                <!--GoogleMap的東東 -->
										<div id="map" style="width: 400px; height: 500px" ></div>
										                
										                
<script>
var map, geocoder;

function initMap() {
  geocoder = new google.maps.Geocoder();
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17
  });

var address = '${act.act_Loc}';
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      console.log(status);
    }
  });
}
</script>	

									                
													</div>
													<div class="modal-footer">
													
														<button type="button" class="btn btn-default" data-dismiss="modal">關閉視窗</button>
													</div>
												</div>

											</div>
										</div>
										
										<p>
										<button class="btn btn-outline-info"><a href="<c:url value='/showUpdateForm'/>?act_ID=${act.act_ID}" />編輯</a></button>
										<button class="btn btn-outline-info"><a href="<c:url value='deleteAct'/>?act_ID=${act.act_ID}">刪除</a></button>
										<button class="btn btn-outline-info"><a href="<c:url value='/showJoinForm'/>?act_ID=${act.act_ID}">報名</a></button>
										</p>
										
										

										<!--                         <p> -->
										<%--                         	<a href="<spring:url value='/product?id=${product.bookId}' />" --%>
										<!--     							class="btn btn-primary"> -->
										<!--     							<span class="glyphicon-info-sigh glyphicon"></span>詳細資料 -->
										<!--  							</a> -->

										<%-- 							<a href="<spring:url value='product.json?id=${product.bookId}' />"    --%>
										<!-- 								class="btn btn-primary">  -->
										<!-- 								<span class="glyphicon-info-sigh glyphicon"></span>JSON -->
										<!-- 							</a> -->
										<!--                         </p> -->
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</section>


				<footer class="container py-5" id="bookWebFooter"></footer>
				<!-- footer -->
		</div>


		<button class="btn btn-outline-info">
			<a href='showCreateForm'>新增活動</a>
		</button>
	</div>

	<br>


</body>



</html>