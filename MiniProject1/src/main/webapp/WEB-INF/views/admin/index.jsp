<%@page import="java.time.LocalDate"%>
<%@ include file="../layout/jstl.jsp"%>
<%@ include file="../layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 오늘 날짜 초기값 설정
	String selectedDate = request.getParameter("date");
	if (selectedDate == null) {
		selectedDate = LocalDate.now().toString();
	}
	String trainerId = request.getParameter("trainerId");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자</title>
	<link rel="stylesheet" href="<%=root%>/static/css/admin.css" />
	<jsp:include page="../layout/link.jsp" />
</head>
<body class="bg-white">
	
	<jsp:include page="../layout/header.jsp" />
	
	<main>
		<div class="container-lg py-4">
	
			<!-- 트레이너 선택 -->
			<form method="get" class="trainer-select text-center">
				<select name="trainerId" class="form-select"
					onchange="this.form.submit()">
					<option value="">트레이너</option>
					<c:forEach var="t" items="${trainerList}">
						<option value="${t.trainerId}"
							<c:if test="${t.trainerId == param.trainerId}">selected</c:if>>${t.name}</option>
					</c:forEach>
				</select>
			</form>
	
			<!-- 날짜 네비게이션 -->
			<div class="d-flex justify-content-between align-items-center mb-4">
			  <!-- 왼쪽: 제목 -->
			  <div class="fw-bold">오늘 일정</div>
			
			  <!-- 오른쪽: 날짜 네비게이션 -->
			  <div class="d-flex align-items-center gap-2">
			    <a href="?trainerId=${trainerId}&date=${prevDate}" class="btn btn-sm btn-outline-secondary px-2">&lt;</a>
			    <span class="fw-bold"><fmt:formatDate value="${selectedDate}" pattern="yyyy.MM.dd" /></span>
			    <a href="?trainerId=${trainerId}&date=${nextDate}" class="btn btn-sm btn-outline-secondary px-2">&gt;</a>
			  </div>
			</div>
	
			<!-- 오늘 일정 -->
			<div class="content-box">
				<c:forEach var="pt" items="${ptScheduleList}">
					<c:if
						test="${pt.trainerId == trainerId && pt.bookDate == selectedDate}">
						<div class="d-flex justify-content-between rounded-row">
							<div>${pt.bookTime}</div>
							<div>
								<c:forEach var="m" items="${memberList}">
									<c:if test="${m.memberNo == pt.memberNo}">${m.name} PT</c:if>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
	
			<!-- TODO -->
			<div class="content-box">
				<div class="section-title">TODO</div>
				<c:forEach var="gm" items="${gymMachineList}">
					<c:if test="${fn:contains(gm.status, '점검')}">
						<div class="d-flex justify-content-between rounded-row">
							<div>${gm.name}</div>
							<div>${gm.status}</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
	
			<!-- 미답변 문의사항 -->
			<div class="content-box">
				<div class="section-title">미답변 문의사항</div>
				<c:forEach var="q" items="${questionList}">
					<c:if test="${q.status == 0}">
						<c:forEach var="pt" items="${ptScheduleList}">
							<c:if
								test="${pt.trainerId == trainerId && pt.memberNo == q.writer}">
								<div class="d-flex justify-content-between rounded-row">
									<div>${q.writer}</div>
									<div>${q.title}</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
	
			<!-- 식단 평가 -->
			<div class="content-box mb-5">
				<div class="section-title">식단 평가</div>
				<c:forEach var="macro" items="${macroRecordList}">
					<c:if test="${macro.recordDate == selectedDate}">
						<c:forEach var="pt" items="${ptScheduleList}">
							<c:if
								test="${pt.trainerId == trainerId && pt.memberNo == macro.memberNo}">
								<c:forEach var="m" items="${memberList}">
									<c:if test="${m.memberNo == macro.memberNo}">
										<div class="d-flex justify-content-between rounded-row">
											<div>${m.name}</div>
											<div>${macro.title}</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
	
		</div>
	</main>
	
	<jsp:include page="../layout/script.jsp" />
	<jsp:include page="../layout/footer.jsp" />
	
</body>
</html>