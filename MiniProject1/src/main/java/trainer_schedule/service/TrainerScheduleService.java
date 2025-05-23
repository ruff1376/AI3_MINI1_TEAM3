package trainer_schedule.service;

import java.util.List;
import trainer_schedule.dto.PTScheduleDTO;

public interface TrainerScheduleService {
    List<PTScheduleDTO> getScheduleByDate(String date);

    void saveAll(List<PTScheduleDTO> saveList); // deleteList 제거
}

