<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' />

<!-- CK EDITOR的東東 -->
<script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
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
.bd-placeholder-img {
	font-size: 1. 125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.tb1 {
	border: 1px solid background-color:pink
}



</style>

<title>新增活動資料</title>
</head>

<body>

	<!-- header -->
	<header class="container blog-header py-3" id="bookWebheader"></header>
	<!-- header -->

	<!-- body -->
	<div class="container">

		<br>


		<p>&nbsp;</p>
		<hr>
		<div class="center">
			<H1>新增活動資料</H1>
			<form:form method="POST" modelAttribute="actbean"
				enctype="multipart/form-data">
				<hr>
				<br>

				<fieldset>
					<!-- 					<legend>活動創建表單</legend> -->

					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label >活動名稱:</label>
								<form:input path="act_Name" class="form-control" placeholder="必填" />
							</div>
							<div class="form-group col-md-6">
								<label >活動主題:</label>
								<form:select path="act_Theme" class="form-control">
                                <form:option value="NONE" label="請選擇" />
                                <form:option value="書展" label="書展"/>
                                <form:option value="讀書會" label="讀書會"/>
                                <form:option value="簽書會" label="簽書會"/>
                                <form:option value="講座/論壇" label="講座/論壇"/>
                                <form:option value="公益活動"  label="公益活動"/>
                                <form:option value="好書交換" label="好書交換"/>
                                <form:option value="新書/好書討論會" label="新書/好書討論會"/>
                                </form:select>					
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label >活動嘉賓:</label>
								<form:input path="act_Guest" class="form-control" placeholder="" />
							</div>
							<div class="form-group col-md-6 custom-file">
								<label >活動圖片:</label> 
								<input name="file" type="file" class="form-control" />
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label >活動人數:</label>
								<form:input path="act_Pax" class="form-control" placeholder="" />
							</div>
							<div class="form-group col-md-6">
								<label >活動場所:</label>							
								<form:select path="act_Place" class="form-control">
                                <form:option value="NONE" label="請選擇" />
                                <form:option value="現場" label="現場"/>
                                <form:option value="線上" label="線上"/>
                                </form:select>								
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label>活動日期:</label>
								<form:input type="date" class="form-control" path="act_Date" />
							</div>

							<div class="form-group col-md-6">
								<label >活動時間:</label>
								<form:input type="time" class="form-control" path="act_Time" />
							</div>
						</div>

						<div class="form-row">
						<div class="form-group col-md-6">
							<label>活動地點:</label>
							<form:select path="act_Loc" id="縣市1" class="form-control"></form:select>
							</div>
							<div class="form-group col-md-6">
							<label>&nbsp</label>
							<form:select id="鄉鎮市區1" path="act_Loc" class="form-control"></form:select>
							</div>
						    </div>
							<div class="form-group">
							<form:input type="text" path="act_Loc" class="form-control" placeholder="請輸入其餘地址"></form:input>
							</div>					
                        
                        <div class="form-row">
                        <div class="form-group input_fields_wrap">
						    <label >活動標籤:</label>
						    <form:checkboxes items="${TagList}" path="act_Tag" class="form-control"/>
						    </div>
						    </div>						    
						    						    
						    
						  <div class="form-row">
						  <div class="form-group col-md-6">
						    <label >活動摘要:</label>
<!-- 						  CK EDITOR的東東 -->
						    <form:textarea  path="act_Rule" rows = "20" cols = "30" class="form-control" />
						  </div>
						  
						  <div class="form-group  col-md-6">
						    <label >活動簡介:</label>
<!-- 						  CK EDITOR的東東 -->
						  <form:textarea id="editor1" path="act_Intro" rows = "20" cols = "30" />
						  </div>
						  </div>
<!-- 						  <button class="add_field_button btn btn-primary">添加標籤</button> -->
						  
						  
						<hr>
						<button type="submit" class="btn btn-primary">提交</button>
						<button type="reset" class="btn btn-primary">還原</button>
					</form>
			  </fieldset>
			  
			</form:form>


				<br>
				<br>
				<a href='${pageContext.request.contextPath}/showActs'>回到活動管理</a>

		</div>

		<!-- body -->

		<!-- footer -->
		<footer class="container py-5" id="bookWebFooter"></footer>
		<!-- footer -->
		



		<script type="text/javascript">
				$(function() {
				$("#myfile").change(function() {
					var readFile = new FileReader();
					var mfile = $("#myfile")[0].files[0];  //注意這裡必須時$("#myfile")[0]，document.getElementById('file')等價與$("#myfile")[0]
					readFile.readAsDataURL(mfile);
					$("#picpath").val("abc");
					readFile.onload = function() {
						var img = $("#show");
						img.attr("src", this.result);
					}

				});

			})
		</script>
    
		<script type="text/javascript">
			window.onload = function() {
				//當頁面載完之後，用AddressSeleclList.Initialize()，
				//傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
				AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
				//        //後面四個參數分別是兩個下拉選單的預設文字跟值
				//       AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City', '0', 'Please Select Area', '0');
			}
			function show() {
				//取出指定縣市及鄉鎮市區的下拉選單的值
				alert(AddressSeleclList.ReturnSelectAddress('縣市1', '鄉鎮市區1'));
			}
		</script>		
		<script type="text/javascript">
			var app = window.AddressSeleclList = {
				AdrressArray : [
						[ '台北市', '100中正區', '103大同區', '104中山區', '105松山區',
								'106大安區', '108萬華區', '110信義區', '111士林區',
								'112北投區', '114內湖區', '115南港區', '116文山區' ],
						[ '新北市', '207萬里區', '208金山區', '220板橋區', '221汐止區',
								'222深坑區', '223石碇區', '224瑞芳區', '226平溪區',
								'227雙溪區', '228貢寮區', '231新店區', '232坪林區',
								'233烏來區', '234永和區', '235中和區', '236土城區',
								'237三峽區', '238樹林區', '239鶯歌區', '241三重區',
								'242新莊區', '243泰山區', '244林口區', '247蘆洲區',
								'248五股區', '248新莊區', '249八里區', '251淡水區',
								'252三芝區', '253石門區' ],
						[ '台中市', '400中區', '401東區', '402南區', '403西區', '404北區',
								'406北屯區', '407西屯區', '408南屯區', '411太平區',
								'412大里區', '413霧峰區', '414烏日區', '420豐原區',
								'421后里區', '422石岡區', '423東勢區', '424和平區',
								'426新社區', '427潭子區', '428大雅區', '429神岡區',
								'432大肚區', '433沙鹿區', '434龍井區', '435梧棲區',
								'436清水區', '437大甲區', '438外埔區', '439大安區' ],
						[ '台東縣', '950台東市', '951綠島鄉', '952蘭嶼鄉', '953延平鄉',
								'954卑南鄉', '955鹿野鄉', '956關山鎮', '957海端鄉',
								'958池上鄉', '959東河鄉', '961成功鎮', '962長濱鄉',
								'963太麻里鄉', '964金峰鄉', '965大武鄉', '966達仁鄉' ],
						[ '台南市', '700中西區', '701東區', '702南區', '704北區', '708安平區',
								'709安南區', '710永康區', '711歸仁區', '712新化區',
								'713左鎮區', '714玉井區', '715楠西區', '716南化區',
								'717仁德區', '718關廟區', '719龍崎區', '720官田區',
								'721麻豆區', '722佳里區', '723西港區', '724七股區',
								'725將軍區', '726學甲區', '727北門區', '730新營區',
								'731後壁區', '732白河區', '733東山區', '734六甲區',
								'735下營區', '736柳營區', '737鹽水區', '741善化區',
								'742大內區', '743山上區', '744新市區', '745安定區' ],
						[ '宜蘭縣', '260宜蘭市', '261頭城鎮', '262礁溪鄉', '263壯圍鄉',
								'264員山鄉', '265羅東鎮', '266三星鄉', '267大同鄉',
								'268五結鄉', '269冬山鄉', '270蘇澳鎮', '272南澳鄉' ],
						[ '花蓮縣', '970花蓮市', '971新城鄉', '972秀林鄉', '973吉安鄉',
								'974壽豐鄉', '975鳳林鎮', '976光復鄉', '977豐濱鄉',
								'978瑞穗鄉', '979萬榮鄉', '981玉里鎮', '982卓溪鄉',
								'983富里鄉' ],
						[ '金門縣', '890金沙鎮', '891金湖鎮', '892金寧鄉', '893金城鎮',
								'894烈嶼鄉', '896烏坵鄉' ],
						[ '南投縣', '540南投市', '541中寮鄉', '542草屯鎮', '544國姓鄉',
								'545埔里鎮', '546仁愛鄉', '551名間鄉', '552集集鎮',
								'553水里鄉', '555魚池鄉', '556信義鄉', '557竹山鎮',
								'558鹿谷鄉' ],
						[ '屏東縣', '900屏東市', '901三地門', '902霧台鄉', '903瑪家鄉',
								'904九如鄉', '905里港鄉', '906高樹鄉', '907鹽埔鄉',
								'908長治鄉', '909麟洛鄉', '911竹田鄉', '912內埔鄉',
								'913萬丹鄉', '920潮州鎮', '921泰武鄉', '922來義鄉',
								'923萬巒鄉', '924崁頂鄉', '925新埤鄉', '926南州鄉',
								'927林邊鄉', '928東港鎮', '929琉球鄉', '931佳冬鄉',
								'932新園鄉', '940枋寮鄉', '941枋山鄉', '942春日鄉',
								'943獅子鄉', '944車城鄉', '945牡丹鄉', '946恆春鎮',
								'947滿州鄉' ],
						[ '苗栗縣', '350竹南鎮', '351頭份市', '352三灣鄉', '353南庄鄉',
								'354獅潭鄉', '356後龍鎮', '357通霄鎮', '358苑裡鎮',
								'360苗栗市', '361造橋鄉', '362頭屋鄉', '363公館鄉',
								'364大湖鄉', '365泰安鄉', '366銅鑼鄉', '367三義鄉',
								'368西湖鄉', '369卓蘭鎮' ],
						[ '桃園市', '320中壢區', '324平鎮區', '325龍潭區', '326楊梅區',
								'327新屋區', '328觀音區', '330桃園區', '333龜山區',
								'334八德區', '335大溪區', '336復興區', '337大園區',
								'338蘆竹區' ],
						[ '高雄市', '800新興區', '801前金區', '802苓雅區', '803鹽埕區',
								'804鼓山區', '805旗津區', '806前鎮區', '807三民區',
								'811楠梓區', '812小港區', '813左營區', '814仁武區',
								'815大社區', '820岡山區', '821路竹區', '822阿蓮區',
								'823田寮區', '824燕巢區', '825橋頭區', '826梓官區',
								'827彌陀區', '828永安區', '829湖內區', '830鳳山市',
								'831大寮區', '832林園區', '833鳥松區', '840大樹區',
								'842旗山區', '843美濃區', '844六龜區', '845內門區',
								'846杉林區', '847甲仙區', '848桃源區', '849那瑪夏',
								'851茂林區', '852茄萣區' ],
						[ '基隆市', '200仁愛區', '201信義區', '202中正區', '203中山區',
								'204安樂區', '205暖暖區', '206七堵區' ],
						[ '連江縣', '209南竿區', '210北竿區', '211莒光區', '212東引區' ],
						[ '雲林縣', '630斗南鎮', '631大埤鄉', '632虎尾鎮', '633土庫鎮',
								'634褒忠鄉', '635東勢鄉', '636台西鄉', '637崙背鄉',
								'638麥寮鄉', '640斗六市', '643林內鄉', '646古坑鄉',
								'647莿桐鄉', '648西螺鎮', '649二崙鄉', '651北港鎮',
								'652水林鄉', '653口湖鄉', '654四湖鄉', '655元長鄉' ],
						[ '新竹市', '300北區', '300東區', '300香山區' ],
						[ '新竹縣', '302竹北市', '303湖口鄉', '304新豐鄉', '305新埔鎮',
								'306關西鎮', '307芎林鄉', '308寶山鄉', '310竹東鎮',
								'311五峰鄉', '312橫山鄉', '313尖石鄉', '314北埔鄉',
								'315峨眉鄉' ],
						[ '嘉義市', '600西區', '600東區' ],
						[ '嘉義縣', '602番路鄉', '603梅山鄉', '604竹崎鄉', '605阿里山',
								'606中埔鄉', '607大埔鄉', '608水上鄉', '611鹿草鄉',
								'612太保市', '613朴子市', '614東石鄉', '615六腳鄉',
								'616新港鄉', '621民雄鄉', '622大林鎮', '623溪口鄉',
								'624義竹鄉', '625布袋鎮' ],
						[ '彰化縣', '500彰化市', '502芬園鄉', '503花壇鄉', '504秀水鄉',
								'505鹿港鎮', '506福興鄉', '507線西鄉', '508和美鎮',
								'509伸港鄉', '510員林鎮', '511社頭鄉', '512永靖鄉',
								'513埔心鄉', '514溪湖鎮', '515大村鄉', '516埔鹽鄉',
								'520田中鎮', '521北斗鎮', '522田尾鄉', '523埤頭鄉',
								'524溪州鄉', '525竹塘鄉', '526二林鎮', '527大城鄉',
								'528芳苑鄉', '530二水鄉' ],
						[ '澎湖縣', '880馬公市', '881西嶼鄉', '882望安鄉', '883七美鄉',
								'884白沙鄉', '885湖西鄉' ]

				],

				defaultOptionCityText : '請選擇縣市',
				defaultOptionCityValue : '',
				defaultOptionAreaText : '請選擇鄉鎮',
				defaultOptionAreaValue : '',

				Initialize : function(city, area, defaultCityText,
						defaultCityValue, defaultAreaText, defaultAreaValue) {

					var cityText = defaultCityText ? defaultCityText
							: this.defaultOptionCityText;
					var cityValue = defaultAreaValue ? defaultAreaValue
							: this.defaultOptionCityValue;
					var areaText = defaultAreaText ? defaultAreaText
							: this.defaultOptionAreaText;
					var areaValue = defaultAreaValue ? defaultAreaValue
							: this.defaultOptionAreaValue;

					var citySelect = document.getElementById(city);
					var areaSelect = document.getElementById(area);

					citySelect.options[0] = new Option(cityText, cityValue);
					areaSelect.options[0] = new Option(areaText, areaValue);
					for (var i = 0; i < this.AdrressArray.length; i++) {
						citySelect.options[i + 1] = new Option(
								this.AdrressArray[i][0],
								this.AdrressArray[i][0]);
					}
					citySelect.addEventListener ? citySelect.addEventListener(
							'change', function(e) {
								app.AppendArea(e, areaSelect, areaText,
										areaValue)
							}, false) : citySelect.attachEvent('onchange',
							function(e) {
								app.AppendArea(e, areaSelect, areaText,
										areaValue)
							});
				},

				AppendArea : function(e, AreaSelect, areaText, areaValue) {
					var target = e.target ? e.target : e.srcElement;
					if (target.selectedIndex == 0) {
						AreaSelect.options.length = 0;
						AreaSelect.options[0] = new Option(areaText, areaValue);
						return;
					}
					AreaSelect.options.length = this.AdrressArray[target.selectedIndex - 1].length - 1;
					for (var i = 1; i < this.AdrressArray[target.selectedIndex - 1].length; i++) {
						AreaSelect.options[i - 1] = new Option(
								this.AdrressArray[target.selectedIndex - 1][i],
								this.AdrressArray[target.selectedIndex - 1][i]);
					}
				},

				ReturnSelectAddress : function(city, area) {
					var city = document.getElementById(city);
					var area = document.getElementById(area);
					return city.value + area.value;
				}
			};
		</script>
		
<!-- 		CK EDITOR的東東 -->

<script>
    ClassicEditor
        .create( document.querySelector( '#editor1' ) )
        .catch( error => {
            console.error( error );
        } );
</script>




		
</body>
</html>