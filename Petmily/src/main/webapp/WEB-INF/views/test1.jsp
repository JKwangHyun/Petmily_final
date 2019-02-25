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
<title>Test1</title>
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
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
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;
	}
	.petlist2 a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.container {
        display: block;
		position: absolute;
        text-align: center;
        width: 100%;
        top: 50%;
        padding: 50px 0;
        -moz-transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        -o-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        
	}
	.search-box-container {
	  display: inline-block;
	  box-sizing: content-box;
	  height: 40px;
	  width: 40px;
	  padding: 0;
	  background-color: #fff;
	  border: 3px solid #5c5c5b;
	  border-radius: 28px;
	  overflow: hidden;
	}
	.search-box-container * {
	  display: inline-block;
	  margin: 0;
	  height: 100%;
	  padding: 5px;
	  border: 0;
	  outline: none;
	}
	.search-box {
	  width: calc(100% - 50px);
	  padding: 0 20px;
	  float: left;
	  font-family: "Lato";
	  font-size: 1em;
	  color: #333;
	  background-color: #fff;
	}
	.submit {
	  float: right;
	  width: 50px;
	  left: 0;
	  top: 0;
	  font-size: 1.2em;
	  text-align: center;
	  cursor: pointer;
	  background-color: #fff;
	}
	.fa {
	  display: inline !important;
	  line-height: 100%;
	  pointer-event: none;
	  color: #5c5c5b;
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
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
	.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
	#square_menu a{
		text-decoration:none;
		color:white;
	}
	
	/* 로그인 팝업창 */
	#signIn_popup {
		width:550px;
		height:400px; 
		background:#f0efef; 
		border: 0px solid black; 
		border-radius:20px;
		position:fixed; top:50%; left:46%; margin:-250px 0 0 -200px; z-index:9999; display:none;
		-webkit-animation-name: animatetop;
  		-webkit-animation-duration: 0.4s;
  		animation-name: animatetop_signIn;
  		animation-duration: 0.4s
	}
	
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
	#signIn_close {z-index:9999;color:#333;font-size:20px;position: absolute;right:10; top:10;cursor:pointer;}
	#findId_close {z-index:9999;color:#333;font-size:20px;position: absolute;right:10; top:10;cursor:pointer;}
	#findPw_close {z-index:9999;color:#333;font-size:20px;position: absolute;right:10; top:10;cursor:pointer;}
	
	@-webkit-keyframes animatetop_signIn {
		from {top:-300px; opacity:0} 
 		to {top:50%; opacity:1}
	}
	@keyframes animatetop_signIn {
		from {top:-300px; opacity:0}
		to {top:50%; opacity:1}
	}
	@keyframes animatetop_signUp_check {
		from {left:45%;opacity:1}
		to {left:100%; opacity:0}
	}
	@keyframes animatetop_signUp_Form {
		from {left:-300px;opacity:0}
		to {left:46%; opacity:1}
	}
	/* 회원가입 팝업 */
	#signUp_wrap {width:600px; height:800px; background:#f0efef; border: 0px solid black; border-radius:20px;position:fixed; top:35%; left:45%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	#signUp_wrap1 {width:600px; height:800px; background:#f0efef; border: 0px solid black; border-radius:20px;position:fixed; top:35%; left:45%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop_signUp_Form;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop_signUp_Form;
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
	
	/* 아이디찾기 팝업 */
	#findId_popup {
		width:550px;
		height:400px; 
		background:#f0efef; 
		border: 0px solid black; 
		border-radius:20px;
		position:fixed; top:50%; left:46%; margin:-250px 0 0 -200px; z-index:9999; display:none;
		-webkit-animation-name: animatetop;
  		-webkit-animation-duration: 0.4s;
  		animation-name: animatetop_signUp_Form;
  		animation-duration: 0.4s
	}
	
	/* 비밀번호찾기 팝업 */
	#findPw_popup {
		width:550px;
		height:400px; 
		background:#f0efef; 
		border: 0px solid black; 
		border-radius:20px;
		position:fixed; top:50%; left:46%; margin:-250px 0 0 -200px; z-index:9999; display:none;
		-webkit-animation-name: animatetop;
  		-webkit-animation-duration: 0.4s;
  		animation-name: animatetop_signUp_Form;
  		animation-duration: 0.4s
	}
	
	@keyframes animatetop_findHospital {
		from {top:-300px; opacity:0}
		to {top:45%; opacity:1}
	}
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
	
	#adoptionDetail {width:800px; height:1000px; background:#F8F8F8; border: 0px solid black; border-radius:20px;position:absolute ; top:35%; left:40%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	
	#hospitalList_container::-webkit-scrollbar {
    	width: .4em;
	}
 
	#hospitalList_container::-webkit-scrollbar-track {
	}
 
	#hospitalList_container::-webkit-scrollbar-thumb {
  		background-color: darkgrey;
  		outline: 1px solid slategrey;
 		border-radius:10px;
	}
</style>
<script>
	$.fn.toggleState = function (b) {
		$(this).stop().animate(
		{
			width: b ? "400px" : "40px" },
		    600,"easeOutElastic");
	};
	
	$(document).ready(function () {
		var container = $(".container");
		var boxContainer = $(".search-box-container");
		var submit = $(".submit");
		var searchBox = $(".search-box");
		var response = $(".response");
		var isOpen = false;
		
		submit.on("mousedown", function (e) {
			e.preventDefault();
			boxContainer.toggleState(!isOpen);
			isOpen = !isOpen;
			if (!isOpen) {
				handleRequest();
			} else {
				searchBox.focus();
			}
		});
		searchBox.keypress(function (e) {
			if (e.which === 13) {
				boxContainer.toggleState(false);
				isOpen = false;
				handleRequest();
			}
		});
		searchBox.blur(function () {
			boxContainer.toggleState(false);
			isOpen = false;
		});
		function handleRequest() {
			var value = searchBox.val();
			searchBox.val("");
			if (value.length > 0) {
				response.text('Searching for "' + value + '" . . .');
				response.
				animate(
				{
					opacity: 1 },
				300).
				delay(2000).
				animate(
				{
					opacity: 0 },
				300);
			}
		}
		
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
		
		// 네모 menu
		$("#square,#square_back,#square_menu").mouseover(function() {
			$("#square_back").css("display","block");
			$("#square_menu").css("display","block");
			$("#square").css("color","white");
		});
		$("#square,#square_back,#square_menu").mouseout(function() {
			$("#square_back").css("display","none");
			$("#square_menu").css("display","none");
			$("#square").css("color","gray");
		});
		
		// menu 선택 시 
		$("#dog").mouseover(function() {
			$("#dog").css("font-weight","bold");
		});
		$("#dog").mouseout(function() {
			$("#dog").css("font-weight","normal");
		});
		$("#cat").mouseover(function() {
			$("#cat").css("font-weight","bold");
		});
		$("#cat").mouseout(function() {
			$("#cat").css("font-weight","normal");
		});
		$("#other").mouseover(function() {
			$("#other").css("font-weight","bold");
		});
		$("#other").mouseout(function() {
			$("#other").css("font-weight","normal");
		});
		
		// 로그인 팝업창
		$("#signIn").click(function(){
			$("#signIn_popup").css("display", "block");
			$("#signIn_popup").css("animation-name","animatetop_signIn");
			$("#signIn_popup").css("animation-duration","0.4s");
			$("#mask").css("display", "block");
		}); 
		$("#signIn_close").click(function(){ 
			$("#signIn_popup").css("display", "none"); 
			$("#mask").css("display", "none");
			$('#signIn_form')[0].reset();
		}); 
		$("#findId_close").click(function(){ 
			$("#findId_popup").css("display", "none"); 
			$("#mask").css("display", "none"); 
			$('#findId_form')[0].reset();
		});
		$("#findPw_close").click(function(){ 
			$("#findPw_popup").css("display", "none"); 
			$("#mask").css("display", "none");
			$('#findPw_form')[0].reset();
		});
		
		// 회원가입 팝업창
		$("#signUp").click(function(){ 
			$("#signUp_wrap").css("display", "block"); 
			$("#mask").css("display", "block"); 
		}); 
		$("#signUp_close").click(function(){ 
			$("#signUp_wrap").css("display", "none"); 
			$("#mask").css("display", "none"); 
		});
		$("#signUp_close1").click(function(){ 
			$("#signUp_wrap1").css("display", "none"); 
			$("#mask").css("display", "none"); 
		}); 
		
		// check 
		$(function() {
			$("#checkall").change(function() {
			// 전체선택 체크박스의 체크상태 판별
				var is_check = $(this).is(":checked");
			// 하위 체크박스에 체크상태 적용
				$(".check123").prop("checked", is_check);
			});
			$(".check123").change(function() {
			// 전체선택 체크박스의 체크상태 판별
				$("#checkall").prop("checked", false);
			});
		});
		
		// gendercheck
		$('input[type="checkbox"][name="gender"]').click(function(){
			if($(this).prop('checked')) {
				$('input[type="checkbox"][name="gender"]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		// expcheck
		$('input[type="checkbox"][name="exp"]').click(function(){
			if($(this).prop('checked')) {
				$('input[type="checkbox"][name="exp"]').prop('checked', false);
				$(this).prop('checked', true);
			}
			if($('input:checkbox[id="yes"]').is(":checked")==true) {
				$('#expArea').html('');
				$("#exp").css("display","grid");
			}
			else if($('input:checkbox[id="no"]').is(":checked")==true) {
				$('#expArea').html('');
				$("#exp").css("display","none");
			}
			else $("#exp").css("display","none");
		});

		// 화면
		$(window).resize(function() {
			if($(window).width() > 1400) {
				$("#content2_container").css("width","1060px");
				$("#content3").css("height","750px");
				$("#petList_container").css("width","1080px");
				$("#petList_container").css("height","750px");
			}
			else if($(window).width() < 1100) {
				$("#content2_container").css("width","510px");
				$("#content3").css("height","1500px");
				$("#petList_container").css("width","540px");
				$("#petList_container").css("height","1500px");
			}
			else if($(window).width() < 1400) {
				$("#content2_container").css("width","790px");
				$("#content3").css("height","1100px");
				$("#petList_container").css("width","820px");
				$("#petList_container").css("height","1100px");
			}
		});
		
		// 회원가입 focusout
		$('#id').focusout(function(){
			var id= $('#id').val();
			if(id.length=='') {
				$('#idArea').html('아이디를 입력하세요.');
				return;
			}
			else if(id.length<4 || id.replace(/[a-z.0-9]/g,'').length>0) {
				$('#idArea').html('4자 이상 영문,숫자만 입력 가능합니다.');
				return;
			}$('#idArea').html('');
			$.ajax({
				type : 'Post',
				url : "idcheck",
				data : {
					id : $('#id').val(),
				},
				success : function(result) {
					$('#idcheck').html(result)
				}
			});
		}); // focusout
		
		$('#pw').focusout(function(){
			var pw= $('#pw').val();
			if(pw.length=='') {
				$('#pwArea1').html('비밀번호를 입력하세요. ');
				return;
			}else $('#pwArea1').html('');
			if(pw.length<4 || pw.replace(/[a-z.0-9]/g,'').length>0) {
				$('#pwArea1').html('4자 이상 영문,숫자만 입력 가능합니다.');
				return;
			}else $('#pwArea1').html('');
		});
		$('#pwcheck').focusout(function(){
			var pw= $('#pw').val();
			var pwcheck= $('#pwcheck').val();
			if(pw.length=='') {
				$('#pwArea1').html('비밀번호를 입력하세요. ');
				return;
			}else $('#pwArea1').html('');
			if(pw.length<4 || pw.replace(/[a-z.0-9]/g,'').length>0) {
				$('#pwArea1').html('4자 이상 영문,숫자만 입력 가능합니다.');
				return;
			}else $('#pwArea1').html('');
			if(pw == pwcheck) {
				$('#pwArea2').html('<i style="color:#7CBB00;" class="fas fa-check"></i>');
				return;
			}else if(pw != pwcheck) {
				$('#pwArea2').html('<i style="color:#da532c;" class="fas fa-times"></i>');
				return;
			}
		});
		$('#name').focusout(function(){
			var name= $('#name').val();
			if(name.length=='') {
				$('#nameArea').html('이름을 입력하세요. ');
				return;
			}else $('#nameArea').html('');
			if(name.replace(/[가-힣.a-z]/g,'').length>0) {
				$('#nameArea').html('한글,영어만 사용 가능합니다.');
				return;
			}else $('#nameArea').html('');
		});
		$('#bday').focusout(function(){
			var bday=$('#bday').val();
			if(bday.length != 6) {
				$('#bdayArea').html('생년월일 6자리를 정확히 입력하세요.');
				return;
			}else $('#bdayArea').html('');
		});
		$('#hp1').focusout(function(){
			var hp1=$('#hp1').val();
			
			if(hp1.length != 3) {
				$('#phnumArea').html('전화번호를 정확히 입력하세요.');
				return;
			}else $('#phnumArea').html('');
		});
		$('#hp2').focusout(function(){
			var hp2=$('#hp2').val();
			
			if(hp2.length != 4) {
				$('#phnumArea').html('전화번호를 정확히 입력하세요.');
				return;
			}else $('#phnumArea').html('');
		});
		$('#hp3').focusout(function(){
			var hp3=$('#hp3').val();
			
			if(hp3.length != 4) {
				$('#phnumArea').html('전화번호를 정확히 입력하세요.');
				return;
			}else $('#phnumArea').html('');
		});
		$('#pets').focusout(function(){
			var detail1=$('#pets').val();
			if(detail1.length=='') {
				$('#expDetailArea').html('상세 경험을 입력해 주세요.');
				return;
			}else $('#expDetailArea').html('');
		});
		$('#period').focusout(function(){
			var detail2=$('#period').val();
			if(detail2.length=='') {
				$('#expDetailArea').html('상세 경험을 입력해 주세요.');
				return;
			}else $('#expDetailArea').html('');
		});
		// registration 클릭 시
		$('#li_registration').click(function(){
			if(${Login.id==null}) {
				alert('로그인을 해주세요.');
				return;
			}else if(${Login.id!=null}) location.href="registration";
		});
		
		// Find Pet Hospital
		$('#FindHospital').click(function(){
			$('#findHospital_form').css('display','block');
			$('#mask').css('display','block');
		});
	});
	
	// check 알림
	function nextB() {
		if($('input:checkbox[id="check1"]').is(":checked")==false 
				|| $('input:checkbox[id="check2"]').is(":checked")==false) {
			$('#signUp_check').html('<i class="fas fa-exclamation-circle"></i>'+' 필수 check를 해주세요.');
			return;
		}
		
		if($('input:checkbox[id="check1"]').is(":checked")==true && 
				$('input:checkbox[id="check2"]').is(":checked")==true) {
			$('#signUp_check').html('');
			$("#signUp_wrap").css("animation-name","animatetop_signUp_check");
			$("#signUp_wrap").css("animation-duration","0.4s");
			$("#signUp_wrap1").css("display", "block"); 
			setTimeout(function() {
				$("#signUp_wrap").css("display", "none")
				}, 400);
		}
	}
	
	// 로그인
	function login() {
		var id=$('#logid').val();
		var pw=$('#logpw').val();
		if (id.length<1) {
			$('#logincheck').html('아이디를 입력해주세요.');
			return; 
		}
		if (pw.length<1) {
			$('#logincheck').html('비밀번호를 입력해주세요.');
			return;
		}
		$.ajax({
			type : "Post",
			url : "login",
			data:{
				 id: $("#logid").val(), 
				 pw:$("#logpw").val(), 	
			},
			success : function(result) {
					$("#logincheck").html(result);
			}
		});
		$('#logincheck').html('');
	}
	
	//회원가입
	function joincheck() {
		var id= $('#id').val();
		var pw= $('#pw').val();
		var pwcheck= $('#pwcheck').val();
		var name= $('#name').val();
		var bday=$('#bday').val();
		var hp1=$('#pnum1').val();
		var hp2=$('#pnum2').val();
		var hp3=$('#pnum3').val();
		var detail1=$('#pets').val();
		var detail2=$('#period').val();
		
		if(id.length=='') {
			$('#idArea').html('아이디를 입력하세요.');$('#idArea').html('4자 이상 영문,숫자만 입력 가능합니다.');
			return;
		}
		else if(id.length<4 || id.replace(/[a-z.0-9]/g,'').length>0) {
			$('#idArea').html('4자 이상 영문,숫자만 입력 가능합니다.');
			return;
		} else $('#idArea').html('');
		
		if(pw.length=='') {
			$('#pwArea1').html('비밀번호를 입력하세요. ');
			return;
		}
		else if(pw.length<4 || pw.replace(/[a-z.0-9]/g,'').length>0) {
			$('#pwArea1').html('5자 이상 영문,숫자만 입력 가능합니다.');
			return;
		}else $('#pwArea1').html('');
		
		if(pwcheck.length=='' || (pw != pwcheck)) {
			$('#pwArea2').html('<i class="fas fa-times" style="color:#da532c;"></i>');
			return;
		}else $('#pwArea2').html('<i class="fas fa-check" style="color:#7CBB00;"></i>');
		
		if(name.length=='') {
			$('#nameArea').html('이름을 입력하세요. ');
			return;
		}
		else if(name.replace(/[가-힣.a-z]/g,'').length>0) {
			$('#nameArea').html('한글,영어만 사용 가능합니다.');
			return;
		}else $('#nameArea').html('');
		
		if($('input:checkbox[id="checkM"]').is(":checked")==false 
				&& $('input:checkbox[id="checkF"]').is(":checked")==false) {
			$('#genderArea').html('성별을 선택하세요. ');
			return;
		}else $('#genderArea').html('');
		if(bday.length != 6) {
			$('#bdayArea').html('생년월일 6자리를 정확히 입력하세요.');
			return;
		}else $('#bdayArea').html('');
		
		if((hp1.length != 3)||(hp2.length != 4)||(hp3.length != 4)) {
			$('#phnumArea').html('전화번호를 정확히 입력하세요.');
			return;
		}else $('#phnumArea').html('');
		
		if($('input:checkbox[id="yes"]').is(":checked")==false 
				&& $('input:checkbox[id="no"]').is(":checked")==false) {
			$('#expArea').html('애완동물 키워본 경험을 선택하세요.');
			return;
		}else $('#expArea').html('');
		
		if((detail1=='')||(detail2=='')) {
			$('#expDetailArea').html('상세 경험을 입력해 주세요.');
			return;
		}else $('#expDetailArea').html('');
		
		$('#signUp_form').submit();
	}
	
	//핸드폰 번호,생년월일 숫자 입력 제한
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
	    	object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	// 아이디찾기 팝업창
	function findid(){
		$("#findId_popup").css("display","block");
		$("#findId_popup").css("animation-name","animatetop_signUp_Form");
		$("#findId_popup").css("animation-duration","0.4s");
		if($("#findPw_popup").css("display")=="block"){
			$("#findPw_popup").css("animation-name","animatetop_signUp_check");
			$("#findPw_popup").css("animation-duration","0.4s");
			$("#findPw_form")[0].reset();
			setTimeout(function() {
				$("#findPw_popup").css("display", "none")
				}, 400);
		}else{
			$("#signIn_popup").css("animation-name","animatetop_signUp_check");
			$("#signIn_popup").css("animation-duration","0.4s");
			$("#signIn_form")[0].reset();
			setTimeout(function() {
				$("#signIn_popup").css("display", "none")
				}, 400);
		}
	}
	
	// 비번찾기 팝업창
	function findpw(){
		$("#findPw_popup").css("display","block");
		$("#findPw_popup").css("animation-name","animatetop_signUp_Form");
		$("#findPw_popup").css("animation-duration","0.4s");
		if($("#findId_popup").css("display")=="block"){
			$("#findId_popup").css("animation-name","animatetop_signUp_check");
			$("#findId_popup").css("animation-duration","0.4s");
			$("#findId_form")[0].reset();
			setTimeout(function() {
				$("#findId_popup").css("display", "none")
				}, 400);
		}else {
			$("#signIn_popup").css("animation-name","animatetop_signUp_check");
			$("#signIn_popup").css("animation-duration","0.4s");
			$("#signIn_form")[0].reset();
			setTimeout(function() {
				$("#signIn_popup").css("display", "none")
				}, 400);
		}
	}
	
	// 로그인 팝업창
	function loginform() {
		if($("#findId_popup").css("display")=="block"){
			$("#signIn_popup").css("display","block");
			$("#signIn_popup").css("animation-name","animatetop_signUp_Form");
			$("#signIn_popup").css("animation-duration","0.4s");
			$("#findId_popup").css("animation-name","animatetop_signUp_check");
			$("#findId_popup").css("animation-duration","0.4s");
			$("#findId_form")[0].reset();
			setTimeout(function() {
				$("#findId_popup").css("display", "none")
				}, 400);
		}
		else if($("#findPw_popup").css("display")=="block"){
			$("#signIn_popup").css("display","block");
			$("#signIn_popup").css("animation-name","animatetop_signUp_Form");
			$("#signIn_popup").css("animation-duration","0.4s");
			$("#findPw_popup").css("animation-name","animatetop_signUp_check");
			$("#findPw_popup").css("animation-duration","0.4s");
			$("#findPw_form")[0].reset();
			setTimeout(function() {
				$("#findPw_popup").css("display", "none")
				}, 400);
		}
	}
	
	// findID
	function findId() {
		var name=$('#findname').val();
		var bday=$('#findbday').val();
		
		if(name.length=='') {
			$('#findId').html('이름을 입력하세요. ');
			return;
		}
		else if(name.replace(/[가-힣.a-z]/g,'').length>0) {
			$('#findId').html('한글,영어만 사용 가능합니다.');
			return;
		}
		if(bday.length != 6) {
			$('#findId').html('생년월일 6자리를 정확히 입력하세요.');
			return;
		}
		$.ajax({
			type : "Post",
			url : "findID",
			data:{
				name:$('#findname').val(),
				bday:$('#findbday').val(),
			},
			success : function(result) {
					$("#findId").html(result);
			}
		});
	}
	
	// findPW
	function findPw() {
		var id=$('#findid2').val();
		var name=$('#findname2').val();
		
		if(id.length=='') {
			$('#findPw').html('아이디를 입력하세요.');
			return;
		}
		else if(id.length<4 || id.replace(/[a-z.0-9]/g,'').length>0) {
			$('#findPw').html('4자 이상 영문,숫자만 입력 가능합니다.');
			return;
		}
		if(name.length=='') {
			$('#findPw').html('이름을 입력하세요. ');
			return;
		}
		else if(name.replace(/[가-힣.a-z]/g,'').length>0) {
			$('#findPw').html('한글,영어만 사용 가능합니다.');
			return;
		}
		$.ajax({
			type : "Post",
			url : "findPW",
			data:{
				id:$('#findid2').val(),
				name:$('#findname2').val(),
			},
			success : function(result) {
					$("#findPw_form").html(result);
			}
		});
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
	
	<!-- 중앙 화면 -->
	<div id="content1" style="position:relative;width:100%;height:480px;">
		<div id="content1_container" style="position:relative;margin:0 auto; width:1200px;height:480px;">
			<div style="position:relative;float:left;width:800px;height:100%;">
				<div style="position:relative;display:block; top:100;left:50">
					<img src="resources/img/22.png" width="550px">
				</div>
				<div style="position:relative;top:150;left:80;">
	               <input type="button" value="Sign Up" style="padding:10px 25px;border:none; border-radius:10px;color:white;font-size:20px;font-weight:bold;background-color:#333">
	               <input type="button" value="Adoption" style="margin-left: 30px;padding:10px 25px;border:none;border-radius:10px;color:white;font-size:20px;font-weight:bold;background-color:#333">
	            </div>
			</div>
			<div style="position:relative;float:left;width:400px;height:100%;">
				<iframe src="https://giphy.com/embed/8UHB9thDBfbOTaRJNn" width="280px" height="280px" style="position:absolute;pointer-events:none;cursor:default;top:100px;left:80px;" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
			</div>
		</div>
	</div>
	
	<!-- 검색창, 네모 메뉴 -->
	<div id="content2" style="position:relative;width:100%;height:50px;background-color:#F7F7F7;margin:0 auto;">
    	<div id="content2_container" style="position:relative;width:1060px;height:50px;margin:0 auto">
	    	<div class="container">
			    <div class="search-box-container">
				    <button class="submit"><i class="fa fa-search" style="padding-left: 15px;"></i></button>
				    <input class="search-box">
			    </div>
	    	</div>
	    	<div id="square_back" style="position:absolute;width:50px;height:40px;right:-10;margin-top:5px;background-color:#333;border-top-left-radius:5px;border-bottom-left-radius:5px;display:none;opacity:0.5"></div>
	    	<div id="square_menu" style="position:absolute;z-index:10;margin-top:5px;right:-160;width:150px;height:250px;background-color:#333;border-bottom-left-radius:5px;border-top-right-radius:5px;border-bottom-right-radius:5px;display:none;opacity:0.5">
	    		<div style="width:150px;height:50px;text-align:center;color:white;font-size:20;pointer-events:none;cursor:default;margin-top:8px;">Select</div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="adoptionList" id="all"><i class="fas fa-th-list"></i> All</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="adoptionList?PETTYPE=1" id="dog"><i class="fas fa-dog"></i> Dogs</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="adoptionList?PETTYPE=2" id="cat"><i class="fas fa-cat"></i> Cats</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="adoptionList?PETTYPE=3" id="other"><i class="fas fa-paw"></i> Others</a></div>
	    	</div>
	    	<i id="square" class="fas fa-th-large" style="position:absolute;right:0;margin-top:11px;font-size:30px;color:gray"></i>
   		</div>
	</div>

	<!-- 분양 리스트 -->
	<div id="content3" style="position:relative;width:100%;height:750px;background-color:#f0efef;">
		<div id="petList_container" style="position:relative;width:1080px;height:750px;margin:0 auto">
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
	<!-- 로그인 팝업창 -->
	<div id="mask"></div>
	<div id="signIn_popup">
		<form id="signIn_form" method="post" autocomplete="off">
	  		<h1 style="pointer-events:none;cursor:default;">Sign In</h1>
	  		<div class="question">
	    		<input type="text" id="logid" name="id" required/>
	    		<label>UserID</label>
	  		</div>
	 		<div class="question">
	    		<input type="password" id="logpw" name="pw" required/>
	   			<label>Password</label>
	  		</div>
	  		<div id="logincheck" style="position:relative;top:10px;text-align:center;color:#da532c;font-family:'Nanum Square';font-weight: bold;"></div>
	  		<input type="button" value="Login" onclick="login()" style="outline:none;margin-top:25px;font-family:'Nanum Square';font-weight:bold;">
	  		<i id="findid" class="fas fa-user" onclick="findid()" style="margin-left:170px;cursor:pointer;color:#333;"> Find ID</i>
	  		<i id="findpw" class="fas fa-key" onclick="findpw()" style="margin-left:20px;cursor:pointer;color:#333;"> Find PW</i>
		</form>
		<i id="signIn_close" class="fas fa-sign-out-alt"></i>
	</div>
	
	<!-- 아이디 찾기 팝업창 -->
	<div id="findId_popup">
		<form id="findId_form" method="post" autocomplete="off">
	  		<h1 style="pointer-events:none;cursor:default;">Find ID</h1>
		  		
	  		<div class="question">
	    		<input type="text" id="findname" name="findname" required/>
	    		<label>UserName</label>
	  		</div>
	 		<div class="question">
	    		<input type="text" id="findbday" name="findbday" required/>
	   			<label>BirthDay</label>
	  		</div>
	  		<div id="findId" style="position:relative;top:10px;text-align:center;color:#da532c;font-family:'Nanum Square';font-weight: bold;"></div>
	  		<input type="button" value="FindID" onclick="findId()" style="outline:none;margin-top:25px;font-family:'Nanum Square';font-weight:bold;">
			<i class="fas fa-user" onclick="loginform()" style="margin-left:170px;cursor:pointer;color:#333;"> Login</i>
		  	<i class="fas fa-key" onclick="findpw()" style="margin-left:20px;cursor:pointer;color:#333;"> Find PW</i>
		</form>
		<i id="findId_close" class="fas fa-sign-out-alt"></i>
	</div>
	
	<!-- 비밀번호 찾기 팝업창 -->
	<div id="findPw_popup">
		<form id="findPw_form" method="post" action="newPW" autocomplete="off">
	  		<h1 style="pointer-events:none;cursor:default;">Find PW</h1>
	  		<div class="question">
	    		<input type="text" id="findid2" name="id" required/>
	    		<label>UserID</label>
	  		</div>
	 		<div class="question">
	    		<input type="text" id="findname2" name="name" required/>
	   			<label>UserName</label>
	  		</div>
	  		<div id="findPw" style="position:relative;top:10px;text-align:center;color:#da532c;font-family:'Nanum Square';font-weight: bold;"></div>
	  		<input type="button" value="FindPW" onclick="findPw()" style="outline:none;margin-top:25px;font-family:'Nanum Square';font-weight:bold;">
	  		<i class="fas fa-user" onclick="loginform()" style="margin-left:170px;cursor:pointer;color:#333;"> Login</i>
			<i class="fas fa-key" onclick="findid()" style="margin-left:20px;cursor:pointer;color:#333;"> Find ID</i>
		</form>
		<i id="findPw_close" class="fas fa-sign-out-alt"></i>
	</div>
	
	<!-- 이용약관 팝업창 -->
	<div id="signUp_wrap">
		<form id="joincheck" action="" style="margin-top:100px;text-align:center;">
			<div class="boxes" style="padding-left:100px;">
		  		<input type="checkbox" id="checkall" name="checkall" value="all" style="float:center;">
  				<label for="checkall" style="width:425px;"><font style="font-family: 'Nanum Square';font-weight:bold;color:#333;">이용약관,개인정보 수집 및 이용과 메일 수신에 <b style="color:#da532c;">모두</b> 동의합니다.</font></label>
		  	</div>
		  	<div style="margin-top:35px;">
			<textarea rows="7" cols="58" style="resize:none;border-radius:10px;background-color:#f0efef;">
Petmily 서비스를 이용해 주셔서 감사합니다. 
본 약관은 다양한 Petmily 서비스의 이용과 관련하여
Petmily 서비스를 제공하는 Petmily와 이를 이용하는 
Petmily 서비스 회원 또는 비회원과의 관계를 설명하며,
아울러 여러분의 Petmily 서비스 이용에 도움이 될 수 있는 
유익한 정보를 포함하고 있습니다.
			</textarea>
		  	</div>	
		  	<div class="boxes" style="padding-left:100px;margin-top:20px;">
		  		<input type="checkbox" id="check1" name="check1" class="check123" value="1">
  			 	<label for="check1" style="width:240px;left:100px;"><font style="font-family: 'Nanum Square';font-weight:bold;color:#333;">Petmily 이용 약관 동의<b style="color:#da532c;"> (필수)</b></font></label>
		  	</div>
		   	<div style="margin-top:30px;">
			<textarea rows="16" cols="58" style="resize:none;border-radius:10px;background-color:#f0efef;">
정보통신망법 규정에 따라 Petmily에 회원가입 신청하시는 분께 수집하는 개인정보의 항목,
개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색 등 대부분의 Petmily 서비스를 회원과 동일하게 이용할 수 있습니다.
이용자가 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우,Petmily는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디,비밀번호,이름,생년월일,가입인증 휴대전화번호’를 필수항목으로 수집합니다.
			</textarea>
		  	</div>
		  	<div class="boxes" style="padding-left:100px;margin-top:20px;">
		  		<input type="checkbox" id="check2" name="check2"class="check123" value="2">
  			 	<label for="check2" style="width:220px;left:100px;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">개인정보 수집 동의<b style="color:#da532c;"> (필수)</b></font></label>
		  	</div>
		  	<div class="boxes" style="padding-left:100px;margin-top:20px;">
		  		<input type="checkbox" id="check3" name="check3"class="check123" value="3">
  				<label for="check3" style="width:220px;left:100px;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">메일/문자 수신 동의<b style="color:gray"> (선택)</b></font></label>
		  	</div>
		  	<div class="buttonnn" style="margin-top:60px;">
		  		<button type="button" onclick="nextB()" style="outline:none;right:40;float:right;cursor:pointer;">NEXT&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></button>
		  		<button id="signUp_close" style="outline:none;left:40;float:left;cursor:pointer;"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;BACK</button>
		  	</div>
		  	<!-- 체크 검사 알림 -->
			<div id="signUp_check" style="position:relative;top:-40px;color:#da532c;font-family:'Nanum Square';font-weight: bold;"></div>
		</form>
	</div>
	
	<!-- 회원가입 팝업창 -->
	<div id="mask"></div>
	<div id="signUp_wrap1">
		<form id="signUp_form" action="memberjoin" autocomplete="off">
		 <div style="position:relative;top:100px;display: grid;">		
		  <label for="id" class="inp">
  		  	<input type="text" id="id" name="id" placeholder="&nbsp;">
  	      	<span class="label">아이디</span>
          	<span class="border"></span>
	      </label>
	      <div id="idArea" style="position:relative;top:10px;text-align:center;"></div>
	      <div id="idcheck" style="position:absolute;top:20px;left:450px;"></div>
	      
	      <label for="pw" class="inp" style="top:20px;">
  		  	<input type="password" id="pw" name="pw" placeholder="&nbsp;">
  	      	<span class="label">비밀번호</span>
          	<span class="border"></span>
	      </label>
	      <div id="pwArea1" style="position:relative;top:30px;text-align:center;"></div>
	      
	      <label for="pwcheck" class="inp" style="top:40px;">
  		  	<input type="password" id="pwcheck" name="pwcheck" placeholder="&nbsp;">
  	      	<span class="label">비밀번호 확인</span>
          	<span class="border"></span>
	      </label>
	      <div id="pwArea2" style="position:absolute;top:160px;left:450px;"></div>
	      
	      <label for="name" class="inp" style="top:60px;">
  		  	<input type="text" id="name" name="name" placeholder="&nbsp;">
  	      	<span class="label">이름</span>
          	<span class="border"></span>
	      </label>
	      <div id="nameArea" style="position:relative;top:70px;text-align:center;"></div>
	      </div>
	      
	      <div style="position:relative;top:100px;left:200px;">
		      <input type="checkbox" id="checkM" name="gender" value="M">
	  		  <label for="checkM" style="position:relative;top:80px;float:left;left:30px;"><font style="margin-left:20px;font-family:'Nanum Square';font-weight:bold;color:#333;">남성</font></label>
	  		  <input type="checkbox" id="checkF" name="gender" value="F">
	  		  <label for="checkF" style="position:relative;top:80px;left:110px;"><font style="margin-left:-20px;font-family:'Nanum Square';font-weight:bold;color:#333;">여성</font></label>
	      <div id="genderArea" style="position:relative;top:90px;left:30px;"></div>
	      </div>
	      
	      <div style="position:relative;top:180px;display: grid;">
	         <label for="bday" class="inp" style="top:20px;">
	             <input type="text" id="bday" name="bday" placeholder="&nbsp;" maxlength="6"oninput="maxLengthCheck(this)">
	              <span class="label">생년월일 (6자리)</span>
	             <span class="border"></span>
	         </label>
	       <div id="bdayArea" style="position:relative;top:30px;text-align:center;"></div>
	       
	         <label for="pnum1,pnum2,pnum3" class="inp" style="position:relative;top:40px;float:left;">
	             <input type="text" id="pnum1" name="hp1" placeholder="&nbsp;"maxlength="3" oninput="maxLengthCheck(this)" style="width:31.9%;">
	             <span class="label">(010)</span>
	             <span class="border" style="width:31.9%;"></span>
	             <input type="text" id="pnum2" name="hp2" placeholder="&nbsp;" maxlength="4" oninput="maxLengthCheck(this)"style="width:31.9%;">
	             <span class="label" style="left:97px;">0000</span>
	             <span class="border"style="width:31.9%;left:94.7px;"></span>
	             <input type="text" id="pnum3" name="hp3" placeholder="&nbsp;" maxlength="4" oninput="maxLengthCheck(this)"style="width:31.9%;">
	             <span class="label" style="left:192px;">0000</span>
	             <span class="border"style="width:31.9%;left:189.7px;"></span>
	         </label>
	         <div id="phnumArea" style="position:relative;top:50px;text-align:center;"></div>
	        </div>
	        
	        <div style="position:relative;top:250px;text-align:center;">
        		<div style="font-size:14px; font-family:'Nanum Square';font-weight:bold;color:#333;opacity:0.7;">애완동물 키워본 경험</div>
		        <input type="checkbox" id="yes" name="exp"value="Y">
		        <label for="yes" style="position:relative;top:10px;float:left;left:230px;"><font style="margin-left:20px;font-family:'Nanum Square';font-weight:bold;color:#333;">있음</font></label>
		        <input type="checkbox" id="no" name="exp"value="N">
		        <label for="no" style="position:relative;top:10px;left:310px;width: 63px;padding-left: 0px;"><font style="margin-left:-30px;font-family:'Nanum Square';font-weight:bold;color:#333;">없음</font></label>
		        <div id="expArea" style="position:relative;top:20px;text-align:center;"></div>
		    </div>
		    
		    <div id="exp" style="position:relative;top:280px;display:none;">
			    <label for="pets,period" class="inp" style="position:relative;top:0;float:left;">
			    <input type="text" id="pets" name="detail1" placeholder="&nbsp;" style="width:49%;z-index:10;">
			    <span class="label">애완동물 종류</span>
			    <span class="border" style="width:49%;"></span>
			    <input type="text" id="period" name="detail2" placeholder="&nbsp;" style="width:49%;">
			    <span class="label" style="left:145px;">기간</span>
			    <span class="border"style="width:49%;left:142.5px;"></span>
			    </label>
			    <div id="expDetailArea" style="position:relative;top:10;text-align:center;"></div>
		    </div>
		    
		    <div class="buttonnn" style="position:absolute; top:710px;width:600px;" >
			    <button onclick="joincheck()" type="button" style="outline:none;cursor:pointer;right:40;float:right;">NEXT&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></button>
			    <button id="signUp_close1" style="outline:none;cursor:pointer;left:40;float:left;"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;BACK</button>
		    </div>
		</form>
	</div>
	
	<!-- 상세보기 팝업창 -->
	<div id="adoptionDetail">
		<div id="detailForm">
		</div>
	</div>
	
	<!-- 동물병원 찾기 -->
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