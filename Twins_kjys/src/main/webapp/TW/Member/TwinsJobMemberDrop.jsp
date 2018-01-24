<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h1>회원 탈퇴</h1>
<p> ${jmv.jmname}님의 회원탈퇴 처리를 하였습니다. 이용해 주셔서 감사합니다.</p>
<form name = "loginform" action="${pageContext.request.contextPath }/twins/jmJoinController">
	<input type = "submit" value="확인">
</form>
</body>
</html>