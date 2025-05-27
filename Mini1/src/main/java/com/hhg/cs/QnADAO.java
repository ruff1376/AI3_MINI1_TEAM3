package com.hhg.cs;

import com.hhg.util.DBUtil;
import java.sql.*;
import java.util.*;

public class QnADAO {
    public static List<QnADTO> getAll() {
        List<QnADTO> list = new ArrayList<>();
        String sql = "SELECT * FROM qna ORDER BY id DESC";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
        ) {
            while (rs.next()) {
                QnADTO q = new QnADTO();
                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setWriter(rs.getString("writer"));
                q.setDate(rs.getString("date"));
                q.setAnswer(rs.getString("answer"));
                list.add(q);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return list;
    }

    public static QnADTO getById(int id) {
        String sql = "SELECT * FROM qna WHERE id=?";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    QnADTO q = new QnADTO();
                    q.setId(rs.getInt("id"));
                    q.setTitle(rs.getString("title"));
                    q.setWriter(rs.getString("writer"));
                    q.setDate(rs.getString("date"));
                    q.setAnswer(rs.getString("answer"));
                    return q;
                }
            }
        } catch(Exception e) { e.printStackTrace(); }
        return null;
    }

    public static void updateAnswer(int id, String answer) {
        String sql = "UPDATE qna SET answer=? WHERE id=?";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setString(1, answer);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
    }

    public static int getTotal() {
        String sql = "SELECT COUNT(*) FROM qna";
        try (
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
        ) {
            if (rs.next()) return rs.getInt(1);
        } catch(Exception e) { e.printStackTrace(); }
        return 0;
    }
}
