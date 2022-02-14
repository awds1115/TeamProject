<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<style>
td, th{ border:1px solid blue;}
</style>
<body>
<table style='border-collapse:collapse;'>
<tr><td>제목</td><td><input type=text id=title name=title></td></tr>
<tr><td>작성자</td><td><input type=text id=name name=name></td></tr>
<tr><td>내용</td><td><textarea id=content name=content></textarea></td></tr>
<tr><td colspan=2><input type=button id=btnAdd name=btnAdd value='작성완료'>
				  <input type=button id=Reset name=Reset value='비우기'>
				  <input type=button id=btnCancel name=btnCancel value='목록보기'>
</td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnAdd',function(){
	$('#title').val($.trim($('#title').val()));
	$('#name').val($.trim($('#name').val()));
	$('#content').val($.trim($('#content').val()));
	if($('#title').val()=='' || $('#name').val()=='' || $('#content').val()==''){
		alert('비어있는 입력란이 있습니다.');
		return false;
	}
	$.ajax({url:'/team/write',
			data:{title:$('#title').val(),name:$('#name').val(),content:$('#content').val()},
			datatype:'text',
			method:'GET',
			success:function(txt){
				alert('작성되었습니다.');
				document.location='/team/notice';
			}
			})
	return true;
})
.on('click','#btnCancel',function(){
	document.location='/team/notice';
	return false;
})
.on('click','#Reset',function(){
	$('#title,#name,#content').val("");
})
</script>
</html>