package com.hhg.cs;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class QnAReplyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/your_database_name", "your_user", "your_password"
            );

            QnADAO dao = new QnADAO(conn);
            List<QnADTO> list = dao.selectAll();
            req.setAttribute("qnaList", list);

            String idParam = req.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                QnADTO qna = dao.selectOne(id);
                req.setAttribute("qna", qna);
            }

            RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/cs/QnA_Reply.jsp");
            dispatcher.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(500, "DB Error");
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
