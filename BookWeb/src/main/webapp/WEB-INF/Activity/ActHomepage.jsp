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


<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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
		$("#bookWebheader").load("//eeit125g2.ddns.net:8080/BookWeb/header");
		$("#bookWebFooter").load("//eeit125g2.ddns.net:8080/BookWeb/footer");

	});
</script>

<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWIiCwzdTb9GmpcVV2ulFDGmVube4SI3Y&callback=initMap" async defer></script>

<style>
p {
	color: #293241;
	font-family: 'Noto Serif TC', serif;
	height:45px;
	vertical-align:middle;

	
/* 	text-align: center */
}

.caption{
width:345px
}

/* .menu { */
/* 	margin-top: 10px; */
/* 	width: 250px; */
/* 	height: auto */
/* } */

.list {
	font-size: 20px;
}

.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

/*  @media ( min-width : 768px) {  */
/*  	.bd-placeholder-img-lg {  */
/*  		font-size: 3.5rem;  */
/*  	}  */
/*  }  */

td {
	width: 100px;
	border: solid 1px;
	text-align: center;
}

.mapbutton{
 border:none


}

/* body{ */
/*  background-image:url('image/ex1.png');  */
/* /* background-color:pink; */ */
/* } */

.modal-content {
  height: 100%;
  border-radius: 0;
  position:relative;
}

.modal-footer {
  border-radius: 0;
  bottom:0px;
  position:absolute;
  width:740px;
}

h6{
font-size:25px;
font-weight:bold;
align:center
}


/* .line{ */
/* align:center */
/* } */

.searchbar{
background-image: url('${pageContext.request.contextPath}/image/m1.jpg')


}

.btn-group .button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

.btn-group .button:hover {
  background-color: #3e8e41;
}

</style>
</head>

<body>
<c:url value="" />
	<!-- header -->
	<header class=" blog-header" id="bookWebheader"></header>
	<!-- header -->

	<div class="container media" >
		<!-- body -->
		<div class="row">
			<br>
			


				<main>
				<br>
				<nav class="navbar navbar-expand-lg navbar-light bg-light searchbar btn-group" style="height:80px">
				
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"  style="align:center"></span>
				  </button>
				  
				  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				    <form action="showCreateForm" id="test">
					<button type="button" class="btn btn-info button" id="create" style="background-color:#eef4ed;color:#ADADAD;font-weight:bold">新增活動</button>
				    </form>
				    
				    <ul class="navbar-nav mr-auto ">
				      <li class="nav-item active" >
				      <button id="finish1" type="button"  class="btn btn-info button" style="background-color:#eef4ed;color:#ADADAD;font-weight:bold">一鍵輸入</button>
				      </li>

				    </ul>	    			
				      <input class="form-control " id="enter1" type="search" placeholder="請輸入活動關鍵字" aria-label="Search" style="width:300px;height:54px">
				      <input id="search" class="btn btn-info button" type="button" value="Search" style="height:54px;color:white;border:none;background-color:#a1cca5;font-weight:bold;font-size:17px">
				  </div>
				</nav>
				
				<script>

$("#finish1").click(function(){

$('#enter1').val('未來') ;
});

</script>
				
				
				<br>

				<hr>
				<section>
					<div>
						<div class="container" style="text-align: center">
							<h1 >活動清單</h1>
						</div>
					</div>
				</section>
				<hr style="height: 1px; border: none; color: #333; background-color: #333;" >
				<section class="container" style="width:1200px">
					<div class="row" id="change" >
						<c:forEach var='act' items='${allacts}'>	
							<div class="col-6,col-md-3" style="width: 380px; height: 800px;" >
								<div class="thumbnail " style="width: 345px; height: 800px;">
									<div align="center">
									<p><b style="font-size:25px;align:center">${act.act_Name}</b></p>
									<input type ="image" src="${act.act_Image}" data-toggle="modal" data-target="#exampleModalCenter${act.act_Name}" style="width: 345px; height: 420px; align:center" class="center"></div>
										<div class="modal fade" id="exampleModalCenter${act.act_Name}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  										<div class="modal-dialog modal-dialog-centered" role="document">
   										 <div class="modal-content" style="width:800px; height:900px">
    									  <div class="modal-header" >
<!--     									  //彈跳視窗標頭 -->
      										  <h3 class="modal-title"  id="#exampleModalCenter${act.act_Name}">${act.act_Name}</h3>
												<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://eeit125g2.ddns.net:8080
												/BookWeb/toLogin" data-color="default" data-size="large" data-count="false" style="display: none;"></div>
 													<script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
       											 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     											     <span aria-hidden="true">&times;</span>
     												   </button>
     														 </div>
     														 
<!--      									//彈跳視窗內容 -->
     										 <div class="modal-body" style="width:800px; height:900px">
     										 <div class="container">
											 <div class="media">
     										 <input type ="image" src="${act.act_Image}"  style="width: 350px; height: 390px; align:center">
     										 
     										 <div class="media-body ml-5">
     										 
     										 <form  class="col-ml-4">
     										 <br>
											 <div class="form-group">
											 <div style="font-size:20px">活動標籤:<br><a href="#" class="btn btn-info" style="font-size:1em">${act.act_Tag}</a> 
											</div>
											 </div>
											 
											 <div class="form-group">
										     <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/date.png style="width:22px;height:22px">${act.act_Date}</div>
											 </div>
											 
											 <div class="form-group">
											 <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/time.png style="width:22px;height:22px">${act.act_Time}</div>										     									     
										     </div>
										     
										      <div class="form-group">
										     <div style="font-size:20px"><img src=${pageContext.request.contextPath}/image/map1.png style="width:22px;height:22px" >${act.act_Loc}</div>
										     </div>     
										     
										     <div class="form-group">
										     <div style="font-size:20px">活動嘉賓:${act.act_Guest}</div>
										     </div>
										     
										     <div class="form-group">
										     <div style="font-size:20px">活動名額:${act.act_Differentpax}/${act.act_Pax}</div>
										     </div>										  
										     
      										 </form>
										     </div>
										     		
										     <hr>
      										 </div>
      										 <br><br>
											<h3 align="center">活動簡介:</h3>
											<hr>
											<div>${act.act_Intro}</div>
											<br>
											
											
											
     									 <div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        									<input type="hidden" id="ID" value="${act.act_ID}">
        									<input type="hidden" id="check" value="${check}">
      										 <a href="<c:url value='/showJoinForm'/>?act_ID=${act.act_ID}"><button type="button" id="joinact" class="btn btn-primary">報名</button></a>       										 
     										   </div>
  											  </div>
 											 </div>
											</div>				
										   </div>
										   </div>
<!-- 										   </div> -->
<!--       										//頁尾 -->

<!-- 									大視窗的內容 -->
									<div class="caption" style="width:345px">
									<p style="background-color:#9ed8db;color:#6C6C6C;border:none;font-size:20px" class="btn btn-info" >${act.act_Theme}</p>
									<!-- line share的東西 -->
									<div style="float:right">
								  <div class="line-it-button" data-lang="zh_Hant" data-type="share-c" data-ver="3" data-url="https://social-plugins.line.me/zh_TW/how_to_install" data-color="default" data-size="large" data-count="false" style="display: none;"></div>
									</div>
									<!-- line share的東西 -->
										<br>
										<br>
										<div align="center"><span style="font-size:20px">&ensp;<img src=${pageContext.request.contextPath}/image/date.png style="width:25px;height:25px">${act.act_Date}</span>
										<span style="font-size:20px">&ensp;<img src=${pageContext.request.contextPath}/image/time.png style="width:22px;height:22px">${act.act_Time}</span></div>
										<br>
										<div align="center"><button class="mapbutton" style="background-color:white;font-size:20px" id="myModal"  value="${act.act_Loc}" data-toggle="modal"  title="Google地圖" data-target="#myModal1"><img src=${pageContext.request.contextPath}/image/map1.png style="width:22px;height:22px" title="Google地圖">${act.act_Loc}</button></div>
										<hr>

<!-- 										<p> -->
										
										
<!-- 										<p> -->
<%-- 										<a href="<c:url value='/showUpdateForm'/>?act_ID=${act.act_ID}"><button  class="btn btn-outline-info">編輯</button></a> --%>
<%-- 										<a href="<c:url value='deleteAct'/>?act_ID=${act.act_ID}"><button  class="btn btn-outline-info">刪除</button></a> --%>
<%-- 										<button class="btn btn-outline-info"><a href="<c:url value='/showJoinForm'/>?act_ID=${act.act_ID}">報名</a></button> --%>
<!-- 										</p> -->
										
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
	console.log("1231456")
	console.log($("#check").val())
	console.log($('#memberid').val())
if($("#check").val() == "repeat"){
	alert("你已報名過此活動")
}
})
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
		window.location.href="//eeit125g2.ddns.net:8080/BookWeb/toLogin";
	}
})

	
	
	$('#search').click(function(){
		console.log("123")
		var act_ID = $('#ID').val();
	var keyword=$('#enter1').val();
		$.ajax({
			async : false,
			cache : false,
			url : "searchkeyword",
			data : {'keyword' : keyword},
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var insertData="";
				for (let i = 0; i < data.length; i++) {
					insertData += "<div class='col-6,col-md-3' style='width: 380px; height: 800px'>"
								+"<div class='thumbnail' style='width: 345px; height: 800px'>"
								+"<div align=\"center\">"
								+"<p><b style=\"font-size:25px;align:center\">"+data[i].act_Name+"</b></p>"
								+"<input type =\"image\" src=\""+data[i].act_Image+"\" data-toggle=\"modal\" data-target=\"#exampleModalCenter${act.act_Name}\" style=\"width: 345px; height: 420px; align:center\" class=\"center\"></div>"
									+"<div class=\"modal fade\" id=\"exampleModalCenter${act.act_Name}\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">"
										+"<div class=\"modal-dialog modal-dialog-centered\" role=\"document\">"
										 +"<div class=\"modal-content\" style=\"width:800px; height:900px\">"
									  +"<div class=\"modal-header\" >"
      										 + "<h3 class='modal-title' id='#exampleModalCenter"+data[i].act_Name+"'>"+data[i].act_Name+"</h3>"
       											+ "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
     											  +  "<span aria-hidden='true'>&times;</span>"
     												  + "</button>"
     														+ "</div>"
     										+"<div class='modal-body' style=\"width:800px; height:900px\">"
     										+"<div class=\"container\">"
											 +"<div class=\"media\">"
    										 +"<input type =\"image\" src=\""+data[i].act_Image+"\"  style=\"width: 300px; height: 380px; align:center\">"
    										 
    										 +"<div class=\"media-body ml-5\">"
    										 
    										 +"<form  class=\"col-ml-4\">"
    										 +"<br>"
											 +"<div class=\"form-group\">"
											 +"<div>活動標籤:<br><a href=\"#\" class=\"btn btn-info\" style=\"font-size:1em\">"+data[i].act_Tag+"</a>" 
											+"</div>"
											 +"</div>"
											 
											 +"<div class=\"form-group\">"
										     +"<div><img src=${pageContext.request.contextPath}/image/date.png style=\"width:22px;height:22px\">"+data[i].act_Date+"</div>"
											 +"</div>"
											 
											 +"<div class=\"form-group\">"
											 +"<div><img src=${pageContext.request.contextPath}/image/time.png style=\"width:22px;height:22px\">"+data[i].act_Time+"</div>"										     									     
										     +"</div>"
										     
										      +"<div class=\"form-group\">"
										     +"<div><img src=${pageContext.request.contextPath}/image/map1.png style=\"width:22px;height:22px\">"+data[i].act_Loc+"</div>"
										     +"</div>"     
										     
										     +"<div class=\"form-group\">"
										     +"<div>活動嘉賓:"+data[i].act_Guest+"</div>"
										     +"</div>"
										     
										     +"<div class=\"form-group\">"
										     +"<div>活動名額:"+data[i].act_Differentpax+"/"+data[i].act_Pax+"</div>"
										     +"</div>"
     										 +"</form>"
										     +"</div>"	
										+"<hr>"
      										+"</div>"
      										+"<br><br>"
											+"<h3 align=\"center\">活動簡介:</h3>"
											+"<hr>"
											+"<div>"+data[i].act_Intro+"</div>"
											+"<br>"
      										
     									 +"<div class='modal-footer'>"
        									+"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>"
        									+"<input type=\"hidden\" id=\"check\" value=\"${check}\">"
        									 +"<a href=\"<c:url value='/showJoinForm'/>?act_ID="+data[i].act_ID+"\"><button type=\"button\" id=\"joinact\" class=\"btn btn-primary\">報名</button></a>"
     										   +"</div>"
  											  +"</div>"
 											 +"</div>"
											+"</div>"		
											+"</div>"
											+"</div>"
// 									+"</div>"
									+"<div class=\"caption\" style=\"width:345px\">"
									+"<p style=\"margin-left:120px;background-color:#9ed8db;color:#6C6C6C;border:none;font-size:20px\" class=\"btn btn-info\" >"+data[i].act_Theme+"</p>"
									<!-- line share的東西 -->
									+"<div style=\"float:right\">"
								  +"<div class=\"line-it-button\" data-lang=\"zh_Hant\" data-type=\"share-c\" data-ver=\"3\" data-url=\"https://social-plugins.line.me/zh_TW/how_to_install\" data-color=\"default\" data-size=\"large\" data-count=\"false\" style=\"display: none;\"></div>"
 									+"</div>"
									<!-- line share的東西 -->
										+"<br>"
										+"<br>"
										+"<div align=\"center\"><span style=\"font-size:20px\">&ensp;<img src=${pageContext.request.contextPath}/image/date.png style=\"width:25px;height:25px\">"+data[i].act_Date+"</span>"
										+"<span style=\"font-size:20px\">&ensp;<img src=${pageContext.request.contextPath}/image/time.png style=\"width:22px;height:22px\">"+data[i].act_Time+"</span></div>"
										+"<br>"
										+"<div align=\"center\"><button class=\"mapbutton\" style=\"background-color:white;font-size:20px\" id=\"myModal\"  value=\""+data[i].act_Loc+"\" data-toggle=\"modal\"  title=\"Google地圖\" data-target=\"#myModal1\"><img src=${pageContext.request.contextPath}/image/map1.png style=\"width:22px;height:22px\" title=\"Google地圖\">"+data[i].act_Loc+"</button></div>"
										+"<hr>"		
									+"</div>"
								+"</div>"
							+"</div>"
					$("#change").html(insertData);
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