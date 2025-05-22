<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- 문자열 이스케이프 처리용 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
  	<meta charset="UTF-8">
  	<title>트레이너 시간표 - 최종본</title>
  	<jsp:include page="/WEB-INF/views/layout/link.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<main>
	<div class="container-fluid d-flex gap-3 px-1 my-2">
		<div class="calendar border rounded p-3 bg-light" id="calendar" style="width: 630px; height: 1000px;"></div>
		<div class="schedule flex-grow-1 border rounded p-3 bg-light">
			<h3 id="selected-date-title" class="mb-3 d-flex justify-content-center">
				<c:choose>
					<c:when test="${empty selectedDate}">날짜를 선택하세요</c:when>
					<c:otherwise>${selectedDate} 예약 스케줄</c:otherwise>
				</c:choose>
			</h3>

			<!-- ✅ action="schedule" 으로 수정 -->
			<form action="schedule" method="post">
				<input type="hidden" name="date" id="selected-date-value" value="${selectedDate}">

				<div class="text-end mb-3">
					<button type="submit" class="btn btn-success px-4">저장하기</button>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered text-center align-middle">
						<thead class="table-light">
							<tr>
								<th style="width: 110px;">시간</th>
								<c:forEach var="t" items="${trainerList}">
									<th>${t}</th>
								</c:forEach>
							</tr>
						</thead>
						<tbody id="schedule-body">
							<!-- JS가 자동 생성 -->
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</main>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />

<!-- JSTL → JS 데이터로 변환 -->
<script>
  const initialSelectedDate = "${selectedDate}";
  const trainers = [
    <c:forEach var="t" items="${trainerList}" varStatus="loop">
      "${t}"<c:if test="${!loop.last}">,</c:if>
    </c:forEach>
  ];

  const savedEntries = [
    <c:forEach var="entry" items="${scheduleList}" varStatus="loop">
      {
        "trainer": "${entry.trainer}",
        "time": "${entry.time}",
        "memo": "${fn:replace(entry.memo, '\"', '\\\"')}",
        "checked": ${entry.checked}
      }<c:if test="${!loop.last}">,</c:if>
    </c:forEach>
  ];
</script>
<script src="static/js/schedule.js"></script>
</body>
</html>
