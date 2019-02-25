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
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
	#noticeDetail {width:600px; height:800px; background:#f0efef; border: 0px solid black; border-radius:20px;position:fixed; top:35%; left:45%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	@-webkit-keyframes animatetop {
		from {top:-300px; opacity:0} 
 		to {top:50%; opacity:1}
	}
	@keyframes animatetop {
		from {top:-300px; opacity:0}
		to {top:35%; opacity:1;display:none;}
	}
	.buttonnn button{
		position:relative;
		font-family:'Nanum Square';
		font-weight:bold;
		font-size:25px;
		color:#333;
		opacity:0.5;
		border:none;
		background-color:#f0efef;
	}
	body {
		margin: 0px;
		padding: 0px;
		background-color:#f0efef;
	}
	li a {
		font-size:16px;
		display:block;
		margin:0px 15px;
		text-decoration:none;
		color:white;
	}
	#menu li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		height:37px;
	}
	#sign li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		margin:0px 15px;
		color:white;
		cursor:pointer;
	}
	#menu li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		height:37px;
	}
	#sign li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		margin:0px 15px;
		color:white;
		cursor:pointer;
	}
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
</style>
<script>
	$(document).ready(function(){
	
		$("#noticeDetail").css("display", "block"); 
		$("#mask").css("display", "block");
		
		// menu_slide 
		$("#menu_slide_Community,#menu_slide_Adoption").css("display","none");
		$("#community,#menu_slide_Community").mouseout(function() {
			$("#menu_slide_Community").stop().slideUp("fast");
		});
		$("#community,#menu_slide_Community").mouseover(function() {
			$("#menu_slide_Community").stop().slideDown("fast");
		});
		$("#adoption,#menu_slide_Adoption").mouseout(function() {
			$("#menu_slide_Adoption").stop().slideUp("fast");
		});
		$("#adoption,#menu_slide_Adoption").mouseover(function() {
			$("#menu_slide_Adoption").stop().slideDown("fast");
		});
});
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href="home"><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="adoption"><a href="#">Adoption Of Pets</a></li>
				<li id="community"><a href="#">Community</a></li>
				<li><a href="#">Find Pet Hospital</a></li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<c:choose>
					<c:when test="${Login.id == null}">
						<li id="signIn">Sign In</li>
						<li id="signUp">Sign Up</li>
					</c:when>
					<c:when test="${Login.id != null}">
						<li><a href="myPage"><i class="fas fa-user-circle" style="font-size:25px;margin-top:-1px;"></i><font style="position:relative;top:-2px;"> ${Login.name} 님</font></a></li>
						<li><a href="logout" style="margin:0;">Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
			
		</div>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:170px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Registration</a></li>
			<li><a href="">Adoption</a></li>
		</ul>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:150px;height:85px;background-color:#333;z-index:10;left:385px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Notice</a></li>
			<li><a href="">Sharing Info</a></li>
		</ul>
	</div>
	<!-- 상세보기 팝업창 -->
	<div id="mask">
		<div style="position:relative;top:450px;left:550px;">
		<a href="noticeDetail?seq=${detail.PRESEQ}&title=${detail.PRETITLE}"><i class="fas fa-angle-left" style="color:#f0efef;font-size:70px;"></i></a>
		</div>
		<div style="position:relative;top:380px;left:1330px;">
		<a href="noticeDetail?seq=${detail.NEXTSEQ}&title=${detail.NEXTTITLE}"><i class="fas fa-angle-right" style="color:#f0efef;font-size:70px;"></i></a>
		</div>
	</div>
	<div id="noticeDetail" >
		<form action="noticeUpdate" method="post">
			<table style="width: 45%;position:relative;top:50px;left:40px;">
				<tr height="40" >
					<td colspan="2" style="text-align:center;">
					<input name="title" type="text" value="${detail.TITLE}"style="font-size:18px;font-weight:bold; border:none;background-color:#f0efef;text-align:center;" /></td>
				</tr>
				<tr height="40">
					<td><i class="far fa-clock" style="color:#da532c;"></i>&nbsp;${detail.NDATE}</td>
					<td style="text-align:right;"><i class="far fa-eye"style="color:#da532c;"></i>&nbsp;${detail.CNT}</td>
				</tr>
				<tr>
					<td colspan="2" ><textarea rows="30" cols="70" name="content"style="resize:none; border:1px solid gray;background-color:#f0efef;">${detail.CONTENT}</textarea></td>
				</tr>
			</table>
			<div style="position:relative;top:120px;left:50px;">
				<input style="border:1px solid #333; padding: 15px; border-radius: 10px; width: 160px;background-color:#f0efef;"type="button" onclick="history.back()" value="취소" /> 
				<input type="submit" style="background-color:#f0efef;position:relative;left:10px;border:1px solid #333; padding: 15px; border-radius: 10px;width: 160px;"value="수정" />&nbsp;&nbsp;&nbsp;
				<a href="noticeDelete?seq=${detail.SEQ}"style="text-decoration: none;">
				<button type="button" style="background-color:#f0efef;border:1px solid #333;padding: 15px; border-radius: 10px;width: 160px;">삭제</button></a>
			</div>
		</form>
	</div>
</body>
</html>