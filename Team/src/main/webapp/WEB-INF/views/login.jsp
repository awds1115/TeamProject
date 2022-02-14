<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
table {
	border-collapse:collapse;
	border:solid 1px gold;
}
td {
	border:2px solid gold;
	padding:10px 10px;
}
</style>
<body>
<br><br>
<h1 align=center>Login :)</h1>
<br>
<table align=center>
	<tr><td>아이디</td><td><input type=text id=userid name=userid></td>
		<td><input type=hidden id=type name=type></td></tr>
	<tr><td>비밀번호</td><td><input type=password id=passcode name=passcode></td></tr>
	<tr><td colspan=2 align=center>
			<input type=button id=log_chk value='로그인'>&nbsp;
			<input type=reset value='다시하기'></td>
		<td><a href="/team/viewquit">회원탈퇴</a></td></tr>
	<tr><td colspan=2 align=center>
			<input type=button id=cancel value='취소' onclick="document.location='/team/home'"></td>
		<td><a href="/team/register">회원가입</a></td></tr>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#log_chk',function(){
	if($('input[name=userid]').val()==""){
		alert('아이디를 확인해주세요');
		return false;
	} else if ($('input[name=passcode]').val()==""){
		alert('비밀번호를 확인해주세요');
		return false;
	}
	$.post('/team/type_check',{},function(txt){
		for(let i=0; i<txt.length; i++){
			if($('#userid').val()==txt[i]['id']){
				$('#type').val(txt[i]['type']);
			}
		}
		$.post('/team/login_check',{},function(txt){      
			var flag="";
			for(let i=0; i<txt.length; i++){
				if($('#userid').val()==txt[i]['id'] && $('#passcode').val()==txt[i]['pw']){
					flag="true";
					break;
				} else {
					flag="false";   
				}
			}
			console.log($('#type').val());
			console.log("flag:"+flag);
			if(flag=="true"){
				alert($('#userid').val()+"님 환영합니다.");
				$.post('/team/login_update',{id:$('#userid').val(),type:$('#type').val()},function(txt){
					document.location='/team/home';
				},'text');
			} else {
				alert("아이디 또는 비밀번호가 맞지 않습니다.");   
			}
		},'json');
	},'json');
});

</script>
</html>
