<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function dropChk(){
		alert("탈퇴하시겠습니까?")
        document.dropform.submit();
	}
</script>

</head>
<body>
<br>
<!-- 이름만 나타내기...나중에....마지막에 뷰단들어갈때 작업하기... -->
<h1>${jmv.jmid } / ${jmv.jmidx } / ${jmv.jmname }님을 환영합니다.</h1>
${msg}
<br>
<br>
<form name ="dropform" action="${pageContext.request.contextPath}/twins/jmDropController">
			<input type ="hidden" name = "jmidx" value = "${jmv.jmidx}">
			<input type ="hidden" name = "jmid" value = "${jmv.jmid}">
			<input type ="hidden" name = "jmname" value = "${jmv.jmname}">
			<input type ="button"  onclick="dropChk();" value="회원탈퇴"> 
</form>
<br>
<form name = "mdform" action="${pageContext.request.contextPath}/twins/jmModifyController">
			<input type ="hidden" name = "jmidx" value = "${jmv.jmidx}">
			<input type ="submit" value = "내 정보 수정">
</form>
<br>
<form name = "comform" action="${pageContext.request.contextPath}/twins/jbMyCommentController">
	<input type ="hidden" name = "jmidx" value ="${jbcv.jmidx}">
	<input type = "submit" value = "내 댓글 보기"> ${jbcv.jmidx}
</form>
<br>
<form name = "outform" action="${pageContext.request.contextPath}/twins/jmLoginOutController">
			<input type ="submit" value="로그아웃">
</form>
<br>
<a href="${pageContext.request.contextPath}/twins/jbListController">/twins/jbListController로 가기</a><br>
<br>
<a href="${pageContext.request.contextPath}/twins/jbListController${jmv.sendLoginInfo()}">/twins/jbListController로 가기(로그인 정보 가지고)</a><br>
<br>

<script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uZzy9BdbsheNuCWoY395&submodules=geocoder"></script>

<br><br>
<div id="map" style="width:100%;height:400px;"> </div>

<script>
 
var mapOptions = {
   	      mapTypeControl: true,
   	      mapTypeControlOptions: {
   	          style: naver.maps.MapTypeControlStyle.BUTTON,
   	          position: naver.maps.Position.TOP_RIGHT
   	      },
   	      zoomControl: true,
   	      zoomControlOptions: {
   	          style: naver.maps.ZoomControlStyle.SMALL,
   	          position: naver.maps.Position.TOP_RIGHT
   	      },
   	      scaleControl: true,
   	      scaleControlOptions: {
   	          position: naver.maps.Position.RIGHT_CENTER
   	      },
   	      logoControl: true,
   	      logoControlOptions: {
   	          position: naver.maps.Position.TOP_LEFT
   	      },
   	      mapDataControl: true,
   	      mapDataControlOptions: {
   	          position: naver.maps.Position.BOTTOM_LEFT
   	      }
   	  };

	var map = new naver.maps.Map(document.getElementById('map'), mapOptions);	

//      var map = new naver.maps.Map('map');
      var myaddress = '완산구 서노송동 568-94';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
            // content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
             content: '<h4>&nbsp;[한국마이스터 정보 교육원]</h4><a href="http://www.myin.or.kr" target="_blank"><img src="/resources/img/myin_headLogo.gif"></a>'
          });
      });
    
</script>
    
</body>
</html>