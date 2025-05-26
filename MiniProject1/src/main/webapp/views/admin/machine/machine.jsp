<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 현황 리스트</title>
<%-- 	<link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/machine.css"> --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
	<%-- [Contents] ######################################################### --%>
	
<div class="container text-center mt-5">
    <h1 class="display-5">운동기구 카테고리</h1>
    <div class="btn-group mt-4" role="group">
        <a href="machinelist?category=CARDIO" class="btn btn-outline-primary">CARDIO</a>
        <a href="machinelist?category=CABLE" class="btn btn-outline-secondary">CABLE</a>
        <a href="machinelist?category=PLATE" class="btn btn-outline-success">PLATE</a>
        <a href="machinelist?category=ETC" class="btn btn-outline-danger">ETC</a>
    </div>
</div>
	
	<%-- [Contents] ######################################################### --%>
	
</body>
</html>