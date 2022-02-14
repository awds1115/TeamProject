<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
</head>
<style>
td, th{ border:1px solid blue;}
table{border-collapse:collapse;}
</style>
<body>
<input type=hidden id=notice_id value="${notice.id}">
<table>
<tr><td>제목</td><td><input type=text value="${notice.title}" readonly></td></tr>
<tr><td>작성자</td><td><input type=text value="${notice.name}" readonly></td></tr>
<tr><td>내용</td><td><textarea id=content name=content rows=10 cols=50 readonly>${notice.content}</textarea></td></tr>
<tr><td><input type=button id=btnCancel name=btnCancel value='목록보기'></td>
	<td align=right><input type=button id=btnUpdate name=btnUpdate value='수정'>
					<input type=button id=btnDelete name=btnDelete value='삭제'></td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnCancel',function(){
	document.location='/team/notice';
	return false;
})
.on('click','#btnDelete',function(){
	if(${type}==0){
		if(confirm('정말 삭제하시겠습니까?')){
			document.location='/team/delete?id='+$('#notice_id').val();
		}
	} else {
		alert('직원만 삭제가 가능 합니다.');
	}
	return false;
	
})
.on('click','#btnUpdate',function(){
	if(${type}==0){
		if(confirm('수정 하시겠습니까?')){
			document.location='/team/update?id='+$('#notice_id').val();
		}
	} else {
		alert('직원만 수정이 가능 합니다.');
	}
	return false;
	
})
</script>
</html>