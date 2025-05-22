package trainer_schedule.service;

import java.util.List;
import trainer_schedule.dto.TrainerScheduleDTO;

public interface TrainerScheduleService {
    List<TrainerScheduleDTO> getScheduleByDate(String date);

    void saveAll(List<TrainerScheduleDTO> saveList, List<TrainerScheduleDTO> deleteList); // ✅ 추가
}
