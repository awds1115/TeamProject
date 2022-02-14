<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<style>
table {
    margin-left: auto;
    margin-right: auto;
    border-collapse:collapse;
}
.notice, .notice th, .notice td {
	padding:10px;
	 border:1px solid black;
}
</style>
<body>
<table id=home align=right>
	<tr>
		<td><c:if test="${userid =='null' }"><a href='/team/login'>로그인</a>&nbsp;<a href='/team/register'>회원가입</a></c:if>
			<c:if test="${userid !='null' }">${userid}&nbsp; <a href='/team/logout_update' id=logout>로그아웃</a></c:if>
		</td>
	</tr>
</table>
<br>
<h1 align="center">휴먼 호텔<게시판></h1>
   <hr>
   <table>
   <tr align=center id=check><td><c:if test="${type ==0}"><a href="/team/admincheck" style="text-decoration:none">직원예약&nbsp;&nbsp;&nbsp;&nbsp;</a> </c:if>
   								 <c:if test="${type ==1}"><a href="/team/bookcheck" style="text-decoration:none">예약하기&nbsp;&nbsp;&nbsp;&nbsp;</a></c:if>
   								 <c:if test="${type ==2}"><a href="/team/bookcheck" id=close style="text-decoration:none">예약하기&nbsp;&nbsp;&nbsp;&nbsp;</a></c:if></td>
      <td><a href="/team/notice" style="text-decoration:none">게시판&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
      <td><a href="/team/" style="text-decoration:none">Q&A</a></td></tr>
   </table>
   <hr>
<table style='border-collapse:collapse;' class=notice>
<thead>
	<tr><th>게시물번호</th><th>제목</th><th>작성자</th><th>작성시각</th><th>조회수</th></tr>
</thead>
<tbody id=tbody>
<%-- <c:forEach var="notice" items="${alNotice}"> --%>
<%-- 	<tr onclick='document.location="/team/view?id=${notice.id}"'> --%>
<%-- 		<td>${notice.id}</td> --%>
<%-- 		<td>${notice.title}</td> --%>
<%-- 		<td>${notice.name}</td> --%>
<%-- 		<td>${notice.created}</td> --%>
<%-- 		<td>${notice.viewCnt}</td> --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>
	
</tbody>
<tr><td><input type=button value='글쓰기' id=btnWrite></td></tr>
</table>

<table align=center>
<tr><td><div> 
<input type=button id=back name=back value="이전">&nbsp;&nbsp;
<input type=button id=next name=next value="다음"> 
</div></td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
let pageno=1;
$(document)
.ready(function(){
	$.ajax({url:"/team/Notice1",data:{},datatype:"json",
		method:"GET",
		    success:function(txt){
		for(i=0; i<txt.length; i++){
			let str='<tr><td>'+txt[i]['id']+'</td><td>'+txt[i]['title']+'</td><td>'+
					txt[i]['name']+'</td><td>'+txt[i]['created']+'</td><td>'+txt[i]['viewCnt']+'</td></tr>';
			$('#tbody').append(str);
		}
		
		    }
	});
})
.on('click','#btnWrite',function(){
	if(${type}==0){
		document.location="/team/compose";
	} else{
		alert("직원만 글 작성이 가능합니다.");
	}
})
.on('click','#next',function(){
	console.log(pageno);
	pageno=pageno+1;
// 		$.ajax({url:'/team/pagecheck',
// 				data:{pageno:pageno},
// 				datatype:'json',
// 				method:'get',
// 				success:function(data){
// 					console.log(data);														
// 					if(data==null){
// 						return false;
// 					}
				

	$.ajax({url:'/team/paging',
			data:{pageno:pageno},
   		datatype:'text',
   		method:'get',
   		success:function(txt){
   			
   		}
	})
// 				}
// 		})
})
</script>
</html>