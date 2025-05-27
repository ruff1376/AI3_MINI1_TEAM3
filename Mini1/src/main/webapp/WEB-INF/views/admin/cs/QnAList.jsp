<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<%
    // QnADTO 클래스 (Serializable 필요)
    class QnADTO implements java.io.Serializable {
        public int id;
        public String title, writer, date, answer;
        public QnADTO(int id, String title, String writer, String date, String answer) {
            this.id = id; this.title = title; this.writer = writer; this.date = date; this.answer = answer;
        }
    }

    // 세션에서 리스트 꺼내기
    List<QnADTO> allList = (List<QnADTO>) session.getAttribute("allList");

    // 초기 데이터 없으면 생성 후 세션에 저장
    if (allList == null) {
        allList = new ArrayList<>();
        allList.add(new QnADTO(1, "첫번째 문의입니다", "홍길동", "2024-05-28", ""));
        allList.add(new QnADTO(2, "두번째 문의입니다", "김철수", "2024-05-28", ""));
        allList.add(new QnADTO(3, "세번째 문의입니다", "이영희", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(4, "네번째 문의입니다", "박민수", "2024-05-28", ""));
        allList.add(new QnADTO(5, "다섯번째 문의입니다", "최지우", "2024-05-28", ""));
        allList.add(new QnADTO(6, "여섯번째 문의입니다", "강예은", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(7, "일곱번째 문의입니다", "정하늘", "2024-05-28", ""));
        allList.add(new QnADTO(8, "여덟번째 문의입니다", "한상욱", "2024-05-28", ""));
        allList.add(new QnADTO(9, "아홉번째 문의입니다", "오지민", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(10, "열번째 문의입니다", "조민정", "2024-05-28", ""));
        allList.add(new QnADTO(11, "열한번째 문의입니다", "김태현", "2024-05-28", ""));
        allList.add(new QnADTO(12, "열두번째 문의입니다", "임유진", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(13, "열세번째 문의입니다", "서지호", "2024-05-28", ""));
        allList.add(new QnADTO(14, "열네번째 문의입니다", "류현지", "2024-05-28", ""));
        allList.add(new QnADTO(15, "열다섯번째 문의입니다", "이승훈", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(16, "열여섯번째 문의입니다", "권나영", "2024-05-28", ""));
        allList.add(new QnADTO(17, "열일곱번째 문의입니다", "안지민", "2024-05-28", ""));
        allList.add(new QnADTO(18, "열여덟번째 문의입니다", "문주희", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(19, "열아홉번째 문의입니다", "조성우", "2024-05-28", ""));
        allList.add(new QnADTO(20, "스무번째 문의입니다", "박민규", "2024-05-28", ""));
        allList.add(new QnADTO(21, "스물한번째 문의입니다", "김유진", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(22, "스물두번째 문의입니다", "이준영", "2024-05-28", ""));
        allList.add(new QnADTO(23, "스물세번째 문의입니다", "윤혜림", "2024-05-28", ""));
        allList.add(new QnADTO(24, "스물네번째 문의입니다", "신정은", "2024-05-28", "답변이 등록되었습니다."));
        allList.add(new QnADTO(25, "스물다섯번째 문의입니다", "남지우", "2024-05-28", ""));
        session.setAttribute("allList", allList);
    }

    // 저장 (POST) 시 답변 업데이트 및 세션 저장
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String noStr = request.getParameter("no");
        String answer = request.getParameter("answer");
        if (noStr != null && answer != null) {
            try {
                int no = Integer.parseInt(noStr);
                for (QnADTO q : allList) {
                    if (q.id == no) {
                        q.answer = answer;
                        break;
                    }
                }
                session.setAttribute("allList", allList);
            } catch (Exception e) {
            }
        }
    }

    // 페이징 처리
    int pageSize = 5;
    int pageNum = 1;
    String pageStr = request.getParameter("page");
    if (pageStr != null) try {
        pageNum = Integer.parseInt(pageStr);
    } catch (Exception e) {
    }

    int total = allList.size();
    int totalPage = (int) Math.ceil(total / (double) pageSize);
    if (totalPage == 0) totalPage = 1;
    if (pageNum < 1) pageNum = 1;
    if (pageNum > totalPage) pageNum = totalPage;

    int start = (pageNum - 1) * pageSize;
    int end = Math.min(start + pageSize, total);
    List<QnADTO> pageList = allList.subList(start, end);

    // 상세 문의 선택
    String noStr = request.getParameter("no");
    QnADTO selectedQna = null;
    if (noStr != null) {
        try {
            int no = Integer.parseInt(noStr);
            for (QnADTO q : allList) {
                if (q.id == no) {
                    selectedQna = q;
                    break;
                }
            }
        } catch (Exception e) {
        }
    }
    String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객의 소리</title>
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
                    <% for (QnADTO q : pageList) { %>
                    <tr class="<%= (selectedQna != null && selectedQna.id == q.id) ? "selected" : "" %>">
                        <td><%= q.id %></td>
                        <td>
                            <a href="?page=<%= pageNum %>&no=<%= q.id %>" style="color:#1976d2; text-decoration:underline;">
                                <%= q.title %>
                            </a>
                        </td>
                        <td><%= q.writer %></td>
                        <td><%= q.date %></td>
                        <td>
                            <% if (q.answer != null && !q.answer.trim().isEmpty()) { %>
                            <span class="badge-answer badge-done">답변완료</span>
                            <% } else { %>
                            <span class="badge-answer badge-notyet">미완료</span>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="pagination">
                <% for (int i = 1; i <= totalPage; i++) { %>
                <a href="?page=<%= i %>" class="<%= (i == pageNum) ? "active" : "" %>"><%= i %></a>
                <% } %>
            </div>
            <% if (selectedQna != null) { %>
            <form method="post" action="?page=<%= pageNum %>&no=<%= selectedQna.id %>" class="qna-answerbox">
                <input type="hidden" name="no" value="<%= selectedQna.id %>">
                <label for="answer">답변:</label>
                <textarea id="answer" name="answer" rows="6"><%= selectedQna.answer == null ? "" : selectedQna.answer %></textarea>
                <div class="qna-btn-row">
                    <button type="button" onclick="location.href='?page=<%= pageNum %>'" class="qna-btn cancel">취소</button>
                    <button type="submit" class="qna-btn">저장</button>
                </div>
            </form>
            <% } %>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>
