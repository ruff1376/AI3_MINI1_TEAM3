<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>운동기구 리스트 메인</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
<div class="container text-center mt-5 mb-5">
    <h2>운동기구 카테고리</h2>
    <div class="btn-group mt-4" role="group">
        <a href="<%= root %>/admin/machine/list?category=CARDIO" class="btn btn-outline-primary">CARDIO</a>
        <a href="<%= root %>/admin/machine/list?category=CABLE" class="btn btn-outline-secondary">CABLE</a>
        <a href="<%= root %>/admin/machine/list?category=PLATE" class="btn btn-outline-success">PLATE</a>
        <a href="<%= root %>/admin/machine/list?category=ETC" class="btn btn-outline-danger">ETC</a>
    </div>
</div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>