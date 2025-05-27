package com.hhg.cs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/admin/cs")
public class QnAListServlet extends HttpServlet {

    static class QnADTO implements java.io.Serializable {
        int id;
        String title, writer, date, answer;
        public QnADTO(int id, String title, String writer, String date, String answer) {
            this.id = id; this.title = title; this.writer = writer; this.date = date; this.answer = answer;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // 세션에서 리스트 꺼내기
        List<QnADTO> allList = (List<QnADTO>) session.getAttribute("allList");

        // 없으면 초기 데이터 생성
        if (allList == null) {
            allList = new ArrayList<>();
            allList.add(new QnADTO(1, "첫번째 문의입니다", "홍길동", "2024-05-28", ""));
            allList.add(new QnADTO(2, "두번째 문의입니다", "김철수", "2024-05-28", ""));
            allList.add(new QnADTO(3, "세번째 문의입니다", "이영희", "2024-05-28", "답변이 등록되었습니다."));
            // ... (필요 시 더 추가) ...
            session.setAttribute("allList", allList);
        }

        // 페이징 처리
        int pageSize = 5;
        int pageNum = 1;
        String pageStr = req.getParameter("page");
        if (pageStr != null) {
            try {
                pageNum = Integer.parseInt(pageStr);
            } catch (Exception e) {
                pageNum = 1;
            }
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
        String noStr = req.getParameter("no");
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
            } catch (Exception e) {}
        }

        // JSP로 데이터 전달
        req.setAttribute("pageList", pageList);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("selectedQna", selectedQna);

        req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnAList.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<QnADTO> allList = (List<QnADTO>) session.getAttribute("allList");

        if (allList == null) {
            // 세션 만료 등 예외 처리 필요
            res.sendRedirect(req.getContextPath() + "/admin/cs");
            return;
        }

        String noStr = req.getParameter("no");
        String answer = req.getParameter("answer");
        int pageNum = 1;
        String pageStr = req.getParameter("page");
        if (pageStr != null) {
            try {
                pageNum = Integer.parseInt(pageStr);
            } catch (Exception e) {
                pageNum = 1;
            }
        }

        if (noStr != null && answer != null) {
            try {
                int no = Integer.parseInt(noStr);
                for (QnADTO q : allList) {
                    if (q.id == no) {
                        q.answer = answer;
                        break;
                    }
                }
                // 세션에 다시 저장
                session.setAttribute("allList", allList);
            } catch (Exception e) {
                // 예외 무시
            }
        }

        // 저장 후 리다이렉트하여 doGet 실행 (POST-Redirect-GET 패턴)
        res.sendRedirect(req.getContextPath() + "/admin/cs?page=" + pageNum + "&no=" + noStr);
    }
}
