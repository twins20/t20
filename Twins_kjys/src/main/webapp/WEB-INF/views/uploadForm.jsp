<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Upload Test Page</title>

	<style>
		iframe {
			width : 0px;
			height : 0px;
			border : 0px;
		}
	</style>
	
</head>
<body>

	<h2>
		Upload Test Page (업로드 하세요.)
	</h2>
	
	<form id="form1" action="uploadForm" method="post" enctype="multipart/form-data"
			target = "zeroFrame">
		<input type="file" name="file">
		<input type="submit">
	</form>
	
	<iframe name="zeroFrame"></iframe>
	
	<script>
		function addFilePath(msg) {
			alert(msg);
			document.getElementById("form1").reset();
		}
	</script>

</body>
</html>
