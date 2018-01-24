<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
	
	function  Modify(){
		var form = document.mdform;
		
		if(form.jmaddr.value==""){
			alert("주소를 입력하세요");
		}
		else if (form.jmemail.value==""){
			alert("이메일을 입력하세요");
		}
		else{
			alert("정보가 수정되었습니다.");
			form.submit();
		}
	}
	
	function pschk(){
	
		var form = document.mdform;
		
		if(form.jmpsword.value == form.jmpswordcheck.value){
			document.form1.action="${pageContext.request.contextPath }/twins/jmChangePswordController?jmidx=${jmv.jmidx}";
			document.form1.submit();
		}
		else if(form.jmpsword.value != form.jmpswordcheck.value){
			alert("비밀번호가 일치하지않습니다.")
			return false;
		}
	}
	
	</script>
</head>

<body>
	<br>
	<h1>내 정보 수정</h1>
	
	<form name="mdform" action="${pageContext.request.contextPath }/twins/jmModifyActionController">
		<input type ="hidden" name = "jmidx" value="${jmidx }">
		<table>
			<tr>
				<td>이 &nbsp; &nbsp;&nbsp;&nbsp;름
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text"  name="jmname" value="${jmv.jmname}" disabled></td></tr>
			<tr>
				<td>아 &nbsp;이&nbsp;디
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" name="jmid" value="${jmv.jmid}" disabled></td></tr>
			<tr>
				<td>비밀번호
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "password" name="jmpsword" value ="${jmv.jmpsword}"></td></tr>
			<tr>
				<td>비밀번호 확인
					<input type="password" name="jmpswordcheck"></td>
				<td>&nbsp;
					<input type = "button"  value = "비밀번호수정" onclick="pschk();"></td></tr>
			<tr>
				<td>주 &nbsp;  &nbsp;&nbsp;&nbsp;소
					<input type = "text" name="jmaddr" value ="${jmv.jmaddr}"></td></tr>
			<tr>
				<td>이&nbsp;메&nbsp;&nbsp;일
					<input type = "text" name="jmemail" value ="${jmv.jmemail}"></td></tr>
			<tr>
				<td>
					</td></tr>
			<tr>
				<td>
					</td></tr>
			<tr>
				<td>
					</td></tr>
								
		</table>
		<input type="button" onclick="Modify();" value="확인"> ${msg}
	</form>
	
	<br>
	<a href="${pageContext.request.contextPath }/twins/jmMainController${jmv.sendLoginInfo()}">메인 화면으로 가기</a>
	
	<form name = "form1">
		<input type ="hidden" name = "jmidx" value="${jmv.jmidx }">
	</form>
	
</body>
</html>
