let map;
// 1. 지도 띄우기
map = new Tmapv2.Map("map_div", {
  center: new Tmapv2.LatLng(37.52084364186228, 127.058908811749),
  width: "100%",
  height: "400px"
});

function drawData(data) {
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
    if (feature.geometry.type == "LineString") {
      ar_line = [];
      for (var j = 0; j < feature.geometry.coordinates.length; j++) {
        var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1],
            feature.geometry.coordinates[j][0]);
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
    } else {
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
    } else if (mData[0].properties.pointType == "E") {
      var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
      var lon = mData[0].geometry.coordinates[0];
      var lat = mData[0].geometry.coordinates[1];
    } else {
      markerCnt = i;
      var lon = mData[0].geometry.coordinates[0];
      var lat = mData[0].geometry.coordinates[1];
    }
  }
}

// 2. 시작, 도착 심볼찍기

var markerList = [];
var pointArray = [];

// 시작
addMarker("llStart", 127.02810900563199, 37.519892712436906, 1);
// 도착
addMarker("llEnd", 127.11971717230388, 37.49288934463672, 2);

function addMarker(status, lon, lat, tag) {
  //출도착경유구분
  //이미지 파일 변경.
  var markerLayer;
  switch (status) {
    case "llStart":
      imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
      break;
    case "llPass":
      imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png';
      break;
    case "llEnd":
      imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
      break;
    default:
  }
  ;
  var marker = new Tmapv2.Marker({
    position: new Tmapv2.LatLng(lat, lon),
    icon: imgURL,
    map: map
  });
  // 마커 드래그 설정
  marker.tag = tag;
  marker.addListener("dragend", function (evt) {
    markerListenerEvent(evt);
  });
  marker.addListener("drag", function (evt) {
    markerObject = markerList[tag];
  });
  markerList[tag] = marker;
  return marker;
}

// 3. 경유지 심볼 찍기
addMarker("llPass", 127.07389565460413, 37.5591696189164, 3);
addMarker("llPass", 127.13346617572014, 37.52127761904626, 4);

// 4. 경로탐색 API 사용요청
var startX = 127.02810900563199;
var startY = 37.519892712436906;
var endX = 127.11971717230388;
var endY = 37.49288934463672;
var passList = "127.07389565460413,37.5591696189164_127.13346617572014,37.52127761904626";
var prtcl;
var headers = {};
headers["appKey"] = unq_tmak;
$.ajax({
  method: "POST",
  headers: headers,
  url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json",//
  async: false,
  data: {
    startX: startX,
    startY: startY,
    endX: endX,
    endY: endY,
    passList: passList,
    reqCoordType: "WGS84GEO",
    resCoordType: "WGS84GEO",
    angle: "172",
    searchOption: "0",
    trafficInfo: "Y"
  },
  success: function (response) {
    prtcl = response;
    // 5. 경로탐색 결과 Line 그리기
    var trafficColors = {
      extractStyles: true,
      /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
      trafficDefaultColor: "#636f63", //Default
      trafficType1Color: "#19b95f", //원할
      trafficType2Color: "#f15426", //지체
      trafficType3Color: "#ff970e"  //정체
    };
    var style_red = {
      fillColor: "#FF0000",
      fillOpacity: 0.2,
      strokeColor: "#FF0000",
      strokeWidth: 3,
      strokeDashstyle: "solid",
      pointRadius: 2,
      title: "this is a red line"
    };
    drawData(prtcl);

  }
});