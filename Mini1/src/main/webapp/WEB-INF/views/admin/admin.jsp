<%@page import="com.hhg.ptschedule.dto.PTSchedule"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ include file="../layout/jstl.jsp"%>
<%@ include file="../layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//URL에서 date 파라미터를 받되, 없으면 오늘 날짜
	String paramDate = request.getParameter("date");
	LocalDate date = (paramDate != null) ? LocalDate.parse(paramDate) : LocalDate.now();
	
	String formattedDate = date.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
	String prevDate = date.minusDays(1).toString(); // yyyy-MM-dd
	String nextDate = date.plusDays(1).toString();  // yyyy-MM-dd
	String compareDate = date.toString(); // yyyy-MM-dd
	
	request.setAttribute("compareDate", compareDate);
    request.setAttribute("formattedDate", formattedDate);
    
    String lastTime = "";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자</title>
	<link rel="stylesheet" href="<%= root %>/static/css/admin.css" />
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
			<div class="content-box d-flex justify-content-between align-items-center mb-4">
			  <!-- 왼쪽: 제목 -->
			  <div class="section-title">오늘 일정</div>
			
			  <div class="d-flex align-items-center gap-2">
			    <a href="?trainerId=${param.trainerId}&date=<%= prevDate %>" class="btn btn-sm btn-outline-secondary px-2">&lt;</a>
			
			    <!-- 날짜 텍스트 & 숨겨진 input[type=date] -->
			    <form method="get" class="m-0 p-0">
			      <input type="hidden" name="trainerId" value="${param.trainerId}">
			      <label class="date-display" onclick="document.getElementById('datePicker').click()">
			        <%= formattedDate %>
			      </label>
			      <input type="date" name="date" id="datePicker" onchange="this.form.submit()" value="<%= date.toString() %>">
			    </form>
			
			    <a href="?trainerId=${param.trainerId}&date=<%= nextDate %>" class="btn btn-sm btn-outline-secondary px-2">&gt;</a>
			  </div>
			</div>
	
			<!-- 오늘 일정 -->
			<div class="content-box">
				<c:forEach var="pt" items="${ptScheduleList}">
					<c:if test="${pt.trainerId == param.trainerId && pt.bookDate == compareDate}">
						<div class="d-flex justify-content-between rounded-row">
					      <div>${pt.bookTime}</div>
					      <div>${pt.memberName} PT</div>
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
								test="${pt.trainerId == param.trainerId && pt.memberNo == q.writer}">
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
					<c:if test="${macro.recordDate == compareDate}">
						<c:forEach var="pt" items="${ptScheduleList}">
							<c:if
								test="${pt.trainerId == param.trainerId && pt.memberNo == macro.memberNo}">
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