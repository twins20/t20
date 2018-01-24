<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Upload Test Page</title>
</head>
<body>
	<h2>
		Upload Test Page <br>
		(업로드에 성공하였습니다. 다시 업로드 하려면 버튼을 누르세요.)
	</h2>
	
	<form id="form1" action="${pageContext.request.contextPath}/uploadForm" method="get">
		<input type="submit" value="다시업로드">
	</form>

</body>
</html>
