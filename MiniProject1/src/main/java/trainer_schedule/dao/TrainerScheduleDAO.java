package trainer_schedule.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import trainer_schedule.dto.TrainerScheduleDTO;

public class TrainerScheduleDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/health";
    private static final String USER = "aloha";
    private static final String PASSWORD = "123456";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ✅ 특정 날짜의 스케줄 조회
    public List<TrainerScheduleDTO> getScheduleByDate(String date) {
        List<TrainerScheduleDTO> list = new ArrayList<>();
        String sql = "SELECT trainer_name, time_range, memo, is_checked FROM trainer_schedule WHERE schedule_date = ?";
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, date);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                TrainerScheduleDTO dto = new TrainerScheduleDTO();
                dto.setScheduleDate(date);
                dto.setTrainer(rs.getString("trainer_name"));
                dto.setTime(rs.getString("time_range"));
                dto.setMemo(rs.getString("memo"));
                dto.setChecked(rs.getBoolean("is_checked"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ 저장 (있으면 수정, 없으면 삽입)
    public void save(TrainerScheduleDTO dto) throws Exception {
        String sql = "REPLACE INTO trainer_schedule (schedule_date, trainer_name, time_range, memo, is_checked) VALUES (?, ?, ?, ?, ?)";
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, dto.getScheduleDate());
            pstmt.setString(2, dto.getTrainer());
            pstmt.setString(3, dto.getTime());
            pstmt.setString(4, dto.getMemo());
            pstmt.setBoolean(5, dto.isChecked());
            pstmt.executeUpdate();
        }
    }

    // ✅ 삭제
    public void delete(String date, String trainer, String time) throws Exception {
        String sql = "DELETE FROM trainer_schedule WHERE schedule_date = ? AND trainer_name = ? AND time_range = ?";
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, date);
            pstmt.setString(2, trainer);
            pstmt.setString(3, time);
            pstmt.executeUpdate();
        }
    }
}
