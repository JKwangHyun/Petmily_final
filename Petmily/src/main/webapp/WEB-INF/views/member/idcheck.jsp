<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdCheck</title>
</head>
<body>
	<c:if test="${idcheck.id != null}">
		<i class="fas fa-times" style="color:#da532c;"></i>
	</c:if>
	
	<c:if test="${idcheck.id == null}">
		<i class="fas fa-check" style="color:#7CBB00;"></i>
	</c:if>
</body>
</html>