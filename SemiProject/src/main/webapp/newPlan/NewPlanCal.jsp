<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>GOING</title>
    <script type="text/javascript">

      /* 팝업 띄우기 위한 script (날짜 선택 팝업!) */
      function showPopup(hasFilter) {
        const popup = document.querySelector('#popup');
        if (hasFilter) {
          popup.classList.add('has-filter');
        } else {
          popup.classList.remove('has-filter');
        }
        popup.classList.remove('hide');
      }

      function closePopup() {
        const popup = document.querySelector('#popup');
        popup.classList.add('hide');
      }

      /* 팝업 띄우기 위한 script (여행 계획 입력하는 팝업!) */
      function showPopup2(hasFilter) {
        const popup = document.querySelector('#popup2');
        if (hasFilter) {
          popup.classList.add('has-filter');
        } else {
          popup.classList.remove('has-filter');
        }
        popup.classList.remove('hide');
      }

      function closePopup2() {
        const popup = document.querySelector('#popup2');
        popup.classList.add('hide');
      }

      /* 2팝업 띄우기 위한 script (여행 계획 입력하는 팝업!) */

      function showPopup3(hasFilter) {
        const popup = document.querySelector('#popup3');
        if (hasFilter) {
          popup.classList.add('has-filter');
        } else {
          popup.classList.remove('has-filter');
        }
        popup.classList.remove('hide');
      }

      function closePopup3() {
        const popup = document.querySelector('#popup3');
        popup.classList.add('hide');
      }

      /* 맵 관련 */
      var map;
      var marker_s, marekr_e;

      //경로그림정보
      var drawInfoArr = [];

      function initTmap() {
        // 1. 지도 띄우기
        map = new Tmapv2.Map("map_div", {
          center: new Tmapv2.LatLng(37.56701114710962, 126.9973611831669),
          width: "100%",
          height: "400px",
          zoom: 15,
          zoomControl: true,
          scrollwheel: true
        });

        // 시작, 도착 심볼찍기
        // 시작
        marker_s = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.568085523663385, 126.98605733268329),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        // 도착
        marker_e = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.56445848334345, 127.00973587385866),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.56626352138058, 126.98735015742581),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.56568310756034, 127.00221495976581),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.570369, 126.992153),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.56335290252303, 127.00352387777271),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_4.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.570721714117965, 127.00186090818215),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_5.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        marker = new Tmapv2.Marker({
          position: new Tmapv2.LatLng(37.56515390827723, 126.99066536776698),
          icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_6.png",
          iconSize: new Tmapv2.Size(24, 38),
          map: map
        });

        var headers = {};
        headers["appKey"] = "l7xx27cfab8a671c49dea1ee85d2351dfef7";

        $.ajax({
          type: "POST",
          headers: headers,
          url: "https://apis.openapi.sk.com/tmap/routes/routeOptimization30?version=1&format=json",//
          async: false,
          contentType: "application/json",
          data: JSON.stringify({
            "reqCoordType": "WGS84GEO",
            "resCoordType": "EPSG3857",
            "startName": "출발",
            "startX": "126.98605733268329",
            "startY": "37.568085523663385",
            "startTime": "201711121314",
            "endName": "도착",
            "endX": "127.00973587385866",
            "endY": "37.56445848334345",
            "searchOption": "0",
            "viaPoints": [
              {
                "viaPointId": "test01",
                "viaPointName": "test01",
                "viaX": "126.98735015742581",
                "viaY": "37.56626352138058",
              },
              {
                "viaPointId": "test02",
                "viaPointName": "test02",
                "viaX": "127.00221495976581",
                "viaY": "37.56568310756034",
              },
              {
                "viaPointId": "test03",
                "viaPointName": "test03",
                "viaX": "126.992153",
                "viaY": "37.570369",
              },
              {
                "viaPointId": "test04",
                "viaPointName": "test04",
                "viaX": "127.00352387777271",
                "viaY": "37.56335290252303",
              },
              {
                "viaPointId": "test05",
                "viaPointName": "test05",
                "viaX": "127.00186090818215",
                "viaY": "37.570721714117965",
              },
              {
                "viaPointId": "test06",
                "viaPointName": "test06",
                "viaX": "126.99066536776698",
                "viaY": "37.56515390827723",
              }
            ]
          }),
          success: function (response) {
            var resultData = response.properties;
            var resultFeatures = response.features;

            // 결과 출력
            var tDistance = "총 거리 : " + resultData.totalDistance + "km,  ";
            var tTime = "총 시간 : " + resultData.totalTime + "분,  ";
            var tFare = "총 요금 : " + resultData.totalFare + "원";

            $("#result").text(tDistance + tTime + tFare);

            for (var i in resultFeatures) {
              var geometry = resultFeatures[i].geometry;
              var properties = resultFeatures[i].properties;
              var polyline_;

              drawInfoArr = [];

              if (geometry.type == "LineString") {
                for (var j in geometry.coordinates) {
                  // 경로들의 결과값(구간)들을 포인트 객체로 변환
                  var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
                  // 포인트 객체를 받아 좌표값으로 변환
                  var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
                  // 포인트객체의 정보로 좌표값 변환 객체로 저장
                  var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);

                  drawInfoArr.push(convertChange);
                }
                polyline_ = new Tmapv2.Polyline({
                  path: drawInfoArr,
                  strokeColor: "#FF0000",
                  strokeWeight: 6,
                  map: map
                });
              }
            }
          },
          error: function (request, status, error) {
            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
          }
        });
      }


    </script>
</head>
<%
    String root = request.getContextPath();
%>
<body onload="initTmap();">
<!-- sub -->
<div id="sub_image" class="margin_wrap">
    <div id="sub_text">
        <p>New Plan</p>
    </div>
</div>
<!-- sub -->

<!-- 제목, 일정 입력폼 -->
<div class="container">
    <!-- 상단 타이틀 -->
    <div class="cal_container">
        <p id="cal_title">여행일정을 계획해보세요!</p>
        <form action="newPlan/NewPlanCalinsert.jsp" method="post" class="form-inline" name="planForm">

            <div class="cal_title_text">
                <div class="cal_date_open_title">
                    <p>여행 제목을 입력해주세요!</p>
                </div>
                <div class="cal_date_open_title">
                    <input type="text" name="plantitle" class="content_title"
                           placeholder="여행 계획 제목을 입력해주세요."
                           onkeyup="eventKeyup(this.value)">
                </div>
            </div>

            <div class="cal_date_open">
                <div class="cal_date_open_title">
                    <p>여행 일정을 선택해주세요!</p>
                </div>
                <div class="cal_date_open_title">
                    <button type="button" class="btn_data_open_pop" id="modal_btn" onclick="showPopup(false)"
                            name="planStartDay">
                        YYYY/MM/DD~YYYY/MM/DD

                    </button>
                </div>
            </div>

            <div id="popup" class="hide">
                <div class="content">
                    <p class="cal_popup_1_title">여행일자 선택</p>
                    <div class="cal_popup_1">
                        <iframe src="feat_calendar/calendar.html" style="width:1200px; height:400px; border:none;"></iframe>
                    </div>
                    <input type="hidden" id="hd_title" name="planStartDay">
                    <input type="hidden" id="hd_day" name="planEndDay">

                    <div class="cal_popup_1">
                        <button type="button" id="btn_submit_1" onclick="closePopup()">확인</button>
                        <button onclick="closePopup()" type="button" class="btn_close_1">닫기</button>
                    </div>
                </div>
            </div>
            <div class="cal_open_text">
                <p>해당 여행 계획을 공개하시겠습니까?</p>
                <span>만약 공개를 선택하시면 All Plan에 올라가며 모든 사람들이 확인할 수 있습니다.</span>
            </div>
            <div class="cal_open_check" name="openPlan">
                <input type="radio" checked="checked" name="openPlan" value="true" checked="checked"><label>공개</label>
                <input type="radio" name="openPlan" value="false"><label>비공개</label>
            </div>

        </form>
        <div class="newplan_step_1">
            <div id="map_div"></div>
            <table class="newplan_info">
                <tr>
                    <th>No</th>
                    <th>일자</th>
                    <th>상세 계획 짜기</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td id="daysCall_1">날짜</td><!--onclick="showPopup2(false)"  -->
                    <td>
                        <button type="button" class="btn_travel_1" onclick="showPopup2(false)">계획짜기</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td id="daysCall_2">날짜</td><!--onclick="showPopup2(false)"  -->
                    <td>
                        <button type="button" class="btn_travel_1" onclick="showPopup3(false)">계획짜기</button>
                    </td>
                </tr>


            </table>
        </div>

        <form action="newPlan/NewPlanMapinsert.jsp" method="post" class="form-inline" name="planForm1">

            <!-- 팝업 1번 -->
            <div id="popup2" class="hide">
                <div class="content" id="plan_detail_popup">
                    <div class="cal_popup_1_big_text">
                        <p class="cal_popup_1_title">상세 계획 짜기</p>
                    </div>
                    <div class="cal_popup_1_big_text">
                        <button onclick="closePopup2()" type="button" class="btn_close_2">닫기</button>
                    </div>

                    <!-- 경유 자동차 지도 넣어봄 - 희수 (갑자기 안나옴 ㅠㅠ)-->
                    <div id="map_wrap" class="map_wrap">
                        <div id="map_div"></div>
                    </div>


                    <div class="cal_popup_1">
                        <table class="planinfo">
                            <tr class="v_contents">
                                <th>시간</th>
                                <th>여행지</th>
                                <th>비고</th>
                            </tr>

                            <tr name="add_plan">
                                <input type="hidden" id="hd_title" name="plantitle">
                                <input type="hidden" id="hd_day" name="planDate">

                                <td><input type="text" name="planTime" class="plan_time" value="원하는 시간을 입력해주세요."></td>
                                <td><input type="text" name="mapPlan" class="plan_map" value="원하는 장소를 입력해주세요"></td>
                                <td>
                                    <input type="text" name="contentPlan" class="plan_content" value="해당 일정에 대한 내용을 입력해주세요.">
                                </td>
                            </tr><!-- 변경점 존재 -->

                            <tr name="add_plan">
                                <input type="hidden" id="hd_title" name="plantitle">
                                <input type="hidden" id="hd_day" name="planDate">

                                <td><input type="text" name="planTime" class="plan_time" value="원하는 시간을 입력해주세요."></td>
                                <td><input type="text" name="mapPlan" class="plan_map" value="원하는 장소를 입력해주세요"></td>
                                <td>
                                    <input type="text" name="contentPlan" class="plan_content" value="해당 일정에 대한 내용을 입력해주세요.">
                                </td>
                            </tr><!-- 변경점 존재 -->
                            <!-- <tr>
                                <td colspan='3'>
                                    <button name="add_btn" class="plan_add">추가하기</button>
                                </td>
                            </tr> -->
                        </table>
                    </div>
                    <div class="cal_popup_1">
                        <button type="submit" class="btn_submit_2">확인</button>
                        <button type="button" onclick="closePopup2()" class="btn_close_2">닫기</button>
                    </div>
                </div>
            </div>
        </form>


        <!-- 공개여부 -->

        <!-- 확인 버튼 -->
        <div class="btn_newplan_1">
            <button type="submit" class="btn_finish_1"
                    onclick="location.href='index.jsp?main=newPlan/NewPlanCal.jsp'">계획짜기 완료
            </button>
        </div>
    </div>
</div>
<script type="text/javascript">

  function eventKeyup(str) {
    $("#hd_title").val(str);
  }

  $("#btn_submit_1").click(function () {
    var StartDay = localStorage.getItem('startDay');
    var planEnd = localStorage.getItem('endDay');

    var tDate = new Date(StartDay);
    var endDate = new Date(planEnd);

    var mon1 = tDate.getMonth() + 1;
    var day1 = tDate.getDate();
    var days1 = mon1 + "월" + day1 + "일";

    $("#daysCall_1").html(days1);
    $("input[name='planday']").attr("value", days1)

    tDate.setDate(tDate.getDate() + 1);
    var mon2 = tDate.getMonth() + 1;
    var day2 = tDate.getDate();
    var days2 = mon2 + "월" + day2 + "일";

    $("#daysCall_2").html(days2);
    $("input[name='planday2']").attr("value", days2)

    var emon = endDate.getMonth() + 1;
    var eday = endDate.getDate();

    var enday = emon + "월" + eday + "일";
    $("#modal_btn").html(days1 + "~" + enday);

    $("input[name=planStartDay]").attr("value", days1);
    $("input[name=planEndDay]").attr("value", enday);

  });

</script>
</body>
</html>