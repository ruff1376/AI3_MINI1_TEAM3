package trainer_schedule.dao;

import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import trainer_schedule.dto.PTScheduleDTO;

public class PTScheduleDAO extends BaseDAOImpl<PTScheduleDTO>{
    

	// ✅ 기존 getScheduleByDate() 기능 대체
    public List<PTScheduleDTO> getScheduleByDate(String date) throws Exception {
        if (date == null || date.trim().isEmpty()) {
            return List.of();
        }

        return listBy(Map.of("book_date", date));
    }

    // ✅ 기존 deleteByDate() 기능 대체
    public void deleteByDate(String bookDate) throws Exception {
        deleteBy(Map.of("book_date", bookDate));
    }

}
