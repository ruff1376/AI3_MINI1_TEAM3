package trainer_schedule.dao;

import java.sql.*;
import java.util.*;

import trainer_schedule.dto.MemberScheduleDTO;

public class MemberScheduleDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/aloha", "aloha", "123456");
    }

    // ✅ 전체 회원 목록
    public List<MemberScheduleDTO> getAllMembers() {
        List<MemberScheduleDTO> list = new ArrayList<>();
        String sql = "SELECT member_no, name, phone FROM member ORDER BY name";

        try (
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ) {
            while (rs.next()) {
                MemberScheduleDTO dto = new MemberScheduleDTO();
                dto.setMemberNo(rs.getInt("member_no"));
                dto.setName(rs.getString("name"));
                dto.setPhone(rs.getString("phone"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
