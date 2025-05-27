<%@ include file="../../layout/jstl.jsp"%>
<%@ include file="../../layout/common.jsp"%>
<jsp:include page="../../layout/header.jsp" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객의 소리</title>
    <jsp:include page="/WEB-INF/views/layout/link.jsp" />
    <link rel="stylesheet" href="<%= root %>/static/css/qna.css">
</head>
<body>
    <div style="display:flex; flex-direction:column; align-items:center; min-height:600px;">
        <div class="qna-wrap">
            <div class="qna-title">고객의 소리</div>
            <table class="qna-table">
                <thead>
                    <tr>
                        <th style="width:60px;">번호</th>
                        <th>문의 목록</th>
                        <th style="width:120px;">작성자</th>
                        <th style="width:120px;">등록일</th>
                        <th style="width:90px;">답변여부</th>
                    </tr>
                </thead>
                <tbody>
					<c:if test="${empty list}">
                        <tr>
                            <td colspan="5" class="text-center">등록된 문의가 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach var="question" items="${list}">
                        <tr>
                            <td>${question.qnaId}</td>
                            <td>
                                <a href="<c:url value='/admin/cs/detail?qnaId=${question.qnaId}'/>">
                                    ${question.title}
                                </a>
                            </td>
                            <td>${question.member.name}</td>
                            <td>${question.questionDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${question.status == null || question.status == false}">
                                        답변대기
                                    </c:when>
                                    <c:otherwise>답변완료</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <!-- 페이지네이션 - Page start, end -->
            <div class="pagination">
                <c:forEach begin="${page.start}" end="${page.end}" var="i">
                    <c:choose>
                        <c:when test="${i == page.page}">
                            <span class="current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/admin/cs?page=${i}'/>">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            
            
        </div>
    </div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>















