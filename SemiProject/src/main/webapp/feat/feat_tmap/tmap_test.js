var map, marker;
var markerArr = [], labelArr = [], resultArr = [], newPositions= [];

var marker_s, marekr_e, waypoint;
//경로그림정보
var drawInfoArr = [];
var resultInfoArr = [];

$(document).ready(function (){
  initTmap();
});
function setVariables(){
  zoom = 16;  // zoom level입니다.  0~19 레벨을 서비스 하고 있습니다.
}
function initTmap() {
  // 1. 지도 띄우기
  map = new Tmapv2.Map("map_div", {
    center: new Tmapv2.LatLng(37.499501997717935, 127.02895464575377),
    width: "700px",
    height: "700px",
    zoom: 15,
    zoomControl: false,
    scrollwheel: true
  });
  // map.setOptions({ zoomControl: false }); // 줌컨트롤 표출 비활성화

  // 2. POI 검색, 엔터키 이벤트
  $("#searchKeyword").keyup(
      function (e) {
        if (e.key=== 'Enter') {	// 엔터키 이벤트
          var searchKeyword = $('#searchKeyword').val(); // 검색 키워드
          $.ajax({
            method: "GET", // 요청 방식
            url: "https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result", // url 주소
            async: false, // 동기설정
            data: { // 요청 데이터 정보
              "appKey": "l7xx7c3ca901339f42d2b89b39b64ca31cea", // 발급받은 Appkey
              "searchKeyword": searchKeyword, // 검색 키워드
              "resCoordType": "EPSG3857", // 요청 좌표계
              "reqCoordType": "WGS84GEO", // 응답 좌표계
              "count": 10 // 가져올 갯수
            },
            success: function (response) {
              var resultpoisData = response.searchPoiInfo.pois.poi;

              // 2.1 기존 마커, 팝업(라벨) 제거
              if (markerArr.length > 0) {
                for (var i in markerArr) {
                  markerArr[i].setMap(null);
                }
                markerArr = [];
              }

              if (labelArr.length > 0) {
                for (var i in labelArr) {
                  labelArr[i].setMap(null);
                }
                labelArr = [];
              }

              var innerHtml = ""; // Search Reulsts 결과값 노출 위한 변수
              //맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
              var positionBounds = new Tmapv2.LatLngBounds();

              // 2.2 POI 마커 표시
              for (var k in resultpoisData) {
                // POI 마커 정보 저장
                var noorLat = Number(resultpoisData[k].noorLat);
                var noorLon = Number(resultpoisData[k].noorLon);
                var name = resultpoisData[k].name;

                // POI 정보의 ID
                var id = resultpoisData[k].id;

                // 좌표 객체 생성
                var pointCng = new Tmapv2.Point(noorLon, noorLat);

                // EPSG3857좌표계를 WGS84GEO좌표계로 변환
                var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                    pointCng);

                var lat = projectionCng._lat;
                var lon = projectionCng._lng;

                // 좌표 설정
                var markerPosition = new Tmapv2.LatLng(
                    lat, lon);

                // Marker 설정
                marker = new Tmapv2.Marker(
                    {
                      position: markerPosition, // 마커가 표시될 좌표
                      //icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
                      icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_w_m_"
                          + k
                          + ".png", // 아이콘 등록
                      iconSize: new Tmapv2.Size(
                          24, 38), // 아이콘 크기 설정
                      title: name, // 마커 타이틀
                      label: name,
                      map: map // 마커가 등록될 지도 객체
                    });

                // 2.3 결과창에 나타날 검색 결과 html
                innerHtml += "<li><div><img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_"
                    + k
                    + ".png' style='vertical-align:middle;'/><div onclick='selectMarker("
                    + lat + "," + lon + ")'>"
                    + name
                    + "</div>  <button type='button' name='sendBtn' onClick='poiDetail("
                    + id
                    + ");'>선택</button></div></li>";

                // 마커들을 담을 배열에 마커 저장
                markerArr.push(marker);
                positionBounds.extend(markerPosition); // LatLngBounds의 객체 확장
              }

              $("#searchResult").html(innerHtml); //searchResult 결과값 노출
              map.panToBounds(positionBounds); // 확장된 bounds의 중심으로 이동시키기
              map.zoomOut();
            },
            error: function (request, status, error) {
              console.log("code:"
                  + request.status + "\n"
                  + "message:"
                  + request.responseText
                  + "\n" + "error:" + error);
            }
          });
        }
      });

}
// 3. 마커 삭제, 우클릭
// marker.addListener("contextmenu", function(evt) {
//   console.log('마커삭제');
// });

// 4.A 리스트 이름 클릭시 맵 이동
function selectMarker(lat, lon) {
  let newPosition = new Tmapv2.LatLng(lat, lon);
  map.setCenter(newPosition);
  map.setZoom(17);
}

// 4. POI 선택, 마커 선택, 정보 출력
function poiDetail(poiId) {
  console.log("poiId: " + poiId);

  $.ajax({
    method: "GET", // 요청 방식
    url: "https://apis.openapi.sk.com/tmap/pois/"
        + poiId // 상세보기를 누른 아이템의 POI ID
        + "?version=1&resCoordType=EPSG3857&format=json&callback=result&appKey="
        + "l7xx7c3ca901339f42d2b89b39b64ca31cea", // 발급받은 Appkey
    async: false, // 동기 설정
    success: function (response) {
      
      // 응답받은 POI 정보
      var detailInfo = response.poiDetailInfo;
      // detailInfo에서 받은 POI 개별 정보
      var name = detailInfo.name;
      var address = detailInfo.address;
      var noorLat = Number(detailInfo.frontLat);
      var noorLon = Number(detailInfo.frontLon);
      // 좌표 객체 생성
      var pointCng = new Tmapv2.Point(noorLon, noorLat);
      // 좌표계 변환
      var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
          pointCng);

      var lat = projectionCng._lat;
      var lon = projectionCng._lng;
      // 새 좌표 설정
      var newPosition = new Tmapv2.LatLng(lat, lon);
      newPositions.push(newPosition);
      // 새 Marker 설정
      marker = new Tmapv2.Marker({
        position: newPosition,  // 마커 좌표
        icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_g_m_v.png",  // 아이콘 등록
        iconSize: new Tmapv2.Size( 24, 38), // 아이콘 크기 설정
      title: name, // 마커 타이틀
      label: name,
      map: map // 마커가 등록될 지도 객체
      });
      resultArr.push(marker); // 결과 배열에 저장
      var innerHtml = "";
      innerHtml += "<li class='ui-state-default'><div onclick='selectMarker("
          + lat + "," + lon + ")'><span>" + name + "</span></div>" +
          "<button class ='btn_abort' onclick='$(this).parent().remove()'>취소</button></li>";
      //$("#selectResult").html(innerHtml);
      $("#selectResult").append(innerHtml);
      map.setCenter(newPosition);	//	맵 중심 이동
      // map.panTo(newPosition);	//	맵 중심 이동
      map.setZoom(19);    // 맵 최대로 확대
      // 선택 후, 기존 마커 제거
      if (markerArr.length > 0) {
        for (var i in markerArr) {
          markerArr[i].setMap(null);
        }
        markerArr = [];
      }
      // 선택 후, 기존 리스트 제거
      $("#searchResult").html("");
    },
    error: function (request, status, error) {
      console.log("code:" + request.status + "\n"
          + "message:" + request.responseText + "\n"
          + "error:" + error);
    }
  });
}

function drawData(data){
	// 지도위에 선은 다 지우기
	routeData = data;
	var resultStr = "";
	var distance = 0;
	var idx = 1;
	var newData = [];
	var equalData = [];
	var pointId1 = "-1234567";
	var ar_line = [];
	
	for (var i = 0; i < data.features.length; i++) {
		var feature = data.features[i];
		//배열에 경로 좌표 저잘
		if(feature.geometry.type == "LineString"){
			ar_line = [];
			for (var j = 0; j < feature.geometry.coordinates.length; j++) {
				var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1],feature.geometry.coordinates[j][0]);
				ar_line.push(startPt);
				pointArray.push(feature.geometry.coordinates[j]);
			}
			var polyline = new Tmapv2.Polyline({
		        path: ar_line,
		        strokeColor: "#ff0000", 
		        strokeWeight: 6,
		        map: map
		    });
			new_polyLine.push(polyline);
		}
		var pointId2 = feature.properties.viaPointId;
		if (pointId1 != pointId2) {
			equalData = [];
			equalData.push(feature);
			newData.push(equalData);
			pointId1 = pointId2;
		}
		else {
			equalData.push(feature);
		}
	}
	geoData = newData;
	var markerCnt = 1;
	for (var i = 0; i < newData.length; i++) {
		var mData = newData[i];
		var type = mData[0].geometry.type;
		var pointType = mData[0].properties.pointType;
		var pointTypeCheck = false; // 경유지 일때만 true
		if (mData[0].properties.pointType == "S") {
			var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
			var lon = mData[0].geometry.coordinates[0];
			var lat = mData[0].geometry.coordinates[1];
		}
		else if (mData[0].properties.pointType == "E") {
			var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
			var lon = mData[0].geometry.coordinates[0];
			var lat = mData[0].geometry.coordinates[1];
		}
		else {
			markerCnt=i;
			var lon = mData[0].geometry.coordinates[0];
			var lat = mData[0].geometry.coordinates[1];
		}	
	}
}

//5. 결과 json
function searchPath(){
  console.log("searchPath run!");
  // json param
  // $.getJSON('http://13.209.85.24/going/feat/feat_tmap/sample_path.json');
  // $.getJSON('http://localhost:63342/bit-semi/SemiProject/feat/feat_tmap/sample_path.json');

  // TODO javascript에서 json url로 받고 처리하기
  // let requestURL = 'http://localhost:63342/bit-semi/SemiProject/feat/feat_tmap/sample_path.json';
  // let request = new XMLHttpRequest();
  // request.open('get', requestURL);
  // request.responseType = 'json';
  // request.send();
  //
  // request.onload = function (){
  //   let response = request.response;
  //   let jsonData = response.responseJSON
  // let params = JSON.stringify(jsonData);
  //   console.log(params);
  // }

  let param = JSON.stringify(
      {
        "startName" : "출발지",
        "startX" : "127.02410199849781",
        "startY" : "37.50301794750057",
        "startTime" : "201708081103",
        "endName" : "도착지",
        "endX" : "127.01410199849781",
        "endY" : "37.52301794750057",
        "viaPoints" :
            [
              {
                "viaPointId" : "test01",
                "viaPointName" : "name01",
                "viaX" : "127.02921274180768" ,
                "viaY" : "37.49957399469941"
              },
              {
                "viaPointId" : "test02",
                "viaPointName" : "name02",
                "viaX" : "127.02921274180768" ,
                "viaY" : "37.49957399469941"
              },
              {
                "viaPointId" : "test03",
                "viaPointName" : "name03",
                "viaX" : "127.02790747862767" ,
                "viaY" : "37.49343579506673"
              },
              {
                "viaPointId" : "test04",
                "viaPointName" : "name04",
                "viaX" : "127.03690645140334" ,
                "viaY" : "37.50079621316615"
              }
            ],
        "reqCoordType" : "WGS84GEO",
        "resCoordType" : "EPSG3857",
        "searchOption": 0
      }
  );
  // console.log("params" + params);
  console.log("param" + param);
  // 5.1 경로탐색 API 사용요청
  var headers = {};
  headers["appKey"]="l7xx7c3ca901339f42d2b89b39b64ca31cea";
  headers["Content-Type"]="application/json";
  var searchOption =0;// 최적경로 옵션값
  $.ajax({
    method:"POST",
    url:"https://apis.openapi.sk.com/tmap/routes/routeSequential30?version=1&format=json",//
    headers : headers,
    async:false,
    data:param,
    success:function(response){

      let resultData = response.properties;
      let resultFeatures = response.features;

      // result 출력
      let tDistance = "총 거리 : " + resultData.totalDistance + "km,  ";
      let tTime = "총 시간 : " + resultData.totalTime + "분,  ";
      let tFare = "총 요금 : " + resultData.totalFare + "원";

      $("#result").text(tDistance+tTime+tFare);

//기존  라인 초기화

      if(resultInfoArr.length>0){
        for(var i in resultInfoArr){
          resultInfoArr[i].setMap(null);
        }
        resultInfoArr=[];
      }

      for(var i in resultFeatures) {
        var geometry = resultFeatures[i].geometry;
        var properties = resultFeatures[i].properties;
        var polyline_;

        drawInfoArr = [];

        if(geometry.type == "LineString") {
          for(var j in geometry.coordinates){
            // 경로들의 결과값(구간)들을 포인트 객체로 변환
            var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
            // 포인트 객체를 받아 좌표값으로 변환
            var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
            // 포인트객체의 정보로 좌표값 변환 객체로 저장
            var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);

            drawInfoArr.push(convertChange);
          }

          polyline_ = new Tmapv2.Polyline({
            path : drawInfoArr,
            strokeColor : "#FF0000",
            strokeWeight: 6,
            map : map
          });
          resultInfoArr.push(polyline_);

        }else{
          var markerImg = "";
          var size = "";			//아이콘 크기 설정합니다.

          if(properties.pointType == "S"){	//출발지 마커
            markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
            size = new Tmapv2.Size(24, 38);
          }else if(properties.pointType == "E"){	//도착지 마커
            markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
            size = new Tmapv2.Size(24, 38);
          }else{	//각 포인트 마커
            markerImg = "http://13.209.85.24/going/image/logo_new2.png";
            size = new Tmapv2.Size(24, 24);
          }

          // 경로들의 결과값들을 포인트 객체로 변환
          var latlon = new Tmapv2.Point(geometry.coordinates[0], geometry.coordinates[1]);
          // 포인트 객체를 받아 좌표값으로 다시 변환
          var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

          marker_p = new Tmapv2.Marker({
            position: new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng),
            icon : markerImg,
            iconSize : size,
            map:map
          });

          resultArr.push(marker_p);
        }
      }
      // TODO 5.3 경로탐색 결과 반경만큼 지도 레벨 조정
      // PTbounds 계산
      // PTbounds = new Tmapv2.LatLngBounds();
      // for (var i = 0; i < newPositions.length; i++) {
      //     PTbounds.extend(newPosition[i]);
      // }
      // map.fitBounds(PTbounds);
    },
    error:function(request,status,error){
      console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

// sortable.js
$("#searchResult").sortable({
  animation: 150,
  start: function (e, ui) {
    // drag start
  },
  stop: function (e, ui) {
    // drag stop
    reorder();
  },
});

function reorder() {
  $("#searchResult li").each(function (i, box) {
    $(box).attr("idx", i + 1);
  });
}