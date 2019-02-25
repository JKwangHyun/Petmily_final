<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
//expcheck
$(document).ready(function(){
	$('input[type="checkbox"][name="exp"]').click(function(){
		if($(this).prop('checked')) {
			$('input[type="checkbox"][name="exp"]').prop('checked', false);
			$(this).prop('checked', true);
		}
		if($('input:checkbox[id="yes"]').is(":checked")==true)
			$("#exp").css("display","grid");
		else if($('input:checkbox[id="no"]').is(":checked")==true){
			$("#exp").css("display","none");
	    	$('#expArea').html('');
		}
		else $("#exp").css("display","none");
 	});
	
	
	if(${Login.exp=='Y'}){
		$('#yes').prop('checked', true);
		$("#exp").css("display","grid");
	}else $('#no').prop('checked', true);
	
	$('#pw').focusout(function(){
		var pw= $('#pw').val();
		
		if(pw.replace(/[a-z.0-9]/g,'').length>0) {
			$('#pwArea1').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
			return;
		}else $('#pwArea1').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
	});
	$('#pwcheck').focusout(function(){
		var pw= $('#pw').val();
		var pwcheck= $('#pwcheck').val();
		
		if(pw != pwcheck) {
			$('#pwArea2').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
			return;
		}else $('#pwArea2').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
	});
	
	$('#pets').focusout(function(){
		var detail1= $('#pets').val();
		
			if(detail1.length=='') {
				$('#detailArea').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
				return;
			}else $('#detailArea').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
		
	});
	
	$('#period').focusout(function(){
		var detail2= $('#period').val();
		
			if(detail2.length=='') {
				$('#detailArea').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
				return;
			}else $('#detailArea').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
		 
	});
}); 
	function update(){
		var pw= $('#pw').val();
		var pwcheck= $('#pwcheck').val();
		var detail1=$('#pets').val();
		var detail2=$('#period').val();
		
		if(pw.replace(/[a-z.0-9]/g,'').length>0) {
			$('#pwArea1').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
			return;
		}else $('#pwArea1').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
		if(pw != pwcheck) {
			$('#pwArea2').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
			return;
		}else $('#pwArea2').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
		if($('input:checkbox[id="yes"]').is(":checked")==true){
			if((detail1.length=='')||(detail2.length=='')) {
				$('#detailArea').html('<i style="color:#da532c;"  class="fas fa-times"></i>');
				return;
			}else $('#detailArea').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
		}$('#updateForm').submit();
	}
	
	
</script>
<body>
	<div id="update_container1" style="position:relative;width:500px;height:380;float:left;background-color:#F8F8F8;border-radius:20px;">
				<div style="position:relative;top:50px;font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;text-align:center;">회원정보 수정</div>
				  <form id="updateForm" action="memberUpdate">
					<div style="position:relative;top:65px;display:grid;">
						<label for="pw" class="inp">
  		  				<input type="password" id="pw" name="pw" placeholder="&nbsp;">
  	      				<span class="label">새 비밀번호</span>
          				<span class="border"></span>
	      				</label>
	      				<div id="pwArea1" style="position:absolute;top:20px;left:400px;"></div>
	      				<label for="pwcheck" class="inp" style="top:20px;">
  		  				<input type="password" id="pwcheck" name="pwcheck" placeholder="&nbsp;">
  	      				<span class="label">비밀번호 확인</span>
          				<span class="border"></span>
	      				</label>
	      				<div id="pwArea2" style="position:absolute;top:90px;left:400px;"></div>
					</div>
					<div style="position:relative;top:105px;text-align:center;">
        				<div style="font-size:14px; font-family:'Nanum Square';font-weight:bold;color:#333;opacity:0.7;">애완동물 키워본 경험</div>
		        		<input type="checkbox" id="yes" name="exp"value="Y">
		        		<label for="yes" style="position:relative;top:10px;float:left;left:180px;"><font style="margin-left:20px;font-family:'Nanum Square';font-weight:bold;color:#333;">있음</font></label>
		        		<input type="checkbox" id="no" name="exp"value="N">
		        		<label for="no" style="position:relative;top:10px;left:260px;width: 63px;padding-left: 0px;"><font style="margin-left:-30px;font-family:'Nanum Square';font-weight:bold;color:#333;">없음</font></label>
		   			</div>
		   			
					<div id="exp" style="position:relative;top:130px;display:none;">
			    		<label for="pets,period" class="inp" style="position:relative;top:0;float:left;">
			    		<input type="text" id="pets" name="detail1" placeholder="&nbsp;" style="width:49%;z-index:10;" value="${detail1}">
			    		<span class="label"></span>
			   			<span class="border" style="width:49%;"></span>
			    		<input type="text" id="period" name="detail2" placeholder="&nbsp;" style="width:49%;" value="${detail2}">
			    		<span class="label" style="left:145px;"></span>
			    		<span class="border"style="width:49%;left:142.5px;"></span>
			    		</label>
			    		<div id="detailArea" style="position:absolute;top:20px;left:400px;"></div>
		    		</div>
		    		<div class="buttonnn" style="position:absolute; top:320px;width:500px;right:15px;" >
			    		<button onclick="update()" type="button" style="right:40;float:right;border:none;background-color:#F8F8F8;font-size:30px;color:#da532c;"><i class="fas fa-arrow-right"></i></button>
			    		<button onclick="" type="button" style="left:-390px;position:relative;right:40;float:right;border:none;background-color:#F8F8F8;font-size:30px;color:#da532c;"><i class="fas fa-arrow-left"></i></button>
		    		</div>
		    	</form>	
		</div>
</body>
</html>