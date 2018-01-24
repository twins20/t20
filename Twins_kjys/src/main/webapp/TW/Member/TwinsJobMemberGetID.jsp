<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function  GetID(){
	var form = document.getform;
	
	if(form.jmname.value==""){
		alert("이름을 입력하세요")
	}
	else if (form.jmemail.value==""){
		alert("이메일을 입력하세요")
	}
	else{
		form.submit();
	}
}

</script>
<body>
<br>
<h1>아이디 찾기</h1>
<form name = "getform" action="${pageContext.request.contextPath }/twins/jmGetIDController">
<table>
	<tr>
		<td>
			<input type = "text" name="jmname"> 이름
		</td>
	</tr>
	<tr>
		<td>
			<input type ="text" name="jmemail"> 이메일
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
	<tr>
		<td>
		</td>
	</tr>
</table>
			<input type ="button" onclick="GetID();" value="찾기">
</form>

</body>
</html>