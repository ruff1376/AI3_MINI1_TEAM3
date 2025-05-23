<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>매출 조회</title>
	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="p-5">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
	
<div class="container mt-5">
    <h2 class="mb-4 text-center">트레이너 매출 차트</h2>
    <div class="mb-4 text-end">
        <a href="list" class="btn btn-outline-primary">매출 리스트로</a>
    </div>
    <canvas id="salesChart"></canvas>
</div>
	
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
	

</body>
</html>