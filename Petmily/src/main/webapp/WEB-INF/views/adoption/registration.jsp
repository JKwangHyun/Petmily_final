<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/joinForm1.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f264b44d614a364c2551241f9596ac9d&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" type="text/css" href="resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
<meta name="description" content="Demo for the tutorial: Styling and Customizing File Inputs the Smart Way" />
<meta name="keywords" content="cutom file input, styling, label, cross-browser, accessible, input type file" />
<meta name="author" content="Osvaldas Valutis for Codrops" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
		background-color:#f5efef;
	}
	li a:hover{
		color:white;
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
	#registration_check {
		position: relative;
		width: 250px;
		height: 35px;
		padding: 0px;
		background: #f0efef;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
	}
	#registration_check:after {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 4px 0 4px 9px;
		border-color: transparent #f0efef;
		display: block;
		width: 0;
		z-index: 1;
		right: -9px;
		top: 13px;
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
		// registration 클릭 시
		$('#li_registration').click(function(){
			if(${Login.id==null}) {
				alert('로그인을 해주세요.');
				return;
			}else if(${Login.id!=null}) location.href="registration";
		});
		
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
		
		// check
		$('input[type="checkbox"][name="pettype"]').click(function(){
			if($(this).prop('checked')) {
				$('input[type="checkbox"][name="pettype"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		// Find Pet Hospital
		$('#FindHospital').click(function(){
			$('#findHospital_form').css('display','block');
			$('#mask').css('display','block');
		});
		// 지도
		$('#searchB').click(function() {
			var address = $('#search').val();
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
			geocoder.addressSearch(address, function(result, status) {
			
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;border-radius:10px;">분양 위치</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		});
	});
	
	// 분양 유효성 검사
	function registration() {
		var title = $('#title').val();
		var pettype = $('.animal').val();
		var petkind  = $('#petkind').val();
		var petgender  = $('#petgender').val();
		var petage  = $('#petage').val();
		var content = $('#content').val();
		var address = $('#search').val();
		
		if(title.length=='') {
			$('#registration_check').html('제목을 입력하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		if($('input:checkbox[id="animal1"]').is(":checked")==false 
				&& $('input:checkbox[id="animal2"]').is(":checked")==false
					&& $('input:checkbox[id="animal3"]').is(":checked")==false) {
			$('#registration_check').html('동물을 선택하세요. ');
			$('#registration_check').css('display','block');
			return;
		}
		if(petkind.length=='') {
			$('#registration_check').html('품종을 선택하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		if(petage.length=='') {
			$('#registration_check').html('나이를 입력하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		if(petgender.length=='') {
			$('#registration_check').html('성별를 입력하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		if(content.length=='') {
			$('#registration_check').html('상세내용을 입력하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		if(address.length=='') {
			$('#registration_check').html('주소를 입력하세요.');
			$('#registration_check').css('display','block');
			return;
		}
		$('#registration').submit();
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
		var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
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
<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
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
				<c:choose>
					<c:when test="${Login.id == null}">
						<li id="signIn">Sign In</li>
						<li id="signUp">Sign Up</li>
					</c:when>
					<c:when test="${Login.id != null}">
						<li><a href="myPage?id=${Login.id}"><i class="fas fa-user-circle" style="font-size:25px;margin-top:-1px;"></i><font style="position:relative;top:-2px;"> ${Login.name} 님</font></a></li>
						<li><a href="logout" style="margin:0;">Logout</a></li>
					</c:when>
				</c:choose>
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
	
	<!-- 제목 -->
	<div style="position:relative;margin-top:30px;text-align:center;font-size:40px;font-family: 'Do Hyeon', sans-serif;font-weight:bold;color:#333;pointer-events:none;cursor:default;"><font>분양 등록</font></div>
	<!-- 분양 폼-->
	<div style="position:relative;margin:30 auto;width:1100px;height:700px;background-color:white;border-radius:20px;">
		
		<!-- 왼쪽 폼 -->
		<form id="registration" action="Aregistration" method="post" autocomplete="off" enctype="multipart/form-data" style="margin-left:-30px;">
		<div style="position:relative;float:left;width:650px;height:700px;left:10px;">
				<input id="id" name="id" value="${Login.id}" style="display:none;">
				<div style="position:relative; display:grid; margin-top:30px;width:400px;">
					<label for="title" class="inp" >
		  		  	<input type="text" id="title" name="title" placeholder="&nbsp;" style="font-family:'Nanum Square';font-weight:bold;color:#9098a9;">
		  	      	<span class="label"><b>제목</b></span>
		          	<span class="border"></span>
			      	</label>
		      	</div>
		      	
		      	<div style="position:relative;margin-left:-40px;margin-top:20px;">
		      		<div style="float:left">
			      		<input type="checkbox" id="animal1" name="pettype"class="animal" value="1">
			      		<label for="animal1" style="width:100px;left:100px;"><font style="position:relative;left:20px; font-family:'Nanum Square';font-weight:bold;color:#9098a9;"><b>강아지</b></font></label>
			      	</div>
			      	<div style="float:left">
				      	<input type="checkbox" id="animal2" name="pettype"class="animal" value="2">
		  			 	<label for="animal2" style="width:100px;left:100px;"><font style="position:relative;left:20px; font-family:'Nanum Square';font-weight:bold;color:#9098a9;"><b>고양이</b></font></label>
	  			 	</div>
	  			 	<div style="float:left">
		  			 	<input type="checkbox" id="animal3" name="pettype"class="animal" value="3">
		  			 	<label for="animal3" style="width:100px;left:100px;"><font style="position:relative;left:20px; font-family:'Nanum Square';font-weight:bold;color:#9098a9;"><b>기타</b></font></label>
		      		</div>
		      	</div>
		      	
		      	<div style="position:relative;margin-top:60px;">
		      		<h4 style="cursor:default;margin-left:60px;color:#9098a9;font-weight:bold;">내용</h4>
		      		<div style="outline:none;width:545px;height:475px; margin-top:-5px;margin-left:60px;padding:10px 10px; border-radius:20px;border:2px solid #f0efef;font-family: 'Do Hyeon', sans-serif;color:#9098a9;">
						<div style="margin-bottom:20px;">품종 :<input id="petkind" name="petkind" contenteditable="true" style="font-family:'Nanum Square';color:#9098a9;border:none;outline:none;position:relative;left:20px;width:430px;"></div>
						<div style="margin-bottom:20px;">나이 :<input id="petage" name="petage" contenteditable="true" style="font-family:'Nanum Square';color:#9098a9;border:none;outline:none;position:relative;left:20px;width:430px;"></div>
						<div style="margin-bottom:20px;">성별 :<input id="petgender" name="petgender" contenteditable="true" style="font-family:'Nanum Square';color:#9098a9;border:none;outline:none;position:relative;left:20px;width:430px;"></div>
		      			<div>상세내용 :</div>
		      			<input type="text" id="content" name="content" style="font-family:'Nanum Square';color:#9098a9;border:none;outline:none;width:520px;margin-top:10px;"/>
		      			
		      			<div style="margin-top:230px;">IMG :</div>
		      			<div style="margin-top: -33;margin-left: 110px;">
			      			<input type="file" name="uploadMimg" id="file-1" class="inputfile inputfile-2"/>
							<label for="file-1" style="border-radius:30px;width:159px;height:44px;padding-top:3px;padding-left:30px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17" style="width: 15px;height: 20px;padding-top: 5px;"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span style="font-size:12px;">Main IMG</span></label>
							<input type="file" name="uploadSimg" id="file-2" class="inputfile inputfile-2" data-multiple-caption="{count} files selected" multiple />
							<label for="file-2" style="border-radius:30px;width:159px;height:44px;padding-top:3px;padding-left:35px;margin-left:20px;"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17" style="width: 15px;height: 20px;padding-top: 5px;"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span style="font-size:12px;">Sub IMG</span></label>
		      			</div>
		      		</div>
		      	</div>
		</div>
		
		<!-- 오른쪽 폼 -->
		<div style="position:relative;float:left;width:450px;height:700px;left:20px;">
			<div style="position:relative; width:2px;height:600px;float:left;left:-20px;margin:50px 0;background-color:#f0efef;border:2px;"></div>
				<h3 style="cursor:default;margin-left:20px;color:#9098a9;font-weight:bold;margin-top:50px;">주소</h3>
				<div style="position:relative; display:grid; left:-60px; margin-top:20px;width:440px;">
					<label for="search" class="inp">
			  		<input type="text" id="search" name="address" value="" placeholder="&nbsp;" style="font-family:'Nanum Square';font-weight:bold;color:#9098a9;">
			  	    <span class="label"><i class="fas fa-search" style="position:relative;float:right;"></i><span>
			        <span class="border"></span>
				    </label>
				    <button type="button" id="searchB" style="cursor:pointer;outline:none;position:relative;left:425px;top:-30px;width:50px;height:30px;border-radius:10px;border:1px solid #f0efef;color:#333;font-weight:bold;background-color:#f0efef;">검색</button>
			    </div>
			    
				<div id="map" style="width:400px;height:300px;border-radius:10px;margin-left:20px;margin-top:3px;"></div>
				<div id="registration_check" style="position:absolute;top:595px;left:70px;padding-top:5px;text-align:center;display:none;color:#333;font-family:'Nanum Square';font-weight:bold;"></div>
				<i onclick="registration()" class="fas fa-paw" style="cursor:pointer;position:relative;font-size:50px;color:#f0efef;top:110px;left:370px;">
					<font style="position:relative;font-size:13px;color:#333;left:-56;top:-3;">등록</font>
				</i>
		</div>
		</form>
	</div>

	<script src="resources/jqlib/custom-file-input.js"></script>
	
	<!-- 동물병원 찾기 -->
	<div id="mask"></div>
	<div id="findHospital_form">
		<!-- 검색 창 -->
		<div style="width:100%;height:150px;">
			<div style="position:relative; top:20; width:230px;height:20px;margin:0 auto;font-size:30px;font-family: 'Do Hyeon', sans-serif;font-weight:bold;color:#333;">FIND HOSPITAL</div>
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
				<div id="map1" style="width:450px;height:450px;margin:25px 22.5px;border-radius:10px;"></div>
			</div>
			<script src="resources/jqlib/custom-file-input.js"></script>
		</div>
	</div>
</body>
</html>