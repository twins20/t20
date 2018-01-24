<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<style>
   h1 {
     font-size: 20px;
   }
   .jb-center {
     text-align: center;
   }

td.col{width:100px; height:20px; text-align:center;}
td.col2{width:150px; height:20px;}
td.coltitle{width:550px; height:20px;}

a:hover {background-color :red}
a:hover {color :orange}
</style> 
</head>

<body>

jbcategory = ${pageMaker.scri.jbcategory}<br>

<h1>목록보기 화면입니다</h1>
<br>
${pageMaker.ui.jmidx} / ${pageMaker.ui.jmid} / ${pageMaker.ui.jmname}님 반갑습니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color=blue>게시판을 선택한 후 검색버튼을 누르세요.</font>  
<br>

<form name="form1" action = "${pageContext.request.contextPath}/twins/jbListController">

<input type="hidden" name='jmidx' id="jmidxInput" value='${ui.jmidx}'>
<input type="hidden" name='jmid' id="jmidInput" value='${ui.jmid}'>
<input type="hidden" name='jmname' id="jmnameInput" value='${ui.jmname}'> 

<select name='searchType'>
  <option value=''
  	<c:out value="${pageMaker.scri.searchType == null?'selected':''}"/>>
  	 -- 선택 -- </option>
  <option value='jbsubject'
  	<c:out value="${pageMaker.scri.searchType eq 'jbsubject'?'selected':''}"/>>
  	제목</option>
  <option value='jbwriter'	
  	<c:out value="${pageMaker.scri.searchType eq 'jbwriter'?'selected':''}"/>>
  	작성자</option>
  <option value='jbcontent'	
  	<c:out value="${pageMaker.scri.searchType eq 'jbcontent'?'selected':''}"/>>
  	글내용</option>
</select>

<input type="text" name='keyword' id="keywordInput" value='${pageMaker.scri.keyword}'>

<button id='searchBtn'>검색</button> &nbsp;&nbsp;&nbsp;


<input type = 'radio' name='jbcategory' value='' 
	<c:out value="${pageMaker.scri.jbcategory == '' ? 'checked' : '' }"/>
> 전체게시판 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='n'
	<c:out value="${pageMaker.scri.jbcategory == 'n' ? 'checked' : '' }"/>
> 공지사항 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='f'
	<c:out value="${pageMaker.scri.jbcategory == 'f' ? 'checked' : '' }"/>
> 자유게시판 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='c'
	<c:out value="${pageMaker.scri.jbcategory == 'c' ? 'checked' : '' }"/>
> 회사정보 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='r'
	<c:out value="${pageMaker.scri.jbcategory == 'r' ? 'checked' : '' }"/>
> 취업정보 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='d'
	<c:out value="${pageMaker.scri.jbcategory == 'd' ? 'checked' : '' }"/>
> 자료실   &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='m'
	<c:out value="${pageMaker.scri.jbcategory == 'm' ? 'checked' : '' }"/>
> 내가쓴글 보기   &nbsp;&nbsp;&nbsp;

</form>

<table border=1>

<tr>
  <td class=col style="background-color:#B2EBF4;">상태 바</td>
  <td colspan=5><font color="red">${m.msg}</font></td>
</tr>  

<tr>
  <td class=col style="background-color:#B2EBF4;">글번호</td>
  <td class=col2 style="background-color:#B2EBF4;">제목</td>
  <td class=col style="background-color:#B2EBF4;">작성자</td>
  <td class=col style="background-color:#B2EBF4;">작성일</td>
  <td class=col style="background-color:#B2EBF4;">수정일</td>
  <td class=col style="background-color:#B2EBF4;">조회수</td>
</tr>  

<c:if test="${list != null }">
  <c:forEach items="${list}" var="jbv"> 
  
    <tr>
      <td class=col style="background-color:white;">${jbv.jbidx}</td>
      <td class=coltitle style="background-color:white;">
      
        <c:forEach items="${list}" var="lr" end="${jbv.jbleftright}" varStatus="status">
      	  &nbsp;&nbsp;&nbsp;
        </c:forEach>☞
          <a title="내용보기" href="${pageContext.request.contextPath}/twins/jbContentController${pageMaker.jbidxJmidxTotalMakeSearch(pageMaker.scri.page, jbv.jbidx)}"> <!-- 동일 -->
                                              ${jbv.jbsubject}</a></td>
      <td class=col style="background-color:white;">${jbv.jbwriter}</td>
      <td class=col style="background-color:white;">${jbv.jbwritedate.substring(0,10)}</td>
      <td class=col style="background-color:white;">${jbv.jbmodifydate.substring(0,10)}</td>
      <td class=col style="background-color:white;">${jbv.jbreadnum}</td>
    </tr> 
    
  </c:forEach> 
</c:if>

<c:if test="${list == null }">

  <script type='text/javascript'>alert('데이터가 없습니다.\n\n처음부터 시작합니다.');	  
	window.document.location.href='${pageContext.request.contextPath}/twins/jbWriteController';</script>
	  
</c:if>     
    	
</table>


<div class="container">
 <div class="row">
   <div class="col-xs-12">
     <div class="jb-center">
       <ul class="pagination">
     
         <c:if test="${pageMaker.prev}">
           <li><a href="${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(pageMaker.startPage - 1)}">&laquo;</a> <!-- 동일 -->
           </li>
         </c:if>
         
         <c:forEach begin="${pageMaker.startPage}"
         	end="${pageMaker.endPage}" var="idx">
         
         		<li
         			<c:out value="${pageMaker.scri.page == idx?'class =active':''}"/>
         		>
         			<a href="${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(idx)}">${idx}</a> <!-- 동일 -->
         		</li>
         </c:forEach>
   
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         	
       	   <li><a href="${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(pageMaker.endPage + 1)}">&raquo;</a>   <!-- 동일 -->    	
           </li>
         </c:if>
          
        </ul>
      </div>
    </div>
  </div>
</div>

<p class="pg"> 																		<!-- 동일 -->
  <a href="${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxSend()}">전체목록보기</a> &nbsp;&nbsp;&nbsp;
  <a href="${pageContext.request.contextPath}/twins/jbWriteController${pageMaker.jmidxTotalMakeSearch(pageMaker.scri.page)}"> <!-- 동일 -->
      <img src="${pageContext.request.contextPath}/resources/img/btn_write.gif">
  </a>
</p>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=uZzy9BdbsheNuCWoY395&submodules=geocoder"></script>

<form name="mapform">
	주소(도로명 또는 지번 O; 건물명X) : <input type="text" name="address" style='width:300px'>
	<input type="button" name="search" value="지도검색" onclick="loadMap(document.mapform.address.value);">
	<br><br>
	<div id="map" style="width:100%;height:400px;"> </div>
</form>

<script>
    
    function loadMap(myaddress){
    	
    	
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
//      var myaddress = '완산구 서노송동 568-94';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
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
             content: '<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;좋은하루 되세요</h4><a href="http://www.myin.or.kr" target="_blank"><img src="/resources/img/cosmos.png"></a>'
          });
      });
	}
    
</script>

</body>
</html>

