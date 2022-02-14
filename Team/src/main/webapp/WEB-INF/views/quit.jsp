<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
<h1 align=center>회원 탈퇴</h1>
<table align=center>
<tr><td class=td>이름</td>
	<td><input class=sub type=text name=name id=name></td></tr>
<tr><td class=td>아이디</td>
	<td><input class=sub type=text name=userid id=userid></td></tr>
<tr><td class=td>비밀번호</td>
	<td><input class=sub type="password" name=passcode id=passcode></td></tr>
<tr><td class=td>모바일번호</td>
	<td><input class=sub type=text name=mobile id=mobile></td></tr>
<tr><td colspan=2 align=center>
		<input class=btn type=button id=btnquit value='탈퇴'>&nbsp;&nbsp;
		<input class=btn type=button id=btnback value='취소' onclick='document.location="/team/home"'>
	</td></tr>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('click','#btnquit',function(){
	let userid=$('#userid').val();
	let flag=true;
	
	$.ajax({
		url:'/team/quit',
		data:{},
		dataType:'json',
		method:'post',
		success:function(txt){
			console.log(txt);
			for(let i=0; i<txt.length; i++){
				if($('#userid').val()==txt[i]['id'] && $('#passcode').val()==txt[i]['pw']
					&& $('#name').val()==txt[i]['name'] && $('#mobile').val()==txt[i]['mobile']){
						flag="true";
						break;
				} else {
					console.log(txt);
		            flag="false";   
				}
			}
		},
		complete:function(){
			if(flag=="true"){
				alert("탈퇴되었습니다");
				$.ajax({
					url:'/team/quitMember',
					data:{id:$('#userid').val()},
					dataType:'text',
					method:'post',
					success:function(txt){
						console.log(txt);
						if(txt=="ok"){
							document.location='/team/home';
						} else {
							document.location='/team/viewquit';
						}
					}
				})
			} else {
				alert("존재하지 않는 회원입니다");   
			}
      }
});
})
</script>
</html>