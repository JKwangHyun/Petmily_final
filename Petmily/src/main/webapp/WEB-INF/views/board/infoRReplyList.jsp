<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
</style>
<script>
</script>
<body>
	<c:forEach var="infoReply" items="${infoRReplyList}">
		<c:if test="${infoReply.INDENT>'1'}">
			<div style="position:relative; width:100%;height:20px;margin:15px 0; left:0;">
				<div style="position:relative;width:15%;float:left;">
					<div style="width:15%;position:relative;top:5px;display:block; border-radius:50%;border:2px solid #333; width:20px;height:20px;background-image:url('${infoReply.MYIMG}');background-size:cover;"></div>
				</div>
				<div style="position:relative;width:85%;">
					<div style="cursor:default;width:85%;position:relative;font-size:10px;color:#333;font-family:'Nanum Square';font-weight:bold;">${infoReply.ID} &nbsp;&nbsp;&nbsp;<font style="font-size:10px;">${infoReply.RDATE}</font></div>
					<div style="cursor:default;width:85%;position:relative;font-size:10px;color:gray;font-weight:bold;font-family:'Nanum Square';">${infoReply.CONTENT}</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</body>
</html>