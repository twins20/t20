<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
iframe {
		  width        	: 0px;     	/* 너비는 변경될수 있습니다. */
		  height  		: 0px;    	/* 줄바꿈을 하지 않습니다. */
		  border     	: 0px;    	/* 내용이 길면 감춤니다 */	
}
</style>

<script type="text/javascript">

function checkValue(){
	
	if(document.userInfo.jmname.value ==""){
        alert("이름을 입력하세요.");
    }else if(document.userInfo.jmid.value.length<5 ){
        alert("아이디는 5~20자 사이로 입력해주십시오.");
        return false;
    }
    else if(document.userInfo.DuplicationChk.value == "no"){
        alert("아이디 중복체크를 해주세요.");
    		document.from.action="${pageContext.request.contextPath }/twins/jmBlankPageController";
    		document.from.method="post";
    		document.from.target ="iframe";
    		document.from.submit();
    		return false;
    } 
    else if(document.userInfo.jmpsword.value.length<8){
        alert("영문과 숫자 조합으로 8~20자리까지 입력하세요");   
        return false;
    } else if(document.userInfo.jmpsword.value != userInfo.jmpswordcheck.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;    
    }
    else if(document.userInfo.jmaddr.value =="" ){
        alert("주소를 입력하세요.");   
    }  
    else if(document.userInfo.jmemail.value =="" ){
        alert("이메일을 입력하세요.");    
    }
    else {
	document.userInfo.action="${pageContext.request.contextPath }/twins/jmJoinActionController";
	document.userInfo.method="post";
	document.userInfo.submit();
    }   
}

	
function message(msg){
	if(document.userInfo.jmid.value ==""){
		alert("아이디를 입력하세요")
	}else if(msg !=0){
			alert("아이디를 사용할수없습니다.");
			document.userInfo.DuplicationChk = "no";		
	}else {
			alert("아이디를 사용할수있습니다.");
			document.userInfo.DuplicationChk.value = "yes";
		}	
}


function ConfirmID(){		
	document.from.action="${pageContext.request.contextPath }/twins/jmConfirmIDController?jmid="+userInfo.jmid.value;
	document.from.method="post";
	document.from.target ="iform";
	document.from.submit();
}

</script>
</head>

<body>
	<br>
	<h1>회원 가입</h1>
	
	<form id = "userInfo" name="userInfo">
	<table>
		<tr>
			<td>
				<input type="text" name="jmname"  > 이 &nbsp;&nbsp;&nbsp;&nbsp; 름</td></tr>
		<tr>
			<td>
				<input type="text" name="jmid" maxlength="20"> 아&nbsp; 이 디  &nbsp;  
				<input type="button"  value="중복확인" onclick="ConfirmID();">
				<input type="hidden" name="DuplicationChk"  value="no"></td></tr>
		<tr>
			<td>
				<input type="password" name="jmpsword" maxlength="20"> 비밀번호</td></tr>
		<tr>
			<td>
				<input type="password" name="jmpswordcheck" maxlength="20"> 비밀번호확인</td></tr>
		<tr>
			<td>
				<input type="text" name="jmaddr"> 주 &nbsp;&nbsp;&nbsp;&nbsp; 소</td></tr>
		<tr>
			<td>
				<input type="text" name="jmemail"> 이 &nbsp;메&nbsp;일</td></tr>
	</table>
		<br>
				<input type="button" onclick="checkValue()" value="가입">   &nbsp;  ${msg}
	</form>
		<br>
		
	<form name = from >
	</form>
	
	<iframe name="iform">
	</iframe>
	
	<iframe name = "iframe">
	</iframe>
	
</body>
</html>
