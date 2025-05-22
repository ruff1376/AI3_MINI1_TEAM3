package trainer_schedule.dao;

import java.sql.*;
import java.util.*;

public class TrainerDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/health";
    private static final String USER = "aloha";
    private static final String PASSWORD = "123456";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ✅ trainer_schedule 테이블에서 고유 트레이너 이름 목록 추출
    public List<String> getTrainerNames() {
        List<String> trainerList = new ArrayList<>();
        String sql = "SELECT DISTINCT trainer_name FROM trainer_schedule ORDER BY trainer_name";
        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ) {
            while (rs.next()) {
                trainerList.add(rs.getString("trainer_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return trainerList;
    }
}
