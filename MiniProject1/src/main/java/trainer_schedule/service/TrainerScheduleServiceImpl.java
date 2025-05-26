package trainer_schedule.service;

import java.util.List;

import trainer_schedule.dao.TrainerScheduleDAO;
import trainer_schedule.dto.TrainerScheduleDTO;

public class TrainerScheduleServiceImpl implements TrainerScheduleService {
    private TrainerScheduleDAO dao = new TrainerScheduleDAO();

    @Override
    public List<TrainerScheduleDTO> getScheduleByDate(String date) {
        return dao.getScheduleByDate(date);
    }

    @Override
    public void saveAll(List<TrainerScheduleDTO> saveList, List<TrainerScheduleDTO> deleteList) {
        try {
            for (TrainerScheduleDTO dto : saveList) {
                dao.save(dto);
            }
            for (TrainerScheduleDTO dto : deleteList) {
                dao.delete(dto.getScheduleDate(), dto.getTrainer(), dto.getTime());
            }
        } catch (Exception e) {
            e.printStackTrace(); // 또는 로깅
        }
    }
}
