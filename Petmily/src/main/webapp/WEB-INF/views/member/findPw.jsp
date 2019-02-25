<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdCheck</title>
</head>
<script>
	function newPw() {
		var pw=$('#newPw1').val();
		var pwcheck=$('#newPw2').val();
		
		if(pw.length=='') {
			$('#newPw').html('비밀번호를 입력하세요. ');
			return;
		}
		else if(pw.length<4 || pw.replace(/[a-z.0-9]/g,'').length>0) {
			$('#newPw').html('5자 이상 영문,숫자만 입력 가능합니다.');
			return;
		}else $('#newPw').html('');
		
		if(pwcheck.length=='' || (pw != pwcheck)) {
			$('#newPwCheck').html('<i class="fas fa-times" style="color:#da532c;"></i>');
			return;
		}else $('#newPwCheck').html('<i class="fas fa-check" style="color:#7CBB00;"></i>');
		alert('수정 되었습니다.');
		$('#findPw_form').submit();
	}
</script>
<body>
	<c:if test="${findPw != null}">
		<h1 style="pointer-events:none;cursor:default;">New PW</h1>
	  		<div class="question">
	    		<input type="password" id="newPw1" name="pw" required/>
	    		<label>NewPw</label>
	  		</div>
	  		<input type="text" name="id" value="${findPw.id}" style="display:none;"/>
	 		<div class="question">
	    		<input type="password" id="newPw2" name="newPw2" required/>
	   			<label>NewPwCheck</label><div id="newPwCheck" style="position:relative;z-index:10;top:-30;left:420px;"></div>
	  		</div>
	  		<div id="findPw" style="position:relative;top:10px;text-align:center;color:#da532c;font-family:'Nanum Square';font-weight: bold;"></div>
	  		<input type="button" value="NewPW" onclick="newPw()" style="margin-top:25px;font-family:'Nanum Square';font-weight:bold;">
	  		<i class="fas fa-user" onclick="loginform()" style="margin-left:170px;cursor:pointer;color:#333;"> Login</i>
			<i class="fas fa-key" onclick="findid()" style="margin-left:20px;cursor:pointer;color:#333;"> Find ID</i>
	</c:if>
	
	<c:if test="${findPw == null}">
		<h1 style="pointer-events:none;cursor:default;">Find PW</h1>
	  		<div class="question">
	    		<input type="text" id="findid2" name="id" required/>
	    		<label>UserID</label>
	  		</div>
	 		<div class="question">
	    		<input type="text" id="findname2" name="name" required/>
	   			<label>UserName</label>
	  		</div>
	  		<div id="findPw" style="position:relative;top:10px;text-align:center;color:#da532c;font-family:'Nanum Square';font-weight: bold;">정보가 일치하지 않거나 없는 계정입니다.</div>
	  		<input type="button" value="FindPW" onclick="findPw()" style="margin-top:25px;font-family:'Nanum Square';font-weight:bold;">
	  		<i class="fas fa-user" onclick="loginform()" style="margin-left:170px;cursor:pointer;color:#333;"> Login</i>
			<i class="fas fa-key" onclick="findid()" style="margin-left:20px;cursor:pointer;color:#333;"> Find ID</i>
	</c:if>
</body>
</html>