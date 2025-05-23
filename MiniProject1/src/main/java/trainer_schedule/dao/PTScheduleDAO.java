package trainer_schedule.dao;

import java.sql.*;
import java.util.*;

import trainer_schedule.dto.PTScheduleDTO;

public class PTScheduleDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/aloha", "aloha", "123456");
    }

    // ✅ 날짜별 예약된 스케줄 전체 조회
    public List<PTScheduleDTO> getScheduleByDate(String date) {
        // ⛔ 잘못된 date 값은 SQL 실행 없이 빈 리스트 반환
        if (date == null || date.trim().isEmpty()) {
            return new ArrayList<>();
        }

        List<PTScheduleDTO> list = new ArrayList<>();
        String sql = "SELECT trainer_id, member_no, book_time, note FROM pt_schedule WHERE book_date = ?";

        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, date);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                PTScheduleDTO dto = new PTScheduleDTO();
                dto.setTrainerId(rs.getInt("trainer_id"));
                dto.setMemberNo(rs.getInt("member_no"));
                dto.setBookTime(rs.getString("book_time"));
                dto.setNote(rs.getString("note"));
                dto.setBookDate(date); // 이건 전달받은 date 그대로 사용
                list.add(dto);
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace(); // 또는 로깅 처리
        }

        return list;
    }

    // ✅ 저장 메서드도 필요하다면 추가로 작성
    public void insert(PTScheduleDTO dto) throws Exception {
        String sql = "INSERT INTO pt_schedule (trainer_id, member_no, book_date, book_time, note) VALUES (?, ?, ?, ?, ?)";
        
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setInt(1, dto.getTrainerId());
            pstmt.setInt(2, dto.getMemberNo());
            pstmt.setString(3, dto.getBookDate());
            pstmt.setString(4, dto.getBookTime());
            pstmt.setString(5, dto.getNote());
            pstmt.executeUpdate();
        }
    }
    
    public void deleteByDate(String bookDate) throws Exception {
        String sql = "DELETE FROM pt_schedule WHERE book_date = ?";
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, bookDate);
            pstmt.executeUpdate();
        }
    }
}
