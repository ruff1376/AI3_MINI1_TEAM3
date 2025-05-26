package trainer_schedule.dao;

import java.sql.*;
import java.util.*;

import trainer_schedule.dto.TrainerDTO;

public class TrainerDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/aloha", "aloha", "123456");
    }

    // ✅ 트레이너 목록 (ID + 이름)
    public List<TrainerDTO> getTrainerList() {
        List<TrainerDTO> list = new ArrayList<>();
        String sql = "SELECT trainer_id, name FROM trainer ORDER BY name";

        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ) {
            while (rs.next()) {
                TrainerDTO dto = new TrainerDTO();
                dto.setTrainerId(rs.getInt("trainer_id"));
                dto.setName(rs.getString("name"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
