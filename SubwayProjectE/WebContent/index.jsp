<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>프로젝트</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css?" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">


    <link rel="styleSheet" href="css/index.css?ver=6">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d3388f02e51515555b536b06632da82&libraries=services"></script>
    <title>지하철역 주변 버스정류장</title>


    <style>

        .box{
  border: 1px solid #000;
  min-height : 300px;
  width : 300px; 
}
.list ul{
  padding:0;
  margin : 0px;
}
.list li{
  border : 1px solid #eee;
  height : 30px;
  list-style : none;
  padding : 3px 5px;
  cursor:pointer;
}
.list li:hover{
  background-color:#ddd;
}
.list li.selected{
  background-color:#bd5d38;
  color : #eee;
}
.head{ 
  background-color:#555; color:#eee}
.row div{
  width:30%;
  float:left;
  text-align:center;
}
.row:after{
  content : '';
  clear:both;
  display:block;
}
#nnnn {
   width:298px;
   margin-left:0px;
}
#select_num {
   height:35px;
}
#pan {
   height:35px;
}

</style>


</head>

<body id="page-top">

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">
            <span class="d-block d-lg-none">BITCAMP</span>
            <span class="d-none d-lg-block">
                <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="img/BIT.jpg" alt="">
            </span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#experience">Bus Stop Search</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#education">Subway Time Table</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#skills">Skills</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#interests">Interests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#awards">Awards</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid p-0">

        <section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
            <div class="my-auto">
                <h1 class="mb-0">BIT
                    <span class="text-primary">CAMP</span>
                </h1>
                <div class="subheading mb-5">3th FLOOR ,23, Baekbeom-ro, Mapo-gu, Seoul, Republic of Korea · (02) 707-1480 ·
                    <a href="mailto:name@email.com">BITCAMP@gmail.com</a>
                </div>
                <p class="lead mb-5">비트캠프 신촌센터 5조입니다.</p>
                <div class="social-icons">
                    <a href="#">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a href="#">
                        <i class="fab fa-github"></i>
                    </a>
                    <a href="#">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                </div>
            </div>
        </section>

        <hr class="m-0">

        <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="experience">
            <div class="my-auto">
                <h2 class="mb-5">지하철역 주변 버스정류장 검색</h2>

                <input type="hidden" id="subX" />
                <input type="hidden" id="subY" />

                <div class="resume-item d-flex flex-column flex-md-row mb-5">
                    <div class="resume-content mr-auto">


                        <select id="select_num">

                            <option value="1">1호선</option>
                            <option value="2">2호선</option>
                            <option value="3">3호선</option>
                            <option value="4">4호선</option>
                            <option value="5">5호선</option>
                            <option value="6">6호선</option>
                            <option value="7">7호선</option>
                            <option value="8">8호선</option>
                            <option value="9">9호선</option>
                            <option value="K">경의중앙선</option>
                            <option value="B">분당선</option>
                            <option value="A">공항철도</option>
                        </select>

                        <input type="text" id="searchBar" placeholder="ex)서울" />
                        <input id="pan" type="button" value="내 위치" onclick="panTo()" />
                        <input type="hidden" id="out" />
                        <br>
                        <br>
                        <div id="mapDiv"></div>
                        <table id="mapTable" style="visibility: hidden;">
                            <tr>
                                <td>호선</td>
                                <td>역이름</td>
                                <td>정류장ID</td>
                                <td>정류장명</td>
                            </tr>
                            <tbody id="mapBody"></tbody>
                        </table>
                    </div>
                    <div class="resume-date text-md-right">
                        <span class="text-primary">2018-10-05 FRIDAY</span>
                    </div>

                </div>
            </div>

        </section>



        <hr class="m-0">

        <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="education">
            <div class="my-auto">


                <h2 class="mb-5">지하철 운행 시간표</h2>

                <div class="resume-item d-flex flex-column flex-md-row mb-5">
                    <div class="resume-content mr-auto">
                        <div>
                            <select id="lineNumber">
                                <option value="0">노선을 선택하세요.</option>
                                <option value="1">1호선</option>
                                <option value="2">2호선</option>
                                <option value="3">3호선</option>
                                <option value="4">4호선</option>
                                <option value="5">5호선</option>
                                <option value="6">6호선</option>
                                <option value="7">7호선</option>
                                <option value="8">8호선</option>
                                <option value="9">9호선</option>
                                <option value="I">인천1호선</option>
                                <option value="K">경의중앙선</option>
                                <option value="B">분당선</option>
                                <option value="A">공항철도</option>
                                <option value="G">경춘선</option>
                                <option value="SU">수인선</option>
                            </select>
                            <input type="radio" name="direction" value="1" checked="checked" /><label>상행</label>
                            <input type="radio" name="direction" value="2" /><label>하행</label>
                        </div>
                        <div class="box list">
                            <ul id="line">
                                <li>지하철 노선을 선택하세요.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="row head" id="nnnn">
                                <div>도착시간</div>
                                <div>출발시간</div>
                                <div>종착역</div>
                            </div>
                            <div id="train">

                                <span>지하철역을 선택하세요.</span>

                            </div>
                        </div>


                    </div>
                    <div class="resume-date text-md-right">
                        <span class="text-primary">2018-10-05 FRIDAY</span>
                    </div>
                </div>

            </div>
        </section>




        <hr class="m-0">

        <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="skills">
            <div class="my-auto">
                <h2 class="mb-5">Skills</h2>

                <div class="subheading mb-3">Programming Languages &amp; Tools</div>
                <ul class="list-inline dev-icons">
                    <li class="list-inline-item">
                        <i class="fab fa-html5"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-css3-alt"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-js-square"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-angular"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-react"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-node-js"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-sass"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-less"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-wordpress"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-gulp"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-grunt"></i>
                    </li>
                    <li class="list-inline-item">
                        <i class="fab fa-npm"></i>
                    </li>
                </ul>

                <div class="subheading mb-3">Workflow</div>
                <ul class="fa-ul mb-0">
                    <li>
                        <i class="fa-li fa fa-check"></i>
                        Mobile-First, Responsive Design</li>
                    <li>
                        <i class="fa-li fa fa-check"></i>
                        Cross Browser Testing &amp; Debugging</li>
                    <li>
                        <i class="fa-li fa fa-check"></i>
                        Cross Functional Teams</li>
                    <li>
                        <i class="fa-li fa fa-check"></i>
                        Agile Development &amp; Scrum</li>
                </ul>
            </div>
        </section>






        <hr class="m-0">

        <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="interests">
            <div class="my-auto">
                <h2 class="mb-5">Interests</h2>
                <p>Apart from being a web developer, I enjoy most of my time being outdoors. In the winter, I am an avid skier and novice ice climber. During the warmer months here in Colorado, I enjoy mountain biking, free climbing, and kayaking.</p>
                <p class="mb-0">When forced indoors, I follow a number of sci-fi and fantasy genre movies and television shows, I am an aspiring chef, and I spend a large amount of my free time exploring the latest technology advancements in the front-end web development world.</p>
            </div>
        </section>






        <hr class="m-0">

        <section class="resume-section p-3 p-lg-5 d-flex flex-column" id="awards">
            <div class="my-auto">
                <h2 class="mb-5">Awards &amp; Certifications</h2>
                <ul class="fa-ul mb-0">
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        Google Analytics Certified Developer</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        Mobile Web Specialist - Google Certification</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        1<sup>st</sup>
                        Place - University of Colorado Boulder - Emerging Tech Competition 2009</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        1<sup>st</sup>
                        Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        2<sup>nd</sup>
                        Place - University of Colorado Boulder - Emerging Tech Competition 2008</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        1<sup>st</sup>
                        Place - James Buchanan High School - Hackathon 2006</li>
                    <li>
                        <i class="fa-li fa fa-trophy text-warning"></i>
                        3<sup>rd</sup>
                        Place - James Buchanan High School - Hackathon 2005</li>
                </ul>
            </div>
        </section>



    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/resume.min.js"></script>




</body>

<script>
    var geocoder;
    var callback;
    var xy;
    var cd;
    
    $('#searchBar').keydown(function(key) {
        if (key.keyCode == 13) {
            $('#mapBody').html("");
            var positions = []; //검색할때마다 버스정류장 마커 배열 초기화
            setTimeout(function() {
                $.ajax({ //검색클릭시 테이블표시
                    url: 'http://openAPI.seoul.go.kr:8088/56454c787965686433377449447069/xml/SearchBusSTNByIDService/1/99/' + cd,
                    success: function(data) {
                        $(data).find('row').each(function(i, value) {
                            var STATION_NM = $(this).find('STATION_NM').text(); //지하철역 이름
                            var LINE_NUM = $(this).find('LINE_NUM').text(); //지하철 호선
                            var STNNM = $(this).find('STNNM').text(); //버스정류장 이름
                            var STATIONID = $(this).find('STATIONID').text(); //버스정류장 번호
                            var TMX = $(this).find('TMX').text(); //버스정류장 tmx좌표
                            var TMY = $(this).find('TMY').text(); //버스정류장 tmy좌표
                            if (STATION_NM == $('#searchBar').val()) {
                                geocoder = new daum.maps.services.Geocoder(), wtmX = TMX, wtmY = TMY;
                                callback = function(result, status) { //변환된 좌표
                                    if (status === daum.maps.services.Status.OK) {
                                        //주변정류장 마커를 표시할 위치와 title 객체 배열 
                                        var position = {
                                            title: STNNM, // 버스정류장 마커 이름
                                            latlng: new daum.maps.LatLng(result[0].y, result[0].x) // 주변정류장마커를 표시할 위치
                                        };
                                        positions.push(position);
                                    }
                                    //주변정류장 마커 이미지의 이미지 주소
                                    var imageSrc = "images/bus-stop.png";
                                    for (var i = 0; i < positions.length; i++) {
                                        //주변정류장 마커 이미지의 크기
                                        var imageSize = new daum.maps.Size(24, 24);
                                        //주변정류장 마커 이미지를 생성 
                                        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
                                        //주변정류장 마커를 생성합니다
                                        var busMarker = new daum.maps.Marker({
                                            map: map, // 마커를 표시할 지도
                                            position: positions[i].latlng, // 마커를 표시할 위치
                                            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
                                            image: markerImage // 마커 이미지 
                                        });
                                    }
                                }
                                // WTM 좌표를 WGS84 좌표계의 좌표로 변환
                                geocoder.transCoord(wtmX, wtmY, callback, {
                                    input_coord: daum.maps.services.Coords.WTM, //WTM
                                    output_coord: daum.maps.services.Coords.WGS84 //WGS84
                                });
                                $('#mapTable').css("visibility", "visible"); //hidden해둔 table을 visible로 변경
                                $('#mapBody').append( //table body부분에 차례대로 append
                                    "<tr><td>" + LINE_NUM + "</td><td>" +
                                    STATION_NM + "</td><td>" +
                                    STATIONID + "</td><td>" +
                                    STNNM + "</td></tr>");
                            }
                        });
                    }
                });
            }, 50);
            if (!$('#searchBar').val() == "") {
                setTimeout(function() { // 딜레이를 줘서 다른 fuction이 끝나면 실행
                    $.ajax({ //검색클릭시 지도표시
                        type: 'post',
                        url: 'map.jsp',
                        dataType: 'text',
                        success: function(data) {
                            $('#mapDiv').html(data); //map.jsp있는 글을 text로 가져오면 그것을 mapDiv에 뿌려줌
                        }
                    });
                }, 30);
            }
        }
        $.getJSON('subway_location.json', function(data) { //검색클릭시 지도이동
            $(data.DATA).each(function(i, value) {
                if (value.station_nm == $('#searchBar').val()) {
                    if (value.line_num == $('#select_num').val()) {
                        $('#subX').val(value.xpoint_wgs);
                        $('#subY').val(value.ypoint_wgs);
                        cd = value.station_cd;
                    }
                }
            });
        });
    });

    $(function() {
        $("#searchBar").autocomplete({
            source: function(request, response) {
                $.ajax({
                    url: 'subway_location.json',
                    dataType: 'json',
                    data: {
                        value: request.term
                    },
                    success: function(json) {
                        response($.map(json.DATA, function(data) {
                            if (data.station_nm.indexOf($("#searchBar").val()) >= 0) {
                                return {
                                    label: data.line_num + '호선 ' + data.station_nm + '역',
                                    value: data.station_nm
                                }
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function(event, ui) {
                $("#searchBar").val(ui.item.value);
                return false;
            },
            focus: function(event, ui) {
                $("#searchBar").val(ui.item.value);
                return false;
            }
        });
    });
</script>

<script>
    var url_stn = "http://openapi.seoul.go.kr:8088/56454c787965686433377449447069/json/SearchSTNBySubwayLineService/1/665/";
    var url_train = "http://openapi.seoul.go.kr:8088/56454c787965686433377449447069/json/SearchArrivalInfoByIDService/1/5/";
    var KEY_STN = "SearchSTNBySubwayLineService";
    var KEY_TRAIN = "SearchArrivalInfoByIDService";
    var selected_cd = null;
    var direction = 1;
    window.onload = function() {
        document.querySelector('#lineNumber').onchange = function() {
            ajax(url_stn + this.value, function(data) {
                document.querySelectorAll('input[name="direction"]').forEach(function(el) {

                    el.onclick = function(evt) {
                        direction = evt.target.value;
                        if (selected_cd) {
                            showDetail();
                        }
                    }
                });
                console.log(data);
                data = JSON.parse(data);
                console.log(data);
                if (data[KEY_STN]) {
                    var ul = document.querySelector('#line');
                    ul.innerHTML = "";
                    var list = document.querySelector('#train');
                    list.innerHTML = "<div>지하철역을 선택하세요.</div>";
                    var row = data[KEY_STN].row;

                    row.forEach(function(el, idx) {
                        var item = document.createElement('li');
                        item.textContent = el.STATION_NM;
                        item.code = el.STATION_CD;
                        item.onclick = setSelected;
                        ul.appendChild(item);
                    });
                } else {
                    showError(data.RESULT.CODE, data.RESULT.MESSAGE)
                }
            });
        }

    };

    function setSelected() {
        console.log(this.parentNode.childNodes);
        this.parentNode.childNodes.forEach(function(el, idx) {
            el.className = "";
        });
        this.className = "selected";
        selected_cd = this.code;
        showDetail();
    }

    function ajax(url, cb) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            console.log(xhr.readyState);
            if (xhr.readyState == 4) {
                cb(xhr.responseText);
            }
        }
        xhr.open('GET', url, true);
        xhr.send();
    }

    function showDetail() {
        if (!selected_cd) return;
        ajax(url_train + selected_cd + "/" + direction + "/1", function(data) {
            console.log(data);
            data = JSON.parse(data);
            console.log(data);
            if (data[KEY_TRAIN]) {
                var list = document.querySelector('#train');
                list.innerHTML = "";
                var row = data[KEY_TRAIN].row;

                row.forEach(function(el, idx) {
                    var item = document.createElement('div');
                    item.className = "row"
                    var arrival = document.createElement('div');
                    var depature = document.createElement('div');
                    var dest = document.createElement('div');
                    arrival.textContent = el.ARRIVETIME;
                    depature.textContent = el.LEFTTIME;
                    dest.textContent = el.SUBWAYNAME;

                    item.appendChild(arrival);
                    item.appendChild(depature);
                    item.appendChild(dest);
                    list.appendChild(item);
                });
            } else {
                showError(data.RESULT.CODE, data.RESULT.MESSAGE)
            }

        });
    }

    function showError(code, msg) {
        alert(code + ":" + msg);
    }
</script>

</html>