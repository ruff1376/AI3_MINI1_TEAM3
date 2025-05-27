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
                <tr>
                	<td>번호</td>
                	<td>${ question.qnaId }</td>
                	<td>답변상태</td>
                	<td>
                		<c:choose>
                			<c:when test="${question.status == null || question.status == false}">답변대기</c:when>
                			<c:otherwise>답변완료</c:otherwise>
                		</c:choose>
                	</td>
                </tr>
               	<tr>
                	<td>작성자</td>
                	<td>${ question.member.name }</td>
                	<td>등록일</td>
                	<td>${ question.questionDate }</td>
               	</tr>
                <tr>
                	<td>제목</td>
                	<td colspan="3">${ question.title }</td>
               	</tr>
               	<tr>
                   	<td colspan="4">
                   	    <p class="text-start p-1">
	                   		${ question.question }
                   	    </p>
                   	</td>
                 </tr>
            </table>
            
        </div>
        <hr>
        
        <form action="${ root }/admin/cs" method="post" class="w-100">
	       	<input type="hidden" name="qnaId" value="${question.qnaId}">
	        <div class="qna-wrap">
	            <div class="qna-title">답변하기</div>
                <table class="qna-table">
                    <tr>
                        <td>트레이너</td>
                        <td colspan="3">
                            <select name="trainerId" required class="form-select">
                                <option value="">트레이너 선택</option>
                                <c:forEach var="trainer" items="${trainerList}">
                                	<c:if test="${trainer.trainerId == comment.trainerId}">
                                    	<option value="${trainer.trainerId}" selected>${trainer.name}</option>
                                	</c:if>
                                	<c:if test="${trainer.trainerId != comment.trainerId}">
                                    	<option value="${trainer.trainerId}">${trainer.name}</option>
                                	</c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>답변</td>
                        <td colspan="3">
                            <textarea name="comment" class="form-control" rows="5" cols="50" required>${ comment.comment }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="text-end">
                            <button type="submit" class="btn btn-primary">답변 저장</button>
                        </td>
                    </tr>
                </table>
	        </div>
        </form>
    </div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
