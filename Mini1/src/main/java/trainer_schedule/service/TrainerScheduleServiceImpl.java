
package trainer_schedule.service;

import java.util.List;
import java.util.Map;

import trainer_schedule.dao.PTScheduleDAO;
import trainer_schedule.dto.PTScheduleDTO;

public class TrainerScheduleServiceImpl implements TrainerScheduleService {
    private PTScheduleDAO dao = new PTScheduleDAO();

    @Override
    public List<PTScheduleDTO> getScheduleByDate(String date) {
        try {
            if (date == null || date.trim().isEmpty()) return List.of();
            return dao.listBy(Map.of("book_date", date));
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    @Override
    public void saveAll(List<PTScheduleDTO> saveList) {
        try {
            if (!saveList.isEmpty()) {
                String date = saveList.get(0).getBookDate();
                dao.deleteBy(Map.of("book_date", date)); // ✅ 간결한 삭제
                for (PTScheduleDTO dto : saveList) {
                    dao.insert(dto); // ✅ 자동 insert
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // 혹은 로깅
        }
    }
}
