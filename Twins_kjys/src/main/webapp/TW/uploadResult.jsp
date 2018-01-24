<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Upload Result Page</title>
</head>
<body>
	<script>
	
		var result = '${savedName}';
		
		parent.addFilePath(result);
		
	</script>
</body>
</html>
