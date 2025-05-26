package com.hhg.cs;

import com.hhg.cs.QnADTO;
import com.hhg.cs.QnADAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cs/qna/list")
public class QnAListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int pageNum = 1;
        int pageSize = 5;
        String pageStr = req.getParameter("page");
        if (pageStr != null) try { pageNum = Integer.parseInt(pageStr); } catch(Exception e){}

        int total = QnADAO.getTotal();
        int totalPage = (int)Math.ceil(total / (double)pageSize);
        int start = (pageNum-1)*pageSize;
        int end = Math.min(start+pageSize, total);
        List<QnADTO> qnaAll = QnADAO.getAll();
        List<QnADTO> pageList = qnaAll.subList(start, end);

        req.setAttribute("pageList", pageList);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("totalPage", totalPage);

        String noStr = req.getParameter("no");
        QnADTO selectedQna = null;
        if (noStr != null) {
            try { selectedQna = QnADAO.getById(Integer.parseInt(noStr)); } catch(Exception e){}
        }
        req.setAttribute("selectedQna", selectedQna);

        req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnAList.jsp").forward(req, res);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int pageNum = 1;
        String pageStr = req.getParameter("page");
        if (pageStr != null) try { pageNum = Integer.parseInt(pageStr); } catch(Exception e){}

        try {
            int no = Integer.parseInt(req.getParameter("no"));
            String answer = req.getParameter("answer");
            QnADAO.updateAnswer(no, answer);
        } catch(Exception e){}

        // 답변 저장 후 GET으로 리다이렉트 (항상 목록으로 복귀)
        res.sendRedirect(req.getContextPath() + "/cs/qna/list?page=" + pageNum);
    }
}
