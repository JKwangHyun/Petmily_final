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
$('#replyList_container').scrollTop($('#replyList_container').prop('scrollHeight'));
$(document).ready(function () {
});

function rreply(n) {
	$('.rreply_container'+n).css('display','block');
}
function rreplyC(n) {
	$('.rreply_container'+n).css('display','none');
	$('.rreplyT'+n).val('');
}
function rreplyB(se,r,s,ind,i,img) {
	$.ajax({
		type : "Post",
		url : "infoReplyInsert",
		data:{
			seq : se,
			root : r,
			step: s,
			indent : ind,
			id : i,
			myimg : img,
			content : $('.rreplyT'+se).val(),
		},
		success : function(result) {
				$(".rreplyList"+se).html(result);
		}
	});
	$('.rreplyT'+se).val('');
}

function look(n,m) {
	$.ajax({
		type : "Post",
		url : "infoRReplyList",
		data:{
			seq : n,
			root : m,
		},
		success : function(result) {
				$(".rreplyList"+n).html(result);
		}
	});
	$('.rreplyList'+n).css('display','block');
}

function replyD(r) {
	location.href="replyDelete?root="+r;
}
</script>
<body>
	<c:forEach var="infoReply" items="${infoReplyList}">
		<c:if test="${infoReply.INDENT=='1'}">
		<div style="position:relative; width:100%;height:inherit;">
			<div style="position:relative;width:15%;float:left;">
				<div style="position:relative;top:5px;display:block; border-radius:50%;border:2px solid #333; width:30px;height:30px;margin:0 auto;background-image:url('${infoReply.MYIMG}');background-size:cover;"></div>
			</div>
			<div style="position:relative;width:85%;float:left;">
				<div style="cursor:default;position:relative;font-size:12px;color:#333;font-family:'Nanum Square';font-weight:bold;">${infoReply.ID} &nbsp;&nbsp;&nbsp;<font style="font-size:10px;">${infoReply.RDATE}</font></div>
				<c:if test="${Login.id==infoReply.ID || Login.id=='admin'}">
					<div onclick="replyD(${infoReply.ROOT})" style="position:relative;cursor:pointer;width:25px;font-size:10px;color:#9098a9;font-family:'Nanum Square';margin-left:20px;top: -13;left: 120px;margin-bottom: -13;">삭제</div>
				</c:if>
				<div style="cursor:default;position:relative;color:gray;font-weight:bold;font-family:'Nanum Square';">${infoReply.CONTENT}</div>
				<div onclick="rreply(${infoReply.SEQ})" style="cursor:pointer;position:relative;margin-bottom:10px;width:25px;font-size:10px;color:#9098a9;font-family:'Nanum Square';float:left;">답글</div>
				<div onclick="look(${infoReply.SEQ},${infoReply.ROOT})" style="position:relative;cursor:pointer;width:70px;font-size:10px;color:#9098a9;font-family:'Nanum Square';margin-left:20px;float:left;">답글 보기</div>
				<div class="rreply_container${infoReply.SEQ}" style="position:relative;margin:10px 0; display:none;">
					<div style="float:left;margin-right:10px;position:relative;top:5px;display:block; border-radius:50%;border:2px solid #333; width:20px;height:20px;background-image:url('${infoReply.MYIMG}');background-size:cover;"></div>
					<input class="rreplyT${infoReply.SEQ}" type="text" style="outline:none;border:none;border-bottom:2px solid #f0efef;background-color:inherit;color:#9098a9;font-family:'Nanum Square';width:220px;">
					<button onclick="rreplyB(${infoReply.SEQ},${infoReply.ROOT},${infoReply.STEP},${infoReply.INDENT},'${Login.id}','${Login.myimage}')" type="button" style="outline:none;cursor:pointer;font-size:10px;background-color:inherit;border:none;color:#9098a9;font-family:'Nanum Square';font-weight:bold;padding:0 0;">답글</button>
					<button onclick="rreplyC(${infoReply.SEQ})" type="button" style="outline:none;cursor:pointer;font-size:10px;background-color:inherit;border:none;color:#9098a9;font-family:'Nanum Square';font-weight:bold;padding:0 0;">취소</button>
				</div>
				
				<div class="rreplyList${infoReply.SEQ}" style="display:none;">
				</div>
			</div>
		</div>
		</c:if>
	</c:forEach>
</body>
</html>