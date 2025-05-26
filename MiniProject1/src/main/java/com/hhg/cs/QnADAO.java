package com.hhg.cs;

import java.sql.*;
import java.util.*;

public class QnADAO {
	private Connection conn;

	public QnADAO(Connection conn) {
		this.conn = conn;
	}

	public List<QnADTO> selectAll() throws Exception {
		List<QnADTO> list = new ArrayList<>();
		String sql = "SELECT * FROM qna ORDER BY id DESC";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			QnADTO dto = new QnADTO();
			dto.setId(rs.getInt("id"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setAnswer(rs.getString("answer"));
			list.add(dto);
		}
		return list;
	}

	public QnADTO selectOne(int id) throws Exception {
		String sql = "SELECT * FROM qna WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			QnADTO dto = new QnADTO();
			dto.setId(rs.getInt("id"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setAnswer(rs.getString("answer"));
			return dto;
		}
		return null;
	}

	public void updateAnswer(int id, String answer) throws Exception {
		String sql = "UPDATE qna SET answer=? WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, answer);
		ps.setInt(2, id);
		ps.executeUpdate();
	}
}
