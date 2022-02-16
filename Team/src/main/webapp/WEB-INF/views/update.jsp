<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<style>
td, th{ border:1px solid blue;}
</style>
<body>
<!-- $.ajax(url:'/modify',data:{post_id:$('#post_id').val(), title:$('#title').val() -->
<!--        name:$('#name').val(), content:$('#content').val()); -->
<input type=hidden id=notice_id name=notice_id value="${notice.bno}">
<table style='border-collapse:collapse;'>
<tr><td>제목</td><td><input type=text value="${notice.title}" id=title name=title ></td></tr>
<tr><td>작성자</td><td><input type=text value="${notice.name}" id=name name=name></td></tr>
<tr><td>내용</td><td><textarea id=content name=content rows=10 cols=50 >${notice.content}</textarea></td></tr>
<tr><td><input type=button id=btnList name=btnList value='목록보기'></td>
	<td align=right><input type=button id=btnFinish name=btnFinish value='수정'>
					<input type=button id=Reset name=Reset value='지우기'></td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnList',function(){
	document.location='/team/notice';
	return false;
})
.on('click','#btnFinish',function(){
	$('#notice_id').val($.trim($('#notice_id').val()));
	if($('#notice_id').val()==''){
		alert('게시물 번호가 없습니다.');
		return false;
	}
	$('#title').val($.trim($('#title').val()));
	$('#name').val($.trim($('#name').val()));
	$('#content').val($.trim($('#content').val()));
	if($('#title').val()=='' || $('#name').val()=='' || $('#content').val()==''){
		alert('비어있는 입력란이 있습니다.');
		return false;
	}
 	$.ajax({url:'/team/modify',
 			data:{id:$('#notice_id').val(), title:$('#title').val(),
       			  name:$('#name').val(), content:$('#content').val()},
       		datatype:'text',
       		method:'post',
       		success:function(txt){
       			alert("수정되었습니다.");	
       			document.location='/team/notice';
       		}
 	})
	return true;
  })
.on('click','#btnDelete',function(){
	$('#title,#name,#content').val("");
	})


//update mvc_voard set title='', name='', content='' where id=''
</script>
</html>