<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
	function mdelete(){
		location.href='mdelete';
	}
</script>
<body>
	<div id="delete_container" style="position:relative;width:500px;height:380px;float:left;background-color:#F8F8F8;border-radius:20px;">
		<div style="position:relative;top:50px;font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;text-align:center;">회원 탈퇴</div>
			<div style="position:relative;top:120px;font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;text-align:center;">
			Petmily에서 <font style="font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#da532c;">탈퇴</font>하시겠습니까?</div>
			<div style="position:relative;top:160px;">
				<button type="button" onclick="mdelete()" style="position:relative;left:150px;border:none;border-radius:10px; background-color:#333;padding:10px 30px;color:#F8F8F8;font-family:'Nanum Square';font-weight:bold;">네</button>
				<button type="button" onclick="" style="position:relative;left:180px;border:none;border-radius:10px; background-color:#333;padding:10px 20px;color:#F8F8F8;font-family:'Nanum Square';font-weight:bold;">아니요</button>
			</div>
	</div>
</body>
</html>