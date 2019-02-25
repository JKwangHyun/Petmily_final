<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<input id="img"type="file" name="file" onclick="upload()" style="display:none;"> 
		<label id="myImage"for="img" style="position:relative;top:-3px;left:-3px;border-radius:50%;border:3px solid #333; width:130px;height:130px;margin:0 auto;display:block;background-image:url('${Login.myimage}');background-size:cover;"></label>
</body>
</html>