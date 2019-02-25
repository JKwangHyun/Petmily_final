<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/signForm1.css">
<link rel="stylesheet" href="resources/css/joinForm1.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f264b44d614a364c2551241f9596ac9d&libraries=services,clusterer,drawing"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<style>
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
	/*Checkboxes styles*/
	input[type="checkbox"] { display: none; }
	input[type="checkbox"] + label {
  		display: block;
  		position: relative;
  		padding-left:10px;
  		font: 13px/20px 'Open Sans', Arial, sans-serif;
  		color: #ddd;
  		cursor: pointer;
  		-webkit-user-select: none;
  		-moz-user-select: none;
  		-ms-user-select: none;
  
	}
	input[type="checkbox"] + label:last-child { margin-bottom: 0; }
	input[type="checkbox"] + label:before {
  		content: '';
  		display: block;
  		width: 20px;
  		height: 20px;
  		border: 2px solid #da532c;
  		border-radius:9px;
  		position: absolute;
  		left: 0;
  		top: 0;
  		opacity: .6;
  		-webkit-transition: all .12s, border-color .08s;
  		transition: all .12s, border-color .08s;
	}
	input[type="checkbox"]:checked + label:before {
  		width: 10px;
  		top: -5px;
  		left: 5px;
  		border-radius: 0;
  		opacity: 1;
  		border-top-color: transparent;
  		border-left-color: transparent;
  		-webkit-transform: rotate(45deg);
  		transform: rotate(45deg);
	}
	.petList {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;
	}
	.petlist a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.petList2 {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:0px 10px;text-align:center;
	}
	.petlist2 a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
	@keyframes animate_profile {
		from {left:200px;opacity:1}
		to {left:0px; opacity:1}
	}
	@keyframes animate_profile2 {
		from {left:0px;opacity:1}
		to {left:270px; opacity:1}
	}
	@keyframes animate_update {
		from {right:-400px;opacity:1}
		to {right:0px; opacity:1}
	}
	@keyframes animate_update2 {
		from {right:0px;opacity:1}
		to {right:-600px; opacity:0}
	}
	@keyframes animatetop_findHospital {
		from {top:-300px; opacity:0}
		to {top:45%; opacity:1}
	}
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;}
	/* 동물병원찾기 팝업 */
	#findHospital_form {
		width:900px;
		height:650px; 
		background:#f8f8f8; 
		border: 0px solid black; 
		border-radius:20px;
		position:fixed; top:45%; left:36%; margin:-250px 0 0 -200px; z-index:9999; display:none;
  		animation-name: animatetop_findHospital;
  		animation-duration: 0.4s
	}
</style>
<script>
	$(document).ready(function(){
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
		
		// writingCheck
		$('input[type="checkbox"][name="myMenu"]').click(function(){
			if($(this).prop('checked')) {
				$('input[type="checkbox"][name="myMenu"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		// 수정하기 클릭
		$('#user_edit').click(function() {
			if($("#delete_container").css("display","block")) {
				$("#delete_container").css("display", "none");
			}
			$('#pu').css('width','1050px');
			$("#profile_container").css("animation-name","animate_profile");
			$("#profile_container").css("animation-duration","0.4s");
			$("#update_container").css("display","block");
			$("#update_container").css("animation-name","animate_update");
			$("#update_container").css("animation-duration","0.4s");
		});
		// 수정하기 닫기 클릭
		$('#edit').click(function() {
			$("#profile_container").css("animation-name","animate_profile2");
			$("#profile_container").css("animation-duration","0.4s");
			$("#update_container").css("animation-name","animate_update2");
			$("#update_container").css("animation-duration","0.4s");
			setTimeout(function() {
				$("#update_container").css("display", "none");
				$('#pu').css('width','500px');
				}, 400);
		});
		
		// 탈퇴하기 클릭
		$('#user_out').click(function() {
			if($("#update_container").css("display","block")) {
				$("#update_container").css("display", "none");
			}
			$('#pu').css('width','1050px');
			$("#profile_container").css("animation-name","animate_profile");
			$("#profile_container").css("animation-duration","0.4s");
			$("#delete_container").css("display","block");
			$("#delete_container").css("animation-name","animate_update");
			$("#delete_container").css("animation-duration","0.4s");
		});
		// 탈퇴하기 닫기 클릭
		$('#delete').click(function() {
			$("#profile_container").css("animation-name","animate_profile2");
			$("#profile_container").css("animation-duration","0.4s");
			$("#delete_container").css("animation-name","animate_update2");
			$("#delete_container").css("animation-duration","0.4s");
			setTimeout(function() {
				$("#delete_container").css("display", "none");
				$('#pu').css('width','500px');
				}, 400);
		});
		
		$("input[type=file]").on('change',function(){
			var id = '${Login.id}';
			var formData = new FormData();
			formData.append("uploadfilef",$("input[name=uploadfilef]")[0].files[0]);
			formData.append("id",id);
		    
			$.ajax({
		    	type:"Post",
		    	url:"imgUpload",
		    	processData: false,
                contentType: false,
                data: formData,
		    	success:function(result){
		    		$("#myImage").html(result);
		    	}
		    })
		});
		
		 // categoryCheck-List
		$('input[type="checkbox"][name="myMenu"]').click(function(){
			var menu = $(this).val();
			
			$.ajax({
				type:'Post',
				url:"myList",
				data:{
					menu:menu,
					id:'${Login.id}',
					
				},
				success:function(result){
					$('#writingList').html(result)
				}
			});
		}); 
		 
		// Find Pet Hospital
		$('#FindHospital').click(function(){
			$('#findHospital_form').css('display','block');
			$('#mask').css('display','block');
		});
	});
	
	/* 정보수정 form */
	function pwcheck1(){
		var pw1 = $('#pw1').val();
		var pwcheck1 = $('#pwcheck1').val();
		
		if(pw1 == pwcheck1){
			$.ajax({
				type : "Post",
				url : "updateForm",
				success : function(result) {
					$("#update_container").html(result);
				}
			});
		}else alert('비밀번호가 일치하지 않습니다.');
		
	}
	/* 탈퇴 form */
	function pwcheck2(){
		var pw2 = $('#pw2').val();
		var pwcheck2 = $('#pwcheck2').val();
		
		if(pw2 == pwcheck2){
			$.ajax({
				type : "Post",
				url : "memberDeleteForm",
				success : function(result) {
					$("#delete_container").html(result);
				}
			});
		}else alert('비밀번호가 일치하지 않습니다.');
		
	}
	
	function searchH() {
		$.ajax({
			type : 'get',
			url : 'hospitalList',
			dataType: 'json',
			data : {
				sigun_nm : $('#search').val(),  
			},
			success : function(data) {
	        	var myItem = data.Animalhosptl[1].row;     
	        	var output = '';
	        	var aaa = '';
	            $.each(myItem,function(key,value){
	            	 aaa = value.REFINE_LOTNO_ADDR;
	            	 output += '<div onclick="hospital(\''+value.REFINE_LOTNO_ADDR+'\',\''+value.BIZPLC_NM+'\')" style="cursor:pointer;"><div style="font-weight:bold;color:#333;">'+value.BIZPLC_NM+'</div>';
	            	 output += '<div style="font-weight:bold;color:#9098a9;font-size:12px;margin-bottom:5px;">'+value.REFINE_LOTNO_ADDR+'</div></div>';
	            });
	           	$("#hospitalList_container").html(output);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
	            alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	      		}
		});
	}
	function hospital(s,n){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(s, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:200px;text-align:center;font-weight:bold;color:#9098a9;padding:6px 0;border-radius:20px;">'+n+'</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href="home"><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="adoption" style="display:block;cursor:default;font-size:16px;margin-left:15px;color:white">Adoption Of Pets</li>
				<li id="community" style="display:block;cursor:default;font-size:16px;margin-left:30px;color:white">Community</li>
				<li id="FindHospital" style="display:block;cursor:pointer;font-size:16px;margin-left:30px;color:white">Find Pet Hospital</li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<li><a href="myPage?id=${Login.id}"><i class="fas fa-user-circle" style="font-size:25px;margin-top:-1px;"></i><font style="position:relative;top:-2px;"> ${Login.name} 님</font></a></li>
				<li><a href="logout" style="margin:0;">Logout</a></li>
			</ul>
		</div>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:170px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li id="li_registration" style="margin-bottom:15px;cursor:pointer;font-size: 16px;margin-left:15px;color:white">Registration</li>
			<li><a href="adoptionList">Adoption</a></li>
		</ul>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:150px;height:85px;background-color:#333;z-index:10;left:385px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="noticeList">Notice</a></li>
			<li><a href="infoList">Sharing Info</a></li>
		</ul>
	</div>
	
	<!-- 프로필 -->
	<div id="profile" style="position:relative;width:100%;height:380px;top:50px;">
		<div id="pu" style="width:500px; margin:0 auto;">
			<div id="profile_container" style="position:relative;width:500px;height:380px;float:left; background-color:#F8F8F8;border-radius:20px;">
				<form id="FILE_FORM" method="post" enctype="multipart/form-data">
					<input  id="uploadfilef" type="file" name="uploadfilef" style="display:none;"> 
					<label id="myImage"for="uploadfilef" style="position:relative;top:30px;border-radius:50%;border:3px solid #333; width:130px;height:130px;margin:0 auto;display:block;background-image:url('${Login.myimage}');background-size:cover;"></label>
				</form>
				<div style="position:relative; width:500px;height:190;top:50px;">
					<table style="width:500px;">
						<tr align="center">
	                		<td colspan="2" style="font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;">${Login.name}</td>
	              		</tr>
	              		<tr align="center" style="height:40px;" >
	                		<td colspan="2" style="font-size:15px;font-family: 'Nanum Square';font-weight:bold;color:#333;opacity:0.7">${Login.id}</td>
	             		</tr>
	             		 <tr align="center" style="height:40px;">
	                		<td colspan="2" style="font-size:15px;font-family: 'Nanum Square';font-weight:bold;color:#333;">${Login.detail}<font style="font-size:14px;font-family: 'Nanum Square';font-weight:bold;color:#333;">을 키워봤습니다.</font></td>
	              		</tr>
						<tr height="20"></tr>
						<tr align="center">
							<td id="user_edit" style="font-size:18px;font-family: 'Nanum Square';font-weight:bold;color:#333;cursor:pointer"><i style="color:#FBBC05;"class="fas fa-user-edit"></i> 수정하기</td>
	                		<td id="user_out" style="font-size:18px;font-family: 'Nanum Square';font-weight:bold;color:#333;cursor:pointer"><i style="color:#da532c;"class="fas fa-user-times"></i> 탈퇴하기</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="update_container" style="position:relative;margin-left:30px;width:500px;height:380px;float:left;background-color:#F8F8F8;border-radius:20px;display:none;">
				<div style="position:relative;top:50px;font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;text-align:center;">비밀번호 확인</div>
					<div style="position:relative;top:100px;display: grid;">
						<label for="pw1" class="inp">
  		  				<input type="password" id="pw1" name="pw" placeholder="&nbsp;" value="${Login.pw}" readonly>
  	      				<span class="label">비밀번호</span>
          				<span class="border"></span>
	      				</label>
	      				<label for="pwcheck1" class="inp" style="top:20px;">
  		  				<input type="password" id="pwcheck1" name="pwcheck" placeholder="&nbsp;">
  	      				<span class="label">비밀번호 확인</span>
          				<span class="border"></span>
	      				</label>
					</div>
					<div style="position:relative;top:160px;">
					<button type="button" onclick="pwcheck1()" style="position:relative;left:170px;border:none;border-radius:10px; background-color:#333;padding:13px 67px;color:#F8F8F8;font-family:'Nanum Square';font-weight:bold;">확인</button>
					</div>
				</div>
			<div id="delete_container" style="position:relative;margin-left:30px;width:500px;height:380px;float:left;background-color:#F8F8F8;border-radius:20px;display:none;">
				<div style="position:relative;top:50px;font-size:25px;font-family: 'Nanum Square';font-weight:bold;color:#333;text-align:center;">비밀번호 확인</div>
					<div style="position:relative;top:100px;display: grid;">
						<label for="pw2" class="inp">
  		  				<input type="password" id="pw2" name="pw" placeholder="&nbsp;" value="${Login.pw}" readonly>
  	      				<span class="label">비밀번호</span>
          				<span class="border"></span>
	      				</label>
	      				<label for="pwcheck2" class="inp" style="top:20px;">
  		  				<input type="password" id="pwcheck2" name="pwcheck" placeholder="&nbsp;">
  	      				<span class="label">비밀번호 확인</span>
          				<span class="border"></span>
	      				</label>
					</div>
					<div style="position:relative;top:160px;">
					<button type="button" onclick="pwcheck2()" style="position:relative;left:170px;border:none;border-radius:10px; background-color:#333;padding:13px 67px;color:#F8F8F8;font-family:'Nanum Square';font-weight:bold;">확인</button>
					</div>
			</div>
			
			
		</div>
	</div>
	
	<!-- Check Box -->
	<div id="writing" style="position:relative;width:100%;height:100px;top:70px;">
	  <div id="writing_container" style="position:relative;margin:0 auto; width:500px;height:100px;border-radius:20px;">
		<input type="checkbox" id="myAdoptionList" name="myMenu" value="myAdoptionList"  checked>
	   	<label for="myAdoptionList" style="position:relative;top:20px;float:left;left:0px;"><font style="margin-left:25px;font-family:'Nanum Square';font-weight:bold;color:#333;">나의 분양 등록 글</font></label>
   	    <input type="checkbox" id="myLikeList" name="myMenu" value="myLikeList">
	  	<label for="myLikeList" style="position:relative;top:20px;left:190px;"><font style="margin-left:-105px;font-family:'Nanum Square';font-weight:bold;color:#333;">나의 분양 예약 목록</font></label>
		<input type="checkbox" id="myBoardList" name="myMenu" value="myBoardList">
	  	<label for="myBoardList" style="position:relative;top:0px;left:390px;"><font style="margin-left:25px;font-family:'Nanum Square';font-weight:bold;color:#333;">나의 게시판</font></label>
	  </div>
	</div>
	
	<!-- 게시글 리스트 -->
	<div id="writingList" style="position:relative;width:100%;height:750px;top:20px;">
		<div id="writingList_container" style="position:relative;width:1080px;height:750px;margin:0 auto">
		<c:forEach var="list" items="${list}">
				<c:choose>
					<c:when test="${list.COMPLETE eq 'N'}">
						<div class="petList" onclick="adoptionDetail(${list.SEQ},${list.ROOT})" style="cursor:pointer;">
							<img class="pets" src="resources/img/dog1.jpg"  />
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
							<img class="pets" src="resources/img/dog1.jpg"  />
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
	
	<!-- 동물병원 찾기 -->
	<div id="mask"></div>
	<div id="findHospital_form">
		<!-- 검색 창 -->
		<div style="width:100%;height:150px;">
			<div style="position:relative; top:20; width:200px;height:20px;margin:0 auto;font-size:30px;font-family: 'Do Hyeon', sans-serif;font-weight:bold;color:#333;">FIND HOSPITAL</div>
			<div style="position:relative;top:50;left:-20;width:300px;margin:0 auto;">
				<label for="search" class="inp">
					<input type="text" id="search" name="address" value="" placeholder="&nbsp;" style="font-family:'Nanum Square';font-weight:bold;color:#9098a9;">
					<span class="label"><i class="fas fa-search" style="position:relative;float:right;"></i><span>
					<span class="border"></span>
				</label>
				<button type="button" onclick="searchH()" style="cursor:pointer;outline:none;position:relative;left:300;top:-30px;width:50px;height:30px;border-radius:10px;border:1px solid #f0efef;color:#333;font-weight:bold;background-color:#f0efef;">검색</button>
			</div>
		</div>
		
		<!-- 하단 내용 -->
		<div style="width:100%;height:500px;">
			<!-- 리스트 -->
			<div id="hospitalList" style="position:relative;width:45%;height:500px;float:left;">
				<div id="hospitalList_container" style="overflow-x:auto;overflow-y:auto;position:relative;width:390px;height:450px;margin:25px 0;float:left;padding-left:15px;">
				</div>
				<!-- 경계선 -->
				<div style="position:absolute; width:2px;height:450px;margin:25px 0;top:0;right:0;background-color:#f0efef;"></div>
			</div>
			
			<!-- 지도 -->
			<div id="map_container" style="position:relative;width:55%;height:500px;float:right">
				<div id="map" style="width:450px;height:450px;margin:25px 22.5px;border-radius:10px;"></div>
			</div>
			<script src="resources/jqlib/custom-file-input.js"></script>
		</div>
	</div>
</body>
</html>
