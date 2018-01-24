<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
iframe {
		  width        	: 0px;    	/* 너비는 변경될수 있습니다. */
		  height  		: 0px;    	/* 줄바꿈을 하지 않습니다. */
		  border     	: 0px;   	/* 내용이 길면 감춤니다 */	
}
</style>

<script type="text/javascript">

function chk(){
	var chk = document.form.chek.checked;
	var chk1 = document.form.chek1.checked;
	
	if(!chk){
		alert("해당 동의서를 체크해주십시오.");
		return false;
	}else if(!chk1){
		alert("해당 동의서를 체크해주십시오.");
		return false;
	}else{
		document.form.submit();
	}
}

</script>
</head>

<body>
<form name ="form" action = "${pageContext.request.contextPath }/twins/jmJoinController">
	<textarea cols= "100" rows ="19">
개인정보 개인정보 수집 및 이용 동의

Twins.com는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.

1. 수집목적
- 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록 
- 회원제 서비스 제공, 공지사항 전달 
- 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용 
- 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 
- 프라이버시 보호 측면의 서비스 환경 구축 

2. 수집항목
(필수) 아이디, 비밀번호, 이름, 연락처(이메일) 

3. 보유기간
수집된 정보는 회원탈퇴 후 지체없이 파기됩니다.
서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. 
더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다. 
	</textarea> <input type="checkbox" name="chek">
	<br>
	<br>
	<br>
	<textarea rows="19" cols="100">
제 1 장 회원의 가입 및 관리


제 1 조 (회원가입절차)
① 
서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한 경우 본 약관에 동의한 것으로 간주합니다.

② 
회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이 동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지 “확인” 단추를 누르는 방법으로 합니다.



제 2 조 (회원 ID 등의 관리책임)
① 
회원은 서비스 이용을 위한 회원 ID, 비밀번호의 관리에 대한 책임, 본인 ID의 제3자에 의한 부정사용 등 회원의 고의?과실로 인해 발생하는 모든 불이익에 대한 책임을 부담합니다.

② 
회원은 회원 ID, 비밀번호 및 추가정보 등을 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 본인의 비밀번호를 수정하는 등의 조치를 취하여야 하며 즉시 이를 회사에 통보하여 회사의 안내를 따라야 합니다.



제 3 조 (개인정보의 수집 등)

회사는 서비스를 제공하기 위하여 관련 법령의 규정에 따라 회원으로부터 필요한 개인정보를 수집합니다.




제 2 장 서비스의 이용


제 4 조 (서비스 이용)
① 
서비스 이용은 회사의 서비스 사용승낙 직후부터 가능합니다.

② 
서비스 이용시간은 회사의 업무상 또는 기술상 불가능한 경우를 제외하고는 연중무휴 1일 24시간(00:00-24:00)으로 함을 원칙으로 합니다. 다만, 서비스설비의 정기점검 등의 사유로 회사가 서비스를 특정범위로 분할하여 별도로 날짜와 시간을 정할 수 있습니다.



제 5 조 (권리의 귀속 및 저작물의 이용)
① 
회원이 서비스 내에 게시한 게시물 등(이하 "게시물 등"이라 합니다)의 저작권은 해당 게시물의 저작자에게 귀속됩니다.

② 
회사는 제2항 이외의 방법으로 회원의 게시물 등을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 회원의 동의를 얻습니다.



제 6 조 (회원의 의무)

① 
회원은 아래 각 호의 1에 해당하는 행위를 하여서는 아니 됩니다.

1. 회원가입신청 또는 변경 시 허위내용을 등록하는 행위

2. 회사의 서비스에 게시된 정보를 변경하거나 서비스를 이용하여 얻은 정보를 회사의 사전 승낙 없이 영리 또는 비영리의 목적으로 복제, 출판, 방송 등에 사용하거나 제3자에게 제공하는 행위

3. 회사가 제공하는 서비스를 이용하여 제3자에게 본인을 홍보할 기회를 제공 하거나 제3자의 홍보를 대행하는 등의 방법으로 금전을 수수하거나 서비스를 이용할 권리를 양도하고 이를 대가로 금전을 수수하는 행위

4. 회사 기타 제3자에 대한 허위의 사실을 게재하거나 지적재산권을 침해하는 등 회사나 제3자의 권리를 침해하는 행위

5. 다른 회원의 ID 및 비밀번호를 도용하여 부당하게 서비스를 이용하는 행위

6. 정보통신망법 등 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)를 전송하거나 게시하는 행위

7. 청소년보호법에서 규정하는 청소년유해매체물을 게시하는 행위

8. 공공질서 또는 미풍양속에 위배되는 내용의 정보, 문장, 도형, 음성 등을 유포하는 행위

	</textarea>	<input type="checkbox" name="chek1">
	<br>
	<input type="button" onclick="chk();" value="동의완료">
</form>
</body>

</html>