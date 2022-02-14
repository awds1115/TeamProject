<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
   <title>직원용 예약</title>
</head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
table {
    margin-left: auto;
    margin-right: auto;
}
table.bound { /*bound라는 class는 table 안에서만 쓸 수 있다.*/
   border-collapse: collapse;
   border: 1px solid black;
/*    height: 450px; */
/*    width: 450px; */
/*    font-family: cursive; */
}

td.bound { /*이 bound는 td 안에서는 아래의 의미가 된다.*/
   border: 1px solid black;
   background-color: cornsilk;
}
#selRoom{
   width:380px;
   height:320px;
}


#selSales {
   width: 300px;
   height: 400px;
}

#btnMinus, #btnCancel, #btnReset {
   background-color: tomato;
}

#btnMenu {
   background-color: red;
}
}
h3{
   text-align:center;
    background-color:white; 
}
</style>
<body>
<input type=button id=btnRoom value="객실관리">
<input type=button id=btnType value="객실타입관리">
<table id=home align=right>
	<tr><td>
		<c:if test="${userid =='null' }"><a href='/team/login'>로그인</a>&nbsp;<a href='/team/register'>회원가입</a></c:if>
		<c:if test="${userid !='null' }">${userid}&nbsp; <a href='/team/logout_update' id=logout>로그아웃</a></c:if>
	</td></tr>
</table><br>
<h3 align="center">휴먼 호텔관리(직원용)</h3><hr>
<table>
   <tr><td><a href="x" style="text-decoration:none">예약&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
      <td><a href="xxx" style="text-decoration:none">게시판&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
      <td><a href="xxx" style="text-decoration:none">Q&A</a></td></tr>
</table><hr>
<table>
<tr><td valign=top>
   <table class='bound' id=tblMenu>
      <caption>예약선택</caption>
      <tr><td>예약기간</td>
         <td><input type=date id=date1>&nbsp;~&nbsp;<input type=date id=date2></td></tr>
      <tr><td>객실종류</td>
         <td><select id=roomtype1 name=roomtype1 style='width:150px'>
            <option selected>종류선택</option>
               <c:forEach items="${alType}" var="type">
                  <option value=${type.typecode}>${type.name}</option>
               </c:forEach>
            </select>
         </td></tr>
      <tr align=left><td>숙박인원</td>
         <td><input type=number id=count min=0 style='width: 60px' value=5>명&nbsp;&nbsp;
            <input type=button id=find value='찾기'></td>
      <tr><td colspan=2 align=center><select id=selRoom style='width: 350px' size=10></select></td></tr>
   </table>
</td><td valign=top>
   <table class='bound' id=tbl2 align=right>
      <caption id=sel1>예약입력</caption>
      <tr><td>예약번호</td>
         <td><input type=text style='width:150px' id=selNum></td></tr>
      <tr><td>숙박기간</td>
         <td><input type=text style='width: 100px' class='as' id=date3 >&nbsp;~&nbsp;
            <input type=text style='width: 100px' class='as' id=date4></td></tr>
      <tr><td>객실명</td>
         <td><input type=text size=13 readonly id=nameroom></td></tr>
      <tr><td>객실종류</td>
         <td><input id=roomtype2 name=roomtype2 type=text size=13 readonly></td></tr>
      <tr><td>숙박인원</td>
         <td><input type=number size=13 id=howmany></td></tr>
      <tr><td>대표자명</td>
         <td><input type=text size=13></td></tr>
      <tr><td>모바일</td>
         <td><input type=text value='전화번호 입력' size=13 id=mobile1></td></tr>
      <tr><td>숙박비</td>
         <td><input type=text id=price1 readonly></td></tr>
      <tr><td colspan=2>&nbsp;</td></tr>
      <tr><td colspan=2 align=center><button id=btnCancel>주문취소</button><button id=btnDone>주문완료</button></td></tr>
   </table>
</td><td valign=top>
   <table class='bound'>
      <caption id=sel>예약된 객실목록</caption>
      <tr><td>
         <select id=selSales size=20>
            <c:forEach items="${alBook}" var="book">
               <option value=${book.book_id}>${book.roomcode}, ${book.start_dt}, ${book.end_dt}</option>
               <option value=${book.book_id}> ${book.howmany}, ${book.guest}, ${book.howmuch}, ${book.member_id}</option>
            </c:forEach>
         </select>
      </td></tr>
   </table>
</td></tr></table>
     
    <div id=dlgRoom style='display:none;' title='객실관리'>
<table><tr>
<td><select id=selDlgRoom size=10 style="width:200px"></select></td>
<td>
   <table>
   <tr><td><input type=hidden id=roomcode name=roomcode style="width:120px"></td></tr>
   <tr><td>객실명</td>
      <td><input type=text id=roomname  name=roomname style="width:120px"></td></tr>
   <tr><td>타입</td>
      <td><select id=roomtype3 name=roomtype3></select></td></tr>
   <tr><td>인원:</td>
      <td><input type=number name=howmany1 id=howmany1></td></tr>
   <tr><td>요금:</td>
      <td><input type=number name=howmuch id=howmuch></td></tr>
   <tr><td colspan=2 align=center>
      <input type=button value='추가' id=btnAdd>
      <input type=button value="삭제" id=btnDelete>
      <input type=button value='비우기' id=btnReset></td></tr>
   </table>
</td></tr></table>
   </div>
   
   <div id=dlgType style='display:none;' title='객실타입관리'>
<table><tr>
<td><select id=selType size=10 style="width:200px"></select></td>
<td>
   <table>
   <tr><td>객실코드</td><td><input type=hidden id=TypeCode name=TypeCode style="width:120px"></td></tr>
   <tr><td>객실명</td><td><input type=text id=TypeName name=TypeName style="width:120px"></td></tr>
   <tr><td colspan=2 align=center>
      <input type=button value='추가' id=btnAdd2>
      <input type=button value="삭제" id=btnDelete2>
      <input type=button value='비우기' id=btnReset2></td></tr>
   </table>
</td></tr></table>
   </div>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)

 .on('click','#btnDone',function(){
      let date3=$('#date3').val();
      let date4=$('#date4').val();
      let howmany=$('#howmany').val();
      let guest=$('#guest').val();
      let mobile1=$('#mobile1').val();
      let howmuch=$('#price1').val();
      let roomcode=$('#roomotype2 option').val();
      
      $.ajax({
         url:"/team/insertBook",
         data:{date3:date3,
              date4:date4,
              howmany:howmany,
              guest:guest,
              mobile1:mobile1,
              howmuch:howmuch
              roomcode:roomcode},
         method:"GET",
         datatype:'json',
         beforeSend:function(){
            $('#selSales').empty();
         },
         success:function(data){
            for(i=0; i<data.length; i++){
               let str='<option>'+data[i]['aname']+' '+data[i]['bname']+' '+data[i]['howmany']+'명 '+data[i]['howmuch']+'원'+'</option>';
               $('#selSales').append(str);
               let str1=data[i]['sbook'];
               $('#bookid').val(str1);
            }
         }
      });
      return false;
   })



     .on('focus','#mobile1',function(){
        $('#mobile1').val('');
     })
     
      .on('click','#selRoom option',function(){
      let str=$(this).val();
      let str1=str.split(' ');
      $('#nameroom').val(str1[0]);
      $('#roomtype2').val(str1[1]);
      $('#price1').val(str1[3]);
      let date1= $('#date1').val();
      let date2= $('#date2').val();
      let str2=date1.split('-');
      $('#date3').val(str2[0]+'/'+str2[1]+'/'+str2[2])
      let str3=date2.split('-');
      $('#date4').val(str3[0]+'/'+str3[1]+'/'+str3[2])
   })
   
   .on('click','#find',function(){
      let typeid=$('#roomtype1').val();
      let howm=$('#count').val();
      $.ajax({
         url:"/team/posit1",
         data:{typecode:typeid,howmany:howm},
         method:"GET",
         datatype:'json',
         beforeSend:function(){
            $('#selRoom').empty();
         },
         success:function(data){
            for(i=0; i<data.length; i++){
               let str='<option>'+data[i]['aname']+' '+data[i]['bname']+' '+data[i]['howmany']+'명 '+data[i]['howmuch']+'원'+'</option>';
               $('#selRoom').append(str);
               let str1=data[i]['sbook'];
               $('#bookid').val(str1);
            }
         }
      });
      return false;
   })
   .on('click','#btnDone',function(){
      
   })
   
   

.on('click', '#btnRoom', function () {
        $('#dlgRoom').dialog({
            width: 560,
            open: function () {
               loadRoom();
            },
            close: function () {
            }
        });
    })
.on('click', '#btnType', function () {
        $('#dlgType').dialog({
            width: 560,
            open: function () {
               loadType();   
            },
            close: function () {
            }
        });
    })
.on('click', '#btnAdd', function () {
    console.log($('#roomcode').val());
      if($('input[name=roomname]').val()==''){
            alert('객실명을 입력해주십시오.');
            return false;
         }
      if($('#roomtype').val()==''){
         alert('객실타입을 선택해주십시오.');
         return false;
      }
      if($('input[name=howmany]').val()==''){
         alert('인원을 입력해주십시오.');
         return false;
      }
      if($('input[name=howmuch]').val()==''){
         alert('요금을 입력해주십시오.');
         return false;
      }
      
    $('#selDlgRoom').empty();
      $.ajax({url:'/team/RoomAdd',
          data:{roomcode:$('#roomcode').val(),roomname:$('#roomname').val(),roomtype:$('#roomtype3').val(),
             howmany:$('#howmany1').val(),howmuch:$('#howmuch').val()},
          datatype:'text',
          method:'get',
          success:function(txt){
              console.log(txt);
               loadRoom();
      
          }   
       });   
      
 })
.on('click', '#btnAdd2', function () {
    
      if($('input[name=TypeName]').val()==''){
            alert('객실타입을 입력해주십시오.');
            return false;
         }
      
    $('#selType').empty();
      $.ajax({url:'/team/typeAdd',
          data:{typecode:$('#TypeCode').val(), typename:$('#TypeName').val()},
          datatype:'text',
          method:'get',
          success:function(txt){
              console.log(txt);
              loadType();   
      
          }   
       });   
 })
.on('click', '#btnDelete', function () {
    $('#selDlgRoom').empty();
      $.ajax({url:'/team/RoomDelete',
          data:{roomcode:$('#roomcode').val()},
          datatype:'text',
          method:'get',
          success:function(txt){
              console.log(txt);
               loadRoom();
      
          }   
       });   
 })
.on('click', '#btnDelete2', function () {
    $('#selType').empty();
      $.ajax({url:'/team/typeDelete',
          data:{typecode:$('#TypeCode').val()},
          datatype:'text',
          method:'get',
          success:function(txt){
              console.log(txt);
              loadType();   
      
          }   
       });   
 })
.on('click', '#btnReset', function () {
      $('#roomcode,#roomname,#roomtype3,#howmany1,#howmuch').val('');
 })
.on('click', '#btnReset2', function () {
      $('#TypeCode,#TypeName').val('');
 })
.on('click','#selDlgRoom option',function(){
   console.log($(this).val()+','+$(this).text());
   $('#roomcode').val($(this).val());
   let str=$(this).text();
   let ar=str.split(',');
   $('input[name=roomname]').val($.trim(ar[0]));
   $('input[name=howmany1]').val(ar[2]);
   $('input[name=howmuch]').val(ar[3]);
   let roomtype3=$.trim(ar[1]);
   $('#roomtype3').val('');
   $('#roomtype3 option').each(function(){
      if($(this).text()==roomtype3) {
         $(this).prop('selected','selected')
         return false;
      }
   });
   return false;
})
.on('click','#selType option',function(){
   console.log($(this).val()+','+$(this).text());
   $('#TypeCode').val($(this).val());
   let str=$(this).text();
   let ar=str.split(',');
   $('input[name=TypeName]').val($.trim(ar[0]));
   return false;
})
 function loadType() {
   $('#TypeCode,#TypeName').val('');
   $('#selType').empty();
   $.ajax({url:'/team/typelist',
      data:{},
      datatype:'json',
      method:'get',
      success:function(txt){
         for(i=0; i<txt.length; i++){
            let str='<option value='+txt[i]['typecode']+'>'+txt[i]['typename']+'</option>'
            console.log(str);
//             $('#roomtype3').append()
            $('#selType').append(str);
         }
      }
   
});
}
function loadRoom() {
   $('#roomcode,#roomname,#roomtype3,#howmany1,#howmuch').val('');
   $('#selDlgRoom,#roomtype3').empty();
   $.ajax({url:'/team/roomlist',
      data:{},
      datatype:'json',
      method:'get',
      success:function(txt){
         for(i=0; i<txt.length; i++){
            let str='<option value='+txt[i]['roomcode']+'>'
            +txt[i]['roomname']+','+txt[i]['roomtype']+','
            +txt[i]['howmany']+','+txt[i]['howmuch']+'</option>'
            console.log(str);
            $('#selDlgRoom').append(str);
         }
      }
   
});
   $.ajax({url:'/team/typelist',
      data:{},
      datatype:'json',
      method:'get',
      success:function(txt){
         let notype='<option value="">'+'-'+'</option>'
         $('#roomtype1').append(notype);
         for(i=0; i<txt.length; i++){
            let str='<option value='+txt[i]['typecode']+'>'+txt[i]['typename']+'</option>'
            console.log(str);
//             $('#roomtype1').append(str);
            $('#roomtype3').append(str);
         }
      }
   
});
};

</script>

</html>