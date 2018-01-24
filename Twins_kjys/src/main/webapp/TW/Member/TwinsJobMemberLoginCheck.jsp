<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function  Login(){
	var form = document.form;
	
	if(form.jmid.value==""){
		alert("아이디를 입력하세요")
	}
	else if (form.jmpsword.value==""){
		alert("비밀번호를 입력하세요")
	}
	else{
		form.submit();
	}
}

</script>
</head>

<body>

<br>
<h1>로그인 해주십시요.</h1>

<form name = "form" action="${pageContext.request.contextPath }/twins/jmLoginCheckController">
<table>
	<tr>
		<td>
			<input type ="text" name="jmid"> 아이디</td></tr>
	
	<tr>	
		<td>
			<input type ="password" name="jmpsword"> 패스워드</td></tr>
	<tr>
		<td>
 		</td></tr>
	
	<tr>
		<td>
 		</td></tr>
	
	<tr>
		<td>
 		</td></tr>
	
	<tr>
		<td>
			<input type = "button" onclick="Login();" value="로그인"><font color="red">  ${msg}</font></td></tr>
</table>
<br>
</form>

<form name ="form1" action="${pageContext.request.contextPath }/twins/jmIDController">
	<input type = "submit" value = "아이디찾기" >
</form>
<br>

<form name = "form2" action="${pageContext.request.contextPath }/twins/jmPswordController">
	<input type = "submit" value = "비밀번호찾기">
</form>
<br>

<form name = "form3" action="${pageContext.request.contextPath }/twins/jmJoinController">
	<input type = "submit" value = "회원가입">
</form>

</body>
</html>
