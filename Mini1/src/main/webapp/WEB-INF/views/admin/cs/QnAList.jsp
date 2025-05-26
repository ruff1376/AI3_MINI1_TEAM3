<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hhg.cs.QnADTO" %>
<%@ page import="java.util.*" %>
<%
    List<QnADTO> pageList = (List<QnADTO>)request.getAttribute("pageList");
    int pageNum = (Integer)request.getAttribute("pageNum");
    int totalPage = (Integer)request.getAttribute("totalPage");
    QnADTO selectedQna = (QnADTO)request.getAttribute("selectedQna");
    String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객의 소리</title>
    <link rel="stylesheet" href="<%=root%>/static/css/qna.css">
</head>
<body>
    <!-- 헤더 include -->
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />

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
                <% if (pageList != null) for(QnADTO q : pageList) { %>
                    <tr class="<%= (selectedQna!=null && selectedQna.getId()==q.getId()) ? "selected" : "" %>">
                        <td><%= q.getId() %></td>
                        <td>
                            <a href="<%=root%>/cs/qna/list?page=<%=pageNum%>&no=<%= q.getId() %>" style="color:#1976d2; text-decoration:underline;">
                                <%= q.getTitle() %>
                            </a>
                        </td>
                        <td><%= q.getWriter() %></td>
                        <td><%= q.getDate() %></td>
                        <td>
                        <%
                            String a = q.getAnswer();
                            if (a != null && !a.trim().isEmpty()) {
                        %>
                            <span class="badge-answer badge-done">답변완료</span>
                        <%
                            } else {
                        %>
                            <span class="badge-answer badge-notyet">미완료</span>
                        <%
                            }
                        %>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
            <div class="pagination">
                <% for (int i=1; i<= totalPage; i++) { %>
                    <a href="<%=root%>/cs/qna/list?page=<%=i%>" class="<%= (i==pageNum)?"active":"" %>"><%=i%></a>
                <% } %>
            </div>
            <% if (selectedQna != null) { %>
            <form method="post" action="<%=root%>/cs/qna/list?page=<%=pageNum%>&no=<%=selectedQna.getId()%>" class="qna-answerbox">
                <input type="hidden" name="no" value="<%= selectedQna.getId() %>">
                <label for="answer">답변:</label>
                <textarea id="answer" name="answer" rows="6"><%= selectedQna.getAnswer()==null?"":selectedQna.getAnswer() %></textarea>
                <div class="qna-btn-row">
                    <button type="button" onclick="location.href='<%=root%>/cs/qna/list?page=<%=pageNum%>'" class="qna-btn cancel">취소</button>
                    <button type="submit" class="qna-btn">저장</button>
                </div>
            </form>
            <% } %>
        </div>
    </div>

    <!-- 푸터 include -->
    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
