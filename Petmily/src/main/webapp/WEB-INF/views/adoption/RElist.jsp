<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>

   function RereInsertForm(n){
      
      $('.REinsertForm'+n).css("display","block");
   }
   
   function RereInsert(seq,r,s,i,id,img){
      
      $.ajax({
         type:"Post",
         url:"REinsert",
         data:{
            seq:seq,
            root:r,
            step:s,
            indent:i,
            id:id,
            content:$('.insertForm'+seq).val(),
            myimage:img,
         },
         success:function(result){
            $('.REreList'+seq).html(result);
         }
      });
      $('.insertForm'+seq).val('');
   }
   
   function Rerelist(n,r){
      alert('a'+n);
      $.ajax({
         type:"Post",
         url:"RErelist",
         data:{
            seq:n,
            root:r,
         },
         success:function(result){
            $('.REreList'+n).html(result);
         }
      });
      $('.REreList'+n).css("display","block");
   }
</script>
<body>
   <c:forEach var="re" items="${RElist}">
      <c:if test="${re.INDENT=='1'}">
         <div style="height:110px;">
            <div style="position:relative;border-radius:50%;border:2px solid #333; width:40px;height:40px;background-image:url('${re.MYIMAGE}');background-size:cover;"></div>
            <div style="position:relative;top:-45px;left:70px;width:200px;text-align:left;color:#333;font-weight:bold;">${re.ID}</div>
            <div style="position:relative;top:-40px;left:70px;width:300px;text-align:left;color:gray;font-weight:bold;">${re.CONTENT}</div>
            <div style="position:relative;top:-30px;left:70px;width:200px;text-align:left;">${re.RDATE}</div>
            <div style="position:relative;top:-50px;left:170px;width:200px;text-align:left;"><button type="button" onclick="RereInsertForm(${re.SEQ})" style="background-color:inherit;border:none;color:inherit;font-weight:bold;outline:none;">답글달기</button></div>
            <div style="position:relative;top:-70px;left:240px;width:200px;text-align:left;"><button type="button" onclick="Rerelist(${re.SEQ},${re.ROOT})" style="background-color:inherit;border:none;color:inherit;font-weight:bold;outline:none;">답글보기</button></div>
            
          </div>
         <div class="REinsertForm${re.SEQ}" style="position:relative;top:-20px;left:10px;display:none;">
            <i class="fas fa-user-circle" style="font-size:20px;"></i>
            <input type="text"class="insertForm${re.SEQ}" style="background-color:inherit;border:none;border-bottom:1px solid gray;outline:none;">
            <button type="button" onclick="RereInsert(${re.SEQ},${re.ROOT},${re.STEP},${re.INDENT},'${Login.id}','${Login.myimage}')" style="background-color:inherit;border-radius:10px;border:2px solid #f0efef;padding:5px;outline:none;">등록</button>
            <button type="button" style="background-color:inherit;border-radius:10px;border:2px solid #f0efef;padding:5px;outline:none;">취소</button>
         </div>
         <div class="REreList${re.SEQ}" style="display:none;">
         </div>
      </c:if>
   </c:forEach>
</body>
</html>