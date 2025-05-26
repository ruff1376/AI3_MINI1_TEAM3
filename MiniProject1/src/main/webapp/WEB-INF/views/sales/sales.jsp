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

<script>
  const ctx = document.getElementById('salesChart').getContext('2d');
  const chart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        <c:forEach var="i" begin="0" end="${fn:length(trainerList[0].salesList)-1}" varStatus="loop">
          "${trainerList[0].salesList[loop.index].date}",
        </c:forEach>
      ],
      datasets: [
        <c:forEach var="trainer" items="${trainerList}" varStatus="loop">
          {
            label: "${trainer.name}",
            data: [
              <c:forEach var="sale" items="${trainer.salesList}">
                ${sale.amount},
              </c:forEach>
            ],
            borderColor: "${loop.index == 0 ? '#ff6384' : loop.index == 1 ? '#36a2eb' : loop.index == 2 ? '#cc65fe' : '#4bc0c0'}",
            fill: false
          }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
      ]
    },
    options: {
      responsive: true,
      plugins: {
        legend: {
          display: true,
          position: 'top'
        }
      },
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
<%-- [Contents] ######################################################### --%>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
<jsp:include page="/WEB-INF/views/layout/script.jsp" />
	

</body>
</html>