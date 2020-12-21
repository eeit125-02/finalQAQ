
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Fun Tribe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                        <label><form:checkbox path="act_Loc" value="KLU" />基隆市</label><br>
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
            <div class="col-sm-3">
                <h2>哈利波特讀書會</h2>
                <h5>Title description, Dec 7, 2020</h5>
                <img src="Images/Book Covers.jpg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
                    <br>
                <h2>咖啡廳推薦</h2>
                <h5>Title description, Dec 7, 2020</h5>
                <img src="Images/Coffee shopppp.jpeg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
                <br>
                
            </div>
            <div class="col-sm-3">
                <h2>野餐讀書會</h2>
                <h5>Title description, Dec 7, 2020</h5>
                <img src="Images//picnic.jpg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
                <br>
                <h2>公益捐書會</h2>
                <h5>Title description, Sep 2, 2017</h5>
                <img src="Images/Charity.jpeg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
            </div>
            <div class="col-sm-3">
                <h2>青年講座</h2>
                <h5>Title description, Dec 7, 2020</h5>
                <img src="Images/125466.jpg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
                <br>
                <h2>好書交換</h2>
                <h5>Title description, Sep 2, 2017</h5>
                <img src="Images/Desert Librarian.jpg" width="300px" height="400px">
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do
                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco.</p>
            </div>
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