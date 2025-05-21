<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	
	<main>
		<div class="container">
	
		    <%-- 오늘 일정 섹션 --%>
		    <div class="section">
		        <div class="section-header">
		            <div class="title"><h1>오늘 일정</h1></div>
		            <div class="date"><h1><%= java.time.LocalDate.now() %></h1></div>
		        </div>
		
		        <div class="section-body">
		            <c:forEach var="item" items="${todaySchedule}">
		                <div class="schedule">
		                    <div class="time">${item.time}</div>
		                    <div class="todo">${item.task}</div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		
		    <%-- 기구 점검 섹션 --%>
		    <div class="section">
		        <div class="section-header"><div class="title"><h1>기구 점검</h1></div></div>
		        <div class="section-body">
		            <c:forEach var="item" items="${equipmentCheck}">
		                <div class="schedule">
		                    <div class="time">${item.time}</div>
		                    <div class="todo">${item.task}</div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		
		    <%-- 미답변 문의사항 섹션 --%>
		    <div class="section">
		        <div class="section-header"><div class="title"><h1>미답변 문의사항</h1></div></div>
		        <div class="section-body">
		            <c:forEach var="item" items="${unansweredQuestions}">
		                <div class="schedule">
		                    <div class="time">${item.time}</div>
		                    <div class="todo">${item.task}</div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		
		    <%-- 식단 평가 섹션 --%>
		    <div class="section">
		        <div class="section-header"><div class="title"><h1>식단 평가</h1></div></div>
		        <div class="section-body">
		            <c:forEach var="item" items="${dietReview}">
		                <div class="schedule">
		                    <div class="time">${item.time}</div>
		                    <div class="todo">${item.task}</div>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		
		</div>
	</main>
	
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>