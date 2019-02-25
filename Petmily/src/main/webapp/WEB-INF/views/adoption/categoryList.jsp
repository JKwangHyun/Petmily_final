<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f264b44d614a364c2551241f9596ac9d&libraries=services,clusterer,drawing"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<style>
body {
		margin: 0px;
		padding: 0px;
		background-color:#f0efef;
	}
	
	.petList {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;border-top-left-radius:10px;border-top-right-radius:10px;
	}
	.petlist a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
</style>
<script>
function adoptionDetail(n,r){
	if(${Login.id==null}){
        alert('로그인 후 이용해주세요.');
        return;
    }
    $.ajax({
       type:'Post',
       url:"adoptionDetail",
       data:{
          seq:n,
          root:r,
          id:'${Login.id}',
       },
       success:function(result){
          $('#detailForm').html(result)
       }
    });
    $("#adoptionDetail").css("display", "block"); 
    $("#mask").css("display", "block"); 
    
 }
 
 function complete(){
    alert('분양이 완료되어 더 이상 열람할 수 없습니다.');
 }
</script>
<body>
		<div style="position:relative;width:100%;height:750px;top:30px;">
		<div style="position:relative;width:1080px;height:750px;margin:0 auto">
			<c:forEach var="list" items="${list}">
				<c:choose>
					<c:when test="${list.COMPLETE eq 'N'}">
						<div class="petList" onclick="adoptionDetail(${list.SEQ},${list.ROOT})" style="cursor:pointer;">
							<img class="pets" src="${list.MAINIMG}"/>
							<c:choose>
							<c:when test="${list.PETGENDER eq '남'}">
								<i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							<c:when test="${list.PETGENDER eq '여'}">
								<i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							</c:choose>
							<i class="fas fa-eye" style="margin-top:10px;color:gray"> ${list.CNT}&nbsp;<i class="fas fa-thumbtack"> ${list.RESERVE}</i></i>
						</div>
					</c:when>
					
					<c:when test="${list.COMPLETE eq 'Y'}">
						<div class="petList" onclick="complete()" style="cursor:pointer;opacity:0.5;">
							<img class="pets" src="${list.MAINIMG}"/>
							<c:choose>
							<c:when test="${list.PETGENDER eq '남'}">
								<i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							<c:when test="${list.PETGENDER eq '여'}">
								<i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							</c:choose>
							<font style="position:absolute;top:265px;left:85px;font-family: 'Do Hyeon', sans-serif;color:#da532c;font-size:20px;">분&nbsp;양&nbsp;완&nbsp;료</font>
						</div>
					</c:when>
				</c:choose>
				
			</c:forEach>
		</div>
	</div>
	
	
	
</body>
</html>