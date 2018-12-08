<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="map" style="width: 450px; height: 350px;"></div>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng($('#subX').val(), $('#subY').val()), // 지도의 중심좌표
            level: 4
            // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new daum.maps.Map(mapContainer, mapOption);

    //지하철역 마커가 표시될 위치
    var markerPosition = new daum.maps.LatLng($('#subX').val(), $('#subY').val());

    //지하철 마커 이미지의 이미지 주소
    var imageSrc = "images/train-station.png";

    //주변정류장 마커 이미지의 크기
    var imageSize = new daum.maps.Size(20, 20);

    //주변정류장 마커 이미지를 생성 
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

    //지하철역 마커를 생성
    var subMarker = new daum.maps.Marker({
        position: markerPosition,
        image: markerImage

    });

    subMarker.setMap(null); //지하철역 마커 초기화
    subMarker.setMap(map); //지하철역 마커가 지도 위에 표시되도록 설정

    var latitude;
    var longitude;

    $(function() {

        var output = document.getElementById("out");

        if (!navigator.geolocation) {
            output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
            return;
        }

        function success(position) {
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;

            output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' +
                longitude + '°</p>';

            var img = new Image();

        };

        function error() {
            output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
        };

        output.innerHTML = "<p>Locating…</p>";

        navigator.geolocation.getCurrentPosition(success, error);
    });


    var markerNow = new daum.maps.LatLng(latitude, longitude); // 현재 위치 마커가 표시될 좌표

    var imageSrc = "images/navigation.png";

    var imageSize = new daum.maps.Size(36, 36);

    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

    var nowMarker = new daum.maps.Marker({
        position: markerNow,
        image: markerImage,
        title: "현재위치"
    });

    nowMarker.setMap(null);
    nowMarker.setMap(map);

    function panTo() {
        // 현재위치찾기


        $(function() {

            var output = document.getElementById("out");

            if (!navigator.geolocation) {
                output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
                return;
            }

            function success(position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;

                output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' +
                    longitude + '°</p>';

                var img = new Image();

            };

            function error() {
                output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
            };

            output.innerHTML = "<p>Locating…</p>";

            navigator.geolocation.getCurrentPosition(success, error);
        });


        var markerNow = new daum.maps.LatLng(latitude, longitude); // 현재 위치 마커가 표시될 좌표

        var imageSrc = "images/navigation.png";

        var imageSize = new daum.maps.Size(36, 36);

        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

        var nowMarker = new daum.maps.Marker({
            position: markerNow,
            image: markerImage,
            title: "현재위치"
        });
        nowMarker.setMap(null);
        nowMarker.setMap(map);


        // 이동할 위도 경도 위치를 생성합니다 
        var moveLatLon = new daum.maps.LatLng(latitude, longitude);

        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map.panTo(moveLatLon);


        $.ajax({ //내위치 버튼 클릭시 내위치주변 정류장표시
            url: 'http://openapi.tago.go.kr/openapi/service/BusSttnInfoInqireService/getCrdntPrxmtSttnList?serviceKey=3Q82JFpBBus4IYKSkWcCC63QZIDxY6ywENI118wvmDlhASBpyXynQFlvagUqryoQlSjVinyRz6UopowJUrkorA%3D%3D&gpsLati=' + latitude + '&gpsLong=' + longitude,
            dataType: "xml", //전송받을 데이터의 타입
			type: 'GET',
            success: function(data) {
                var gpslati = $(this).find('gpslati').text(); //주변정류장 x좌표
                var gpslong = $(this).find('gpslong').text(); //주변정류장 y좌표
                var nodenm = $(this).find('nodenm').text(); //버스정류장 이름
            }
        });

    }

</script>
