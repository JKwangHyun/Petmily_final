<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
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
   #RElist::-webkit-scrollbar {
       width: .4em;
   }
 
   #Relist::-webkit-scrollbar-thumb {
        background-color: darkgrey;
        outline: 1px solid slategrey;
       border-radius:10px;
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
      
      $('#heart1').click(function() {
         $.ajax({
            type:"Post",
            url:"likeInsert",
            data:{
               id:'${Login.id}',
               root:${detail.ROOT},
            },
            success:function(result){
               $('#heart1').css('display','none');
               $('#fullHeart').css('display','block');
            }
         });
      });
      
      $('#fullHeart').click(function() {
         $.ajax({
            type:"Post",
            url:"likeDelete",
            data:{
               id:'${Login.id}',
               root:${detail.ROOT},
            },
            success:function(result){
               $('#heart1').css('display','block');
               $('#fullHeart').css('display','none');
            }
         });
         
      });
      
      
      <%session.getAttribute("Detail"); %> 
      /* 로그인 아이디 = 글 쓴 아이디 */
      if(${Login.id == Detail}) {
         $('#heart_div').css('display','none');
         $('#menu_div').css('display','block');
      }
      /* 로그인 아이디 != 글 쓴 아이디 */
      else {
         $('#menu_div').css('display','none');
         $('#heart_div').css('display','block');
         
      }
      
      $.ajax({
         type:'Post',
         url:"RElist",
         data:{
            root:${detail.ROOT},
         },
         success:function(result){
            $('#RElist').html(result)
         }
      });
      
      if(${likeCheck==null}){
         $('#heart1').css('display','block');
         $('#fullHeart').css('display','none');
      }else {
         $('#heart1').css('display','none');
         $('#fullHeart').css('display','block');
      }
});

   function adoptionDelete(n){
       if (confirm("글을 삭제하시겠습니까?")) {
            alert("정상적으로 처리 되었습니다.");
            location.href="adoptionDelete?seq="+n;
            return true;
         } else {
            return false;
         } 
   }
   
   
   
   function REinsert(r,s,i,id,img){
      $.ajax({
         type:'Post',
         url:"REinsert",
         data:{
            root:r,
            step:s,
            indent:i,
            id:id,
            content:$('.form__field').val(),
            myimage:img,
         },
         success:function(result){
            $('#RElist').html(result)
         }
      });
      $('.form_field').val('');
      
   }
   
   function complete(seq,complete){
      
      if (complete=='N'){        
          if(confirm("분양을 완료하시겠습니까?")==true){
          alert ('정상적으로 처리되었습니다.');
          location.href="cUpdate?seq="+seq;
          }else{
             return false;
          }
         }
      
   }
   
   
</script>
<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
<body>
   <div id="heart_div" style="position:absolute; top:20px;left:825px;width:100px;">
      <i id="heart1" class="far fa-heart" style="font-size:50px;color:#eea29a;"></i>
      <i id="fullHeart" class="fas fa-heart" style="font-size:50px;color:#eea29a;display:none;"></i>
   </div>
   <div id="menu_div" style="position:absolute; top:20px;left:825px;width:120px;height:170px;">
      <button type="button" onclick="adoptionDelete(${detail.SEQ})"style="outline:none;cursor:pointer;position:relative;top:20px;font-family: 'Do Hyeon', sans-serif;color:#F8F8F8;font-size:21px;background-color:none;background-color:inherit;border:none;"><i style="color:#da532c;font-size:21px;"class="fas fa-trash-alt"></i> 삭제하기</button><br>
      <button type="button" onclick="complete(${detail.SEQ},'${detail.COMPLETE}')"style="outline:none;cursor:pointer;position:relative;top:40px;font-family: 'Do Hyeon', sans-serif;color:#F8F8F8;font-size:21px;background-color:none;background-color:inherit;border:none;"><i style="color:#f0f0f0;font-size:21px;"class="far fa-calendar-check"></i> 분양 완료</button>
   </div>
      
   <div style="width:800px;height:1000px;">
      <div style="position:relative;top:30px;width:100%;height:50px;background-color:#F8F8F8;color:#333;font-weight:bold;font-size:20px;z-index:9999;text-align:center;">${detail.TITLE}</div>
      <!-- 사진 -->
      <div style="position:relative;width:100%;height:400px;;background-color:#F8F8F8;">
      <div style="position:relative;top:30px;left:38px;width:400px;height:350px;background-image:url('${detail.MAINIMG}');background-size:cover;"></div>
      <div id="sub0" style="position:absolute;top:30px;left:450px;width:150px;height:170px;background-size:cover;background-color:#fff;text-align:center;padding-top:80px;"><font id="img0">NO IMAGE</font></div>
      <div id="sub1" style="position:absolute;top:30px;left:610px;width:150px;height:170px;background-size:cover;background-color:#fff;text-align:center;padding-top:80px;"><font id="img1">NO IMAGE</font></div>
      <div id="sub2" style="position:absolute;top:210px;left:450px;width:150px;height:170px;background-size:cover;background-color:#fff;text-align:center;padding-top:80px;"><font id="img2">NO IMAGE</font></div>
      <div id="sub3" style="position:absolute;top:210px;left:610px;width:150px;height:170px;background-size:cover;background-color:#fff;text-align:center;padding-top:80px;"><font id="img3">NO IMAGE</font></div>
      </div> 
       <script>
         $(document).ready(function () {
            var subImgSplit = '${detail.SUBIMG}'.split(',');
            for(var i in subImgSplit) {
               $('#sub'+i).css('background-image','url("'+subImgSplit[i]+'")');
               $('#img'+i).css('display','none');
            }
         });
      </script>
      
      <!-- 경계선 -->
      <div style="position:relative;width:90%;height:3px;left:40px;background-color:#f0efef;"></div>
      
      <div style="position:relative;width:100%;height:550px">
          <!-- 댓글 -->
         <div style="position:relative;float:left;width:55%;height:550px;background-color:#F8F8F8;">
            <div class="container" style="padding-top:0px;">
               <div style="position:relative;top:10px;left:40px;text-align:left;color:gray;font-weight:bold;">Commets</div>
               <!-- 댓글 입력창 -->
               <div class="container__item" style="position:relative;top:30px;">
                  <form class="form" action="adoptionRE">
                     <input type="text" class="form__field" placeholder="댓글 쓰기" value=""/>
                     <button type="button" onclick="REinsert(${detail.ROOT},${detail.STEP},${detail.INDENT},'${Login.id}','${Login.myimage}')" class="btn btn--primary btn--inside uppercase">등록</button>
                  </form>
               </div>
               <!-- 댓글 -->
               <div id="RElist" style="overflow-x:hidden ;overflow-y:auto;position:relative;top:60px;left:30px;width:400px;height:380px;">
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