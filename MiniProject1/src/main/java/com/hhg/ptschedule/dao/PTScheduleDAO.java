package com.hhg.ptschedule.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;
import com.hhg.ptschedule.dto.PTSchedule;

public class PTScheduleDAO extends BaseDAOImpl<PTSchedule> {
	
	@Override
	public List<PTSchedule> list() {
	    List<PTSchedule> list = new ArrayList<>();

	    String sql = """
	        SELECT 
			    s.*, 
			    m.name AS member_name
			FROM pt_schedule s
			JOIN member m ON s.member_no = m.member_no
			ORDER BY s.book_date, s.book_time, m.name;
	    """;
	    
	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        while (rs.next()) {
	            PTSchedule pt = new PTSchedule();

	            pt.setScheduleId(rs.getInt("schedule_id"));
	            pt.setTrainerId(rs.getInt("trainer_id"));
	            pt.setMemberNo(rs.getInt("member_no"));
	            pt.setBookDate(rs.getDate("book_date").toLocalDate()); // or getString
	            pt.setBookTime(rs.getTime("book_time").toLocalTime()); // or getString
	            pt.setNote(rs.getString("note"));
	            
	            pt.setMemberName(rs.getString("member_name")); // ✅ JOIN한 이름 세팅

	            list.add(pt);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
