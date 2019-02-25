<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
</script>
<body>
   <c:forEach var="re" items="${RElist}">
      <c:if test="${re.INDENT>'1'}">
         <div style="position:relative;left:70px;">
            <div style="position:relative;border-radius:50%;border:2px solid #333; width:40px;height:40px;background-image:url('${re.MYIMAGE}');background-size:cover;"></div>
            <div style="position:relative;top:-50px;left:70px;width:200px;text-align:left;color:#333;font-weight:bold;">${re.ID}</div>
            <div style="position:relative;top:-40px;left:70px;width:300px;text-align:left;color:gray;font-weight:bold;">${re.CONTENT}</div>
            <div style="position:relative;top:-30px;left:70px;width:200px;text-align:left;">${re.RDATE}</div>
          </div>
      </c:if>
   </c:forEach>
</body>
</html>