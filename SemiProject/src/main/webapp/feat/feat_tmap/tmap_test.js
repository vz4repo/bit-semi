var map, marker;
var markerArr = [], labelArr = [];

function initTmap() {
  // 1. 지도 띄우기
  map = new Tmapv2.Map("map_div", {
    center: new Tmapv2.LatLng(37.499501997717935, 127.02895464575377),
    width: "70%",
    height: "700px",
    zoom: 15,
    zoomControl: false,
    scrollwheel: true
  });
  // map.setOptions({ zoomControl: false }); // 줌컨트롤 표출 비활성화

  // 2. POI 통합 검색 API 요청
  $("#searchKeyword").keyup(
      function (e) {
        if (e.key=== 'Enter') {	// 엔터키 이벤트
          var searchKeyword = $('#searchKeyword').val(); // 검색 키워드
          $.ajax({
            method: "GET", // 요청 방식
            url: "https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result", // url 주소
            async: false, // 동기설정
            data: { // 요청 데이터 정보
              "appKey": "l7xx27cfab8a671c49dea1ee85d2351dfef7", // 발급받은 Appkey
              "searchKeyword": searchKeyword, // 검색 키워드
              "resCoordType": "EPSG3857", // 요청 좌표계
              "reqCoordType": "WGS84GEO", // 응답 좌표계
              "count": 10 // 가져올 갯수
            },
            success: function (response) {
              var resultpoisData = response.searchPoiInfo.pois.poi;

              // 2. 기존 마커, 팝업(라벨) 제거
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

              // 3. POI 마커 표시
              for (var k in resultpoisData) {
                // POI 마커 정보 저장
                var noorLat = Number(resultpoisData[k].noorLat);
                var noorLon = Number(resultpoisData[k].noorLon);
                var name = resultpoisData[k].name;

                // POI 정보의 ID
                var id = resultpoisData[k].id;

                // 좌표 객체 생성
                var pointCng = new Tmapv2.Point(
                    noorLon, noorLat);

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
                      icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_"
                          + k
                          + ".png", // 아이콘 등록
                      iconSize: new Tmapv2.Size(
                          24, 38), // 아이콘 크기 설정
                      title: name, // 마커 타이틀
                      label: name,
                      map: map // 마커가 등록될 지도 객체
                    });

                // 결과창에 나타날 검색 결과 html
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

// 4.A 리스트 이름 클릭시 맵 이동
function selectMarker(lat, lon) {
  let newPosition = new Tmapv2.LatLng(lat, lon);
  map.setCenter(newPosition);
  map.setZoom(17);
}

// 4. POI 상세 정보 API
function poiDetail(poiId) {
  console.log("poiId: " + poiId);

  $.ajax({
    method: "GET", // 요청 방식
    url: "https://apis.openapi.sk.com/tmap/pois/"
        + poiId // 상세보기를 누른 아이템의 POI ID
        + "?version=1&resCoordType=EPSG3857&format=json&callback=result&appKey="
        + "l7xx27cfab8a671c49dea1ee85d2351dfef7", // 발급받은 Appkey
    async: false, // 동기 설정
    success: function (response) {
      console.log("response: " + response);

      // 응답받은 POI 정보
      var detailInfo = response.poiDetailInfo;
      console.log("detailInfo: " + detailInfo);
      var name = detailInfo.name;
      var address = detailInfo.address;

      var noorLat = Number(detailInfo.frontLat);
      var noorLon = Number(detailInfo.frontLon);

      var pointCng = new Tmapv2.Point(noorLon, noorLat);
      var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
          pointCng);

      var lat = projectionCng._lat;
      var lon = projectionCng._lng;

      var labelPosition = new Tmapv2.LatLng(lat, lon);
      var innerHtml = "";
      innerHtml += "<li class='ui-state-default'><div onclick='selectMarker("
          + lat + "," + lon + ")'><span>" + name + "</span><span>" + lat + ","
          + lon + "</span></div>" +
          "<button class ='btn_abort' onclick='$(this).parent().remove()'>취소</button></li>";
      //$("#selectResult").html(innerHtml);
      $("#selectResult").append(innerHtml);
      map.setCenter(labelPosition);	//	맵 중심 이동
      // map.panTo(labelPosition);	//	맵 중심 이동
      map.setZoom(19);
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
