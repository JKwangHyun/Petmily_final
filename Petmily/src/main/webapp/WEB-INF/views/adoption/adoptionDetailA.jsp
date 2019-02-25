<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f264b44d614a364c2551241f9596ac9d&libraries=services,clusterer,drawing"></script>
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	/*  댓글 input style  */
	:root {
  background: #f5f6fa;
  color: #9c9c9c;
  font: 1rem "PT Sans", sans-serif;
}

.container {
  height: 100%;
}

a {
  color: inherit;
}
a:hover {
  color: #7f8ff4;
}

.container {
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.uppercase {
  text-transform: uppercase;
}

.btn {
  display: inline-block;
  background: transparent;
  color: inherit;
  font: inherit;
  border: 0;
  outline: 0;
  padding: 0;
  transition: all 200ms ease-in;
  cursor: pointer;
}
.btn--primary {
  background: #7f8ff4;
  color: #fff;
  box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1);
  border-radius: 2px;
  padding: 12px 36px;
}
.btn--primary:hover {
  background: #6c7ff2;
}
.btn--primary:active {
  background: #7f8ff4;
  box-shadow: inset 0 0 10px 2px rgba(0, 0, 0, 0.2);
}
.btn--inside {
  margin-left: -96px;
}

.form__field {
  width: 360px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}
</style>
<script>
	
$(document).ready(function(){
	// 지도
	
		var address = $('#address').val();
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
	
</script>
<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
<body>
	<div style="width:800px;height:1000px;">
      <div style="position:relative;top:30px;width:100%;height:50px;background-color:#F8F8F8;color:#333;font-weight:bold;font-size:20px;z-index:9999;text-align:center;">${detail.TITLE}</div>
      <!-- 사진 -->
      <div style="position:relative;width:100%;height:400px;;background-color:#F8F8F8;">
      	<div style="position:relative;top:30px;left:38px;width:400px;height:350px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
      	<div style="position:absolute;top:30px;left:450px;width:150px;height:170px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
		<div style="position:absolute;top:30px;left:610px;width:150px;height:170px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
		<div style="position:absolute;top:210px;left:450px;width:150px;height:170px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
		<div style="position:absolute;top:210px;left:610px;width:150px;height:170px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
      </div> 
      <!-- 경계선 -->
      <div style="position:relative;width:90%;height:3px;left:40px;background-color:#f0efef;"></div>
      
      <div style="position:relative;width:100%;height:550px">
          <!-- 댓글 -->
         <div style="position:relative;float:left;width:55%;height:550px;background-color:#F8F8F8;">
				<div class="container">
					<div style="position:relative;top:10px;left:40px;text-align:left;color:gray;font-weight:bold;">Commets</div>
					<!-- 댓글 입력창 -->
					<div class="container__item" style="position:relative;top:30px;">
						<form class="form">
							<input type="text" class="form__field" placeholder="댓글 쓰기" />
							<button type="button" class="btn btn--primary btn--inside uppercase">등록</button>
						</form>
					</div>
					<!-- 댓글 -->
					<div style="position:relative;top:60px;left:30px;">
					  <div>
						<div style="position:relative;border-radius:50%;border:2px solid #333; width:40px;height:40px;background-image:url('resources/img/cat1.jpg');background-size:cover;"></div>
						<div style="position:relative;top:-50px;left:70px;width:200px;text-align:left;color:#333;font-weight:bold;">yoon98</div>
						<div style="position:relative;top:-40px;left:70px;width:300px;text-align:left;color:gray;font-weight:bold;">아아아아아아</div>
						<div style="position:relative;top:-30px;left:70px;width:200px;text-align:left;">2019/02/10</div>
					  </div>
					  <div>
						<div style="position:relative;border-radius:50%;border:2px solid #333; width:40px;height:40px;background-image:url('resources/img/dog3.jpg');background-size:cover;"></div>
						<div style="position:relative;top:-50px;left:70px;width:200px;text-align:left;color:#333;font-weight:bold;">JiYoon</div>
						<div style="position:relative;top:-40px;left:70px;width:300px;text-align:left;color:gray;font-weight:bold;">아아아아아아</div>
						<div style="position:relative;top:-30px;left:70px;width:200px;text-align:left;">2019/02/11</div>
					  </div>
					  <div>
						<div style="position:relative;border-radius:50%;border:2px solid #333; width:40px;height:40px;background-image:url('resources/img/dog2.jpg');background-size:cover;"></div>
						<div style="position:relative;top:-50px;left:70px;width:200px;text-align:left;color:#333;font-weight:bold;">지윤</div>
						<div style="position:relative;top:-40px;left:70px;width:300px;text-align:left;color:gray;font-weight:bold;">아아아아아아</div>
						<div style="position:relative;top:-30px;left:70px;width:200px;text-align:left;">2019/02/11</div>
					  </div>
					</div>
				</div>
				<!-- 경계선 -->
            <div style="position:absolute; width:3px;height:490px;right:0;margin:30px 0;background-color:#f0efef;border:2px;"></div>
         </div>
         <div style="position:relative;float:right;width:45%;height:550px;">
             <!-- 상세 정보 -->
             <div style="position:relative;width:100%;height:40%;background-color:#F8F8F8;">
             	<div style="position:relative;top:10px;left:10px;text-align:left;color:gray;font-weight:bold;">Details</div>
             	<div style="position:relative;top:30px;left:10px;">
             	<div style="position:relative;color:#333;">품종: ${detail.PETKIND}</div>
             	<div style="position:relative;top:20px;color:#333;">성별: ${detail.PETGENDER}</div>
             	<div style="position:relative;top:40px;color:#333;">나이: ${detail.PETAGE}</div>
             	<div style="position:relative;top:70px;color:#333;">
             	<i class="far fa-clock" style="color:#da532c;"></i>&nbsp;${detail.PDATE}
             	<i class="far fa-eye"style="position:relative;left:10px;color:#da532c;"></i>&nbsp;&nbsp;&nbsp;${detail.CNT}
             	<i class="far fa-heart" style="position:relative;left:10px;color:#eea29a;"></i>&nbsp;&nbsp;&nbsp;${detail.RESERVE}
             	</div>
             	</div>
                <!-- 경계선 -->
                <div style="position:absolute; width:310px;height:3px;bottom:0;margin:0 20px;background-color:#f0efef;border:2px;"></div>
             </div>
             <!-- 지도 -->
             <div style="position:relative;width:100%;height:60%;background-color:#F8F8F8;">
             	<div style="position:relative;top:10px;left:10px;text-align:left;color:gray;font-weight:bold;">Location</div>
             		<input id="address" value="${detail.ADDRESS}" type="text" style="display:none;">
             	<div id="map" style="position:relative;top:27px;left:10px;width:320px;height:250px;border-radius:10px;"></div>
             </div>
         </div>
      </div>
   </div>
</body>
</html>