<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>書適圈</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <!-- search bar的東東 --> 
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!-- <!-- search bar的東東 --> 


<script src='https://kit.fontawesome.com/a076d05399.js'></script>

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
<link rel="icon" href="${pageContext.request.contextPath}/image/logo1.ico" type="image/x-icon" />
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

.mapbutton{
 border:none


}

</style>
</head>

<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media" >
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
											<input type="text" id="enter1" placeholder="What are you finding?">
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
											<button class="btn btn-outline-info" id="search">
												<a href="#" ><i class="ti-search"></i> Search</a>
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


				<hr>
				<section>
					<div>
						<div class="container" style="text-align: center">
							<h1 >活動清單</h1>
						</div>
					</div>
				</section>
				<hr style="height: 1px; border: none; color: #333; background-color: #333;">
				<section class="container" style="width:1200px">
					<div class="row" id="change">
						<c:forEach var='act' items='${allacts}'>	
							<div class="col-6,col-md-3" style="width: 380px; height: 1000px">
								<div class="thumbnail" style="width: 350px; height: 1000px">
									<p>
										<b style='font-size: 25px;'>${act.act_Name}</b>
									</p>
									<div align="center">
									<input type ="image" src="${act.act_Image}" data-toggle="modal" data-target="#exampleModalCenter${act.act_Name}" style="width: 300px; height: 380px; align:center">
										<div class="modal fade" id="exampleModalCenter${act.act_Name}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  										<div class="modal-dialog modal-dialog-centered" role="document">
   										 <div class="modal-content">
    									  <div class="modal-header">
<!--     									  //標頭 -->
      										  <h5 class="modal-title" id="#exampleModalCenter${act.act_Name}">${act.act_Name}</h5>
      										  
       											 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     											     <span aria-hidden="true">&times;</span>
     												   </button>
     														 </div>
<!--      									//彈跳視窗內容 -->
     										 <div class="modal-body">
     										 <p>${act.act_Theme}</p>
										     <p>${act.act_Date}</p>										     
										     <p>${act.act_Loc}</p>     
										     <p>${act.act_Intro}</p>
										     <span>${act.act_Differentpax}</span><span>/</span><span>${act.act_Pax}</span>			
										     <hr>
      										 </div>
<!--       										//頁尾 -->
     									 <div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        									<input type="hidden" id="check" value="${check}">
      										 <a href="<c:url value='/showJoinForm'/>?act_ID=${act.act_ID}"><button type="button" id="joinact" class="btn btn-primary">報名</button></a> 
     										    </div>
  											  </div>
 											 </div>
											</div>				
									</div>
									<div class="caption">
										<p>${act.act_Theme}</p>
										<p>${act.act_Date}</p>
										<p></p>
										<p><img src=${pageContext.request.contextPath}/image/iconfinder_clock_1814097.png style="width:22px;height:22px">${act.act_Time}</p>
										<p><button class="mapbutton" style="background-color:white" id="myModal"  value="${act.act_Loc}" data-toggle="modal"  title="Google地圖" data-target="#myModal1"><img src=${pageContext.request.contextPath}/image/iconfinder_location_1814106.png style="width:25px;height:25px" title="Google地圖">${act.act_Loc}</button></p>
										<hr>
										<p>
										
										<!-- Trigger the modal with a button -->
										
<%-- 										<button type="button" id = "myModal"  value="${act.act_Loc}" data-toggle="modal" data-target="#myModal1"><img src="map.png">活動地圖</button> --%>
<!-- 										<div><a href="https://www.flaticon.com/authors/freepik" title="Freepik"></a><a href="https://www.flaticon.com/" title="Flaticon"></a></div> -->
										
										<!-- Modal -->												
										<p>
										<a href="<c:url value='/showUpdateForm'/>?act_ID=${act.act_ID}"><button  class="btn btn-outline-info">編輯</button></a>
										<a href="<c:url value='deleteAct'/>?act_ID=${act.act_ID}"><button  class="btn btn-outline-info">刪除</button></a>
<%-- 										<button class="btn btn-outline-info"><a href="<c:url value='/showJoinForm'/>?act_ID=${act.act_ID}">報名</a></button> --%>
										</p>
										
									</div>
								</div>
							</div>
						</c:forEach>				
					</div>
				</section>
				<div id="myModal1" class="modal" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" style="text-align:center" align="left">${act.act_Loc}</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
				                <div id="map" style="width: 465px; height: 500px"></div>
							</div>
							<div class="modal-footer">
							
								<button type="button" class="btn btn-outline-info" data-dismiss="modal">關閉視窗</button>
							</div>
						</div>
					</div>
				</div>
		</div>

		<form action="showCreateForm" id="test">
		<button type="button" class="btn btn-outline-info" id="create">新增活動</button>
	    </form>
	    
<%-- 	    <form action="showJoins" id="test1"> --%>
<!-- 		<button type="button" class="btn btn-outline-info" id="showjoin">查看報名紀錄</button> -->
<%-- 	    </form> --%>
	    
	    <a href="<c:url value='/showJoins'/>"><button class="btn btn-outline-info">查看報名紀錄</button></a>
	    
	</div>

	<br>
				<footer class="container py-5" id="bookWebFooter"></footer>
<script>
var map, geocoder;
var mapId="";
console.log("1231456")
console.log($("#check").val())
console.log($('#memberid').val())
$(document).ready(function(){
if(typeof($.cookie('Member_ID')) != "undefined" ){
	console.log("123")
}
})

if($("#check").val() == "repeat"){
	alert("你已報名過此活動")
}

$('button').click(function(){
	mapId = $(this).val();
	console.log(mapId);
	
	console.log("wwww"+mapId);
	  geocoder = new google.maps.Geocoder();
	  map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 17
	  });
	
	var address = mapId;
	  geocoder.geocode( { 'address': address},
			  function(results, status) {
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
})


$('#create').click(function(){
	if(typeof($.cookie('Member_ID')) != "undefined" ){
		console.log("123");
		$("#test").submit();
	}else{
		alert("請先登入會員");
		window.location.href="//localhost:8080/BookWeb/toLogin";
	}
})

	
	
	$('#search').click(function(){
	var keyword=$('#enter1').val();
		$.ajax({
			async : false,
			cache : false,
			url : "searchkeyword",
			data : {'keyword' : keyword},
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			error : function() {
				alert('123 ');
			},
			success : function(data) {
				console.log(data)
				var insertData = "";
				if(data != null){
				for (let i = 0; i < data.length; i++) {
					insertData += "<div class='col-6,col-md-3' style='width: 350px; height: 1000px'>"
								+"<div class='thumbnail' style='width: 320px; height: 1000px'>"
									+"<p>"
										+"<b style='font-size: 25px;'>"+data[i].act_Name+"</b>"
									+"</p>"
									+"<div>"
									+"<input type ='image' src='"+data[i].act_Image+"' data-toggle='modal' data-target='#exampleModalCenter"+data[i].act_Name+"' style='width: 300px; height: 380px;'>"
										+"<div class='modal fade' id='exampleModalCenter"+data[i].act_Name+"' tabindex=''-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>"
  										+"<div class='modal-dialog modal-dialog-centered' role='document'>"
   										+ "<div class='modal-content'>"
    									 + "<div class='modal-header'>"
      										 + "<h5 class='modal-title' id='#exampleModalCenter"+data[i].act_Name+"'>"+data[i].act_Name+"</h5>"
       											+ "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
     											  +  "<span aria-hidden='true'>&times;</span>"
     												  + "</button>"
     														+ "</div>"
     										+"<div class='modal-body'>"
     										 +"<p>"+data[i].act_Theme+"</p>"
										+"<p>"+data[i].act_Date+"</p>"
										+"<p>"+data[i].act_Loc+"</p>"
										+"<p>"+data[i].act_Intro+"</p>"			
										+"<hr>"
      										+"</div>"
     									 +"<div class='modal-footer'>"
        									+"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>"
      										  +"<button type='button' class='btn btn-primary'>報名</button>"
     										   +"</div>"
  											  +"</div>"
 											 +"</div>"
											+"</div>"				
									+"</div>"
									+"<div class='caption'>"
									 +"<p>"+data[i].act_Theme+"</p>"
										+"<p>"+data[i].act_Date+"</p>"
										+"<p>"+data[i].act_Loc+"</p>"
										+"<p>"+data[i].act_Intro+"</p>"					
										+"<hr>"
										+"<p>"
										+"<button type='button' class='btn btn-info btn-lg' id = 'myModal'  value='"+data[i].act_Loc+"' data-toggle='modal' data-target=''#myModal1'>詳細資料</button>"											
										+"<p>"
										+"<button class='btn btn-outline-info'><a href=\"<c:url value='/showUpdateForm'/>?act_ID="+data[i].act_ID+"\" />編輯</a></button>"
										+"<button class='btn btn-outline-info'><a href=\"<c:url value='deleteAct'/>?act_ID="+data[i].act_ID+"\">刪除</a></button>"
										+"</p>"				
									+"</div>"
								+"</div>"
							+"</div>"
					+"</div>"
				}
				$('#change').html(insertData);
				}else{
					$('#change').html(insertData);
				}
			}
		});
	})
				
	
	/* function initMap() {
		console.log("wwww"+mapId);
	  geocoder = new google.maps.Geocoder();
	  map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 17
	  });
	
	
	} */
</script>

<script>
$(document).ready(function(){
    $(".wrapper-dropdown-3").on("click",function(){
        $(this).toggleClass("active")
    })
    $(".wrapper-dropdown-2").on("click",function(){
        $(this).toggleClass("active")
    })
})
</script>




</body>



</html>