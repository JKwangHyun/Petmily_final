<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheck</title>
</head>
<body>
	<c:if test="${idcheck.id != null}">
		<script>setTimeout("location.href=''",1000*0.1);</script>
	</c:if>
	<c:if test="${idcheck.id == null}">
		<span style="color:red;font-weight:normal;font-size:12px;">
			아이디 또는 비밀번호를 다시 확인하세요.
		</span>
	</c:if>
</body>
</html>