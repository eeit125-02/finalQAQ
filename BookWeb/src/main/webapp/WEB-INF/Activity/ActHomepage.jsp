<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>Fun Tribe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@700&family=Great+Vibes&family=Lobster&family=Monoton&family=Poiret+One&display=swap');
        
        .fakeimg {
            height: 200px;
            background: #aaa;
        }

        .h {
            color: #156f99;
            text-align: center;
            font-family: 'Monoton', cursive;
            font-size: 100px;
            margin-top: 40px;
        }
        .hh{
            color: #156f99;
            text-align: center;
            font-family: 'Noto Serif TC', serif;
            font-weight: bolder;
            font-size: 30px;
            line-height: 50px;
            margin-bottom: 50px;
        }

        p {
            color: #293241;
            font-size: 25px;
            font-family: 'Noto Serif TC', serif;
        }

        .d1 {
            background-color: white;
            font-size: 100px;
            font-family: 'Noto Serif TC', serif;
        }

        .nav {
            background-color: #156f99;
            font-family: 'Noto Serif TC', serif;
            border-bottom: 5px white;
        }

        .menu {
            margin-top: 10px;
            width: 250px;
            height: auto
        }
        .list{
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

td{
width:100px;
border:solid 1px;
text-align:center;
}
    </style>
</head>

<body>
    <div class="d1">
        <h1 class="h">Fun Tribe</h1>
        <div class="hh">共樂聚落</div>
    </div>

    <nav class="navbar navbar-expand-sm  navbar-dark nav">
        <a class="navbar-brand" href="#">查詢活動</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">發佈活動</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">修改活動</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">刪除活動</a>
                </li>
            </ul>
        </div>
    </nav>


    <div style="margin-top:30px">
        <div class="row">
            <nav class="col-sm-2-3">
                <ul class="menu">
                    <h5>查詢條件:</h5><br>
                    <li class=list>時間:</li>
                    <div class="st1">
                        <label for=" " class="t1"></label><br>
                        <label>
                            <input type="checkbox" name="Date" value="all">全部
                        </label><br>
                        <label>
                            <input type="checkbox" name="Date" value="today">今天
                        </label><br>
                        <label>
                            <input type="checkbox" name="Date" value="tomorrow">明天
                        </label><br>
                        <label>
                            <input type="checkbox" name="Date" value="thiswk">本週
                        </label><br>
                        <label>
                            <input type="checkbox" name="Date" value="thiswknd">本週末
                        </label><br>
                        <label>
                            <input type="checkbox" name="Date" value="nextwk">下週
                        </label><br>
                        <label>選擇日期
                            <input type="date" name="Date">
                        </label><br>
                    </div><br>
                    <li class=list>地區:</li>
                    <div class="st1">
                        <label for=" " class="t1"></label>
                        <label><input type="checkbox" name="location" value="KLU">基隆市</label><br>
                        <label><input type="checkbox" name="location" value="TPH">新北市</label><br>
                        <label><input type="checkbox" name="location" value="TPE">台北市</label><br>
                        <label><input type="checkbox" name="location" value="TYC">桃園市</label><br>
                        <label><input type="checkbox" name="location" value="HSH">新竹縣</label><br>
                        <label><input type="checkbox" name="location" value="HSC">新竹市</label><br>
                        <label><input type="checkbox" name="location" value="MAC">苗栗市</label><br>
                        <label><input type="checkbox" name="location" value="MAL">苗栗縣</label><br>
                        <label><input type="checkbox" name="location" value="TXG">台中市</label><br>
                        <label><input type="checkbox" name="location" value="CWH">彰化縣</label><br>
                        <label><input type="checkbox" name="location" value="CWS">彰化市</label><br>
                        <label><input type="checkbox" name="location" value="NTC">南投市</label><br>
                        <label><input type="checkbox" name="location" value="NTO">南投縣</label><br>
                        <label><input type="checkbox" name="location" value="YLH">雲林縣</label><br>
                        <label><input type="checkbox" name="location" value="CHY">嘉義縣</label><br>
                        <label><input type="checkbox" name="location" value="CYI">嘉義市</label><br>
                        <label><input type="checkbox" name="location" value="TNN">台南市</label><br>
                        <label><input type="checkbox" name="location" value="KHH">高雄市</label><br>
                        <label><input type="checkbox" name="location" value="IUH">屏東縣</label><br>
                        <label><input type="checkbox" name="location" value="PTS">屏東市</label><br>
                        <label><input type="checkbox" name="location" value="ILN">宜蘭縣</label><br>
                        <label><input type="checkbox" name="location" value="ILC">宜蘭市</label><br>
                        <label><input type="checkbox" name="location" value="HWA">花蓮縣</label><br>
                        <label><input type="checkbox" name="location" value="HWC">花蓮市</label><br>
                        <label><input type="checkbox" name="location" value="TTC">台東市</label><br>
                        <label><input type="checkbox" name="location" value="TTT">台東縣</label><br>
                        <label><input type="checkbox" name="location" value="PEH">澎湖縣</label><br>
                        <label><input type="checkbox" name="location" value="GNI">綠島</label><br>
                        <label><input type="checkbox" name="location" value="KYD">蘭嶼</label><br>
                        <label><input type="checkbox" name="location" value="KMN">金門縣</label><br>
                        <label><input type="checkbox" name="location" value="MZW">馬祖</label><br>
                        <label><input type="checkbox" name="location" value="LNN">連江縣</label><br>
                    </div><br>
                    <li class=list>類別:</li>
                    <div class="st1">
                        <label for=" " class="t1"></label>
                        <label>
                            <input type="checkbox" name="hobby" value="sport">書展
                        </label><br>
                        <label>
                            <input type="checkbox" name="hobby" value="music">講座
                        </label><br>
                        <label>
                            <input type="checkbox" name="hobby" value="movie">公益
                        </label><br>
                        <label>
                            <input type="checkbox" name="hobby" value="travel">換書
                        </label><br>
                        <label>
                            <input type="checkbox" name="hobby" value="travel">簽書會
                        </label><br>
                        <label>
                            <input type="checkbox" name="hobby" value="travel">精選咖啡廳
                        </label><br>
                    </div>
                </ul>
            </nav>
            <c:forEach var='act' items='${allacts}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">        
                <h2>${act.act_Name}</h2>
                <h5>${act.act_Theme}</h5>
                <h5>${act.act_Date}</h5>
                <img src="${pageContext.request.contextPath}/image/${act.act_Image}" style="width:300px; height: 400px;"/>
                <p>${act.act_Theme}</p>
                <p>${act.act_Intro}</p>
                    <br>
<!--                 <h2>咖啡廳推薦</h2> -->
<!--                 <h5>Title description, Dec 7, 2020</h5> -->
<!--                 <img src="Images/Coffee shopppp.jpeg" width="300px" height="400px"> -->
<!--                 <p>Some text..</p> -->
<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                     exercitation ullamco.</p> -->
<!--                 <br> -->
                
            </div>
<!--             <div class="col-sm-3"> -->
<!--                 <h2>野餐讀書會</h2> -->
<!--                 <h5>Title description, Dec 7, 2020</h5> -->
<!--                 <img src="Images//picnic.jpg" width="300px" height="400px"> -->
<!--                 <p>Some text..</p> -->
<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                     exercitation ullamco.</p> -->
<!--                 <br> -->
<!--                 <h2>公益捐書會</h2> -->
<!--                 <h5>Title description, Sep 2, 2017</h5> -->
<!--                 <img src="Images/Charity.jpeg" width="300px" height="400px"> -->
<!--                 <p>Some text..</p> -->
<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                     exercitation ullamco.</p> -->
<!--             </div> -->
<!--             <div class="col-sm-3"> -->
<!--                 <h2>青年講座</h2> -->
<!--                 <h5>Title description, Dec 7, 2020</h5> -->
<!--                 <img src="Images/125466.jpg" width="300px" height="400px"> -->
<!--                 <p>Some text..</p> -->
<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                     exercitation ullamco.</p> -->
<!--                 <br> -->
<!--                 <h2>好書交換</h2> -->
<!--                 <h5>Title description, Sep 2, 2017</h5> -->
<!--                 <img src="Images/Desert Librarian.jpg" width="300px" height="400px"> -->
<!--                 <p>Some text..</p> -->
<!--                 <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do -->
<!--                     eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud -->
<!--                     exercitation ullamco.</p> -->
<!--             </div> -->
            </c:forEach>
            <button><a href='showCreateForm' >新增活動</a></button>
        </div>
    </div>

    <div class="jumbotron text-center" style="margin-bottom:0">
        <p>Footer</p>
        <h3>Some Links</h3>
                <p>Lorem ipsum dolor sit ame.</p>
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
                <hr class="d-sm-none">
    </div>

</body>


</html>