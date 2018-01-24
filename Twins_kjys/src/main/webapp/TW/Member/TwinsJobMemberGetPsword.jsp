<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function  GetPs(){
	var form = document.form;
	
	if(form.jmid.value==""){
		alert("아이디를 입력하세요")
	}
	else if (form.jmemail.value==""){
		alert("이메일을 입력하세요")
	}
	else{
		form.submit();
	}
}
</script>
</head>
<body>
<br>
<h1>비밀번호 찾기</h1>
<form name = "form" action="${pageContext.request.contextPath }/twins/jmGetPswordController">
<table>
	<tr>
		<td>
			<input type="text" name="jmid"> 아이디</td>
	</tr>

	<tr>
		<td>
			<input type= "text" name = "jmemail"> 이메일</td>
	</tr>
	
	<tr>
		<td>
			<input type = "button" onclick="GetPs();" value="찾기"></td>
	</tr>
</table>
</form>
</body>
</html>