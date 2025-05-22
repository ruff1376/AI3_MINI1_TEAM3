<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객의 소리</title>
    <!-- Bootstrap CDN (반드시 맨 위에!) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 네가 사용하는 css 파일 (schedule.css 등) -->
    <link rel="stylesheet" href="/static/css/schedule.css">
</head>
<body>
    <!-- 헤더 include, 경로 반드시 맞추기! -->
    <jsp:include page="../../layout/header.jsp" />

<%
    // 임시 문의사항 데이터 (DB연동 전)
    class Qna {
        int no;
        String title;
        String writer;
        String date;
        String answer;
        public Qna(int no, String title, String writer, String date, String answer) {
            this.no = no; this.title = title; this.writer = writer; this.date = date; this.answer = answer;
        }
    }
    List<Qna> qnaList = new ArrayList<Qna>();
    qnaList.add(new Qna(1, "운동기구 사용 문의", "한동훈", "2024-05-22", "사용법은 안내데스크에 문의하세요."));
    qnaList.add(new Qna(2, "이용권 연장 문의", "한지용", "2024-05-21", "연장은 결제창에서 가능합니다."));
    qnaList.add(new Qna(3, "환불 관련 문의", "고건우", "2024-05-20", ""));
    qnaList.add(new Qna(4, "PT 예약 문의", "박의혁", "2024-05-19", ""));
    qnaList.add(new Qna(5, "시설 관련 문의", "김건우", "2024-05-18", "시설 개선 예정입니다."));

    // 파라미터로 선택된 문의글 번호 받아오기
    String selectedNoStr = request.getParameter("no");
    int selectedNo = -1;
    if (selectedNoStr != null) {
        try { selectedNo = Integer.parseInt(selectedNoStr); } catch(Exception e) {}
    }
    Qna selectedQna = null;
    for (Qna q : qnaList) {
        if (q.no == selectedNo) { selectedQna = q; break; }
    }
%>

<div class="container my-5">
    <h2 class="mb-4">고객의 소리</h2>
    <!-- 문의 목록 테이블 -->
    <table class="table table-bordered table-hover align-middle text-center">
        <thead class="table-info">
            <tr>
                <th style="width:60px;">번호</th>
                <th>문의 목록</th>
                <th style="width:120px;">작성자</th>
                <th style="width:120px;">등록일</th>
            </tr>
        </thead>
        <tbody>
        <% for(Qna q : qnaList) { %>
            <tr class="<%= (selectedNo==q.no) ? "table-primary" : "" %>">
                <td><%= q.no %></td>
                <td>
                    <a href="QnAList.jsp?no=<%= q.no %>" class="text-decoration-underline"><%= q.title %></a>
                </td>
                <td><%= q.writer %></td>
                <td><%= q.date %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <!-- 페이지네이션 -->
    <div class="text-center my-3">
        <a href="?page=1">1</a> <a href="?page=2">2</a> <a href="?page=3">3</a> <a href="?page=4">4</a> <a href="?page=5">5</a>
    </div>

    <!-- 답변 작성/조회 영역 -->
    <% if (selectedQna != null) { %>
    <form method="post" action="QnAList.jsp" class="mt-4">
        <input type="hidden" name="no" value="<%= selectedQna.no %>">
        <div class="mb-3 p-4 rounded" style="background:#d5f3ff;">
            <label for="answer" class="form-label fw-bold">답변:</label>
            <textarea id="answer" name="answer" rows="6" class="form-control" style="font-size:16px;"><%= selectedQna.answer==null?"":selectedQna.answer %></textarea>
        </div>
        <div class="text-end">
            <button type="button" onclick="location.href='QnAList.jsp'" class="btn btn-outline-info me-2">취소</button>
            <button type="submit" class="btn btn-info">저장</button>
        </div>
    </form>
    <% } %>
</div>

    <!-- 푸터 include, 경로 반드시 맞추기! -->
    <jsp:include page="../../layout/footer.jsp" />
</body>
</html>
