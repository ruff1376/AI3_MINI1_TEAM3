<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>문의사항 답변</title>
    <link rel="stylesheet" href="/css/qna.css">
</head>
<body>
<main class="container">
    <h2>고객의 소리</h2>

    <!-- 문의 목록 테이블 -->
    <table border="1" width="100%">
        <tr><th>문의 목록</th></tr>
        <c:forEach var="q" items="${qnaList}">
            <tr>
                <td><a href="?id=${q.id}">${q.title}</a></td>
            </tr>
        </c:forEach>
    </table>

    <!-- 페이지네이션 -->
    <div style="text-align:center; margin:10px;">
        <a href="?page=1">1</a> <a href="?page=2">2</a> <a href="?page=3">3</a> <a href="?page=4">4</a> <a href="?page=5">5</a>
    </div>

    <!-- 답변 작성 -->
    <form action="/QnaReplyServlet" method="post">
        <input type="hidden" name="id" value="${qna.id}">
        <div>
            <label>답변:</label><br>
            <textarea name="answer" rows="5" cols="80">${qna.answer}</textarea>
        </div>
        <div style="margin-top:10px;">
            <button type="reset">취소</button>
            <button type="submit">저장</button>
        </div>
    </form>
</main>
<jsp:include page="/views/layout/footer.jsp" />
</body>
</html>
