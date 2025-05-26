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
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<%-- [Contents] ######################################################### --%>
<div class="container my-5">
  <h2 class="text-center mb-4">트레이너별 매출 차트</h2>

  <div class="btn-group mb-3" role="group">
    <c:forEach var="trainer" items="${trainerList}">
      <a href="?trainerId=${trainer.trainerId}" class="btn btn-outline-primary">
        ${trainer.name}
      </a>
    </c:forEach>
  </div>

  <canvas id="salesChart" height="100"></canvas>
</div>

<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />

	

</body>
</html>