<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	#replyList_container::-webkit-scrollbar {
    	width: .4em;
	}
 
	#replyList_container::-webkit-scrollbar-track {
	}
 
	#replyList_container::-webkit-scrollbar-thumb {
  		background-color: darkgrey;
  		outline: 1px solid slategrey;
 		border-radius:10px;
	}
	
</style>
<script>
$(document).ready(function(){
	$.ajax({
		type : "Post",
		url : "infoReplyList",
		data:{
			root : $('#root').val(),
		},
		success : function(result) {
				$("#infoReplyList").html(result);
		}
	});
	$('#replyList_container').scrollTop($('#replyList_container').prop('scrollHeight'));
	var title = '${infoDetail.TITLE}';
	var index = title.indexOf(']');
	var ext = title.substring(index+1);
	$('#title1').val(ext);
	$('#content1').text('${infoDetail.CONTENT}');
	$('#seqU').val('${infoDetail.SEQ}');
});

function infoReply(n,s,img,step,indent) {
	$.ajax({
		type : "Post",
		url : "infoReplyInsert",
		data:{
			root : n,
			step : step,
			indent : indent,
			id : s,
			myimg : img,
			content : $('.form__field').val(),
		},
		success : function(result) {
				$("#infoReplyList").html(result);
		}
	});
	$('#replyform').val('');
}
function infoReplyL() {
	$('#replyform').val('');
	alert('로그인을 해주세요.');
}

function infoD(s) {
	location.href="infoDelete?seq="+s;
	alert('삭제 되었습니다.');
}

function infoDetail_close() {
	$("#infoDetail").css("display", "none"); 
 	$("#mask").css("display", "none");
}
</script>
<body>
	<div style="width:1000px;height:700px;">
		<button onclick="infoDetail_close()" style="position:absolute;top:10;right:10;cursor:pointer;color:#9098a9;outline:none;background-color:inherit;border:none;"><i class="fas fa-times"></i></button>
		<!-- 내용 -->
		<div style="position:relative; width:570px;height:700px;float:left;">
			<input id="root" value="${infoDetail.ROOT}" style="display:none;">
			<div style="position:relative;cursor:default; ;margin-top:50px;font-size:20px;text-align:center;color:#9098a9;font-family:'Nanum Square';font-weight:bold;">${infoDetail.TITLE}</div>
			<div style="position:relative;cursor:default;color:#9098a9;font-family:'Nanum Square';left: 50px;margin-top: 30px;margin-bottom: 10px;">내용
				<c:if test="${Login.id==infoDetail.ID}">
					<button onclick="infoU()" style="cursor:pointer;outline:none;border:none;background-color:inherit;margin-left:330px;margin-top:-5;color:#9098a9;font-family:'Nanum Square';"><i class="fas fa-edit"></i>수정</button>
					<button onclick="infoD(${infoDetail.SEQ})" style="cursor:pointer;outline:none;border:none;background-color:inherit;margin-top:-5;color:#9098a9;font-family:'Nanum Square';"><i class="fas fa-trash-alt"></i>삭제</button>
				</c:if>
			</div>
			<div style="position:relative;font-size:15px;width:480px;height:510px;margin:0 auto;color:#9098a9;font-family:'Nanum Square';border:2px solid #f0efef;border-radius:20px;padding:10px 10px;">${infoDetail.CONTENT}</div>
			<!-- 경계선 -->
			<div style="position:absolute; width:2px;height:600px;margin:50px 0;right:0;top:0;background-color:#f0efef;"></div>
		</div>
		
		<!-- 댓글 -->
		<div style="width:430px;height:700px;float:right;">
			<!-- 댓글 리스트 -->	
			<div id="replyList_container" style="position:relative;overflow-x:auto;overflow-y:auto;top:50px;width:380px;height:510px;margin:0 auto;border:0px;;border-radius:20px;padding:10px 10px;">
				<div id="infoReplyList"></div>
			</div>
			
			<!-- 댓글 폼 -->
			<div class="container__item" style="position:relative;top:75px;margin-left:20px;">
				<form class="form" autocomplete="off">
					<input type="text" id="replyform" class="form__field" style="height:59px;"/>
					<c:choose>
						<c:when test="${Login.id==null}">
							<button type="button" class="btn btn--primary btn--inside uppercase" onclick="infoReplyL()">댓글</button>
						</c:when>
						<c:when test="${Login.id!=null}">
							<button type="button" class="btn btn--primary btn--inside uppercase" onclick="infoReply(${infoDetail.ROOT},'${Login.id}','${Login.myimage}',${infoDetail.STEP},${infoDetail.INDENT})">댓글</button>
						</c:when>
					</c:choose>
				</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>