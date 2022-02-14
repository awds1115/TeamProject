<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
</head>
<style>

</style>
<body align=center>
<h1>오시는 길</h1>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div align=center id="daumRoughmapContainer1644558305416" class="root_daum_roughmap root_daum_roughmap_landing">

</div>
</body>
<!-- 2. 설치 스크립트
	 * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다. -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1644558305416",
		"key" : "294ey",
		"mapWidth" : "1350",
		"mapHeight" : "600"
	}).render();
</script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

</script>
</html>