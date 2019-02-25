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
	<c:if test="${findId != null}">
		회원님의 ID는 <b>${findId.id}</b> 입니다.
	</c:if>
	
	<c:if test="${findId == null}">
		회원님의 ID가 없습니다.
	</c:if>
</body>
</html>