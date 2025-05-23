package trainer_schedule.service;

import java.util.List;

import trainer_schedule.dao.PTScheduleDAO;
import trainer_schedule.dto.PTScheduleDTO;

public class TrainerScheduleServiceImpl implements TrainerScheduleService {
    private PTScheduleDAO dao = new PTScheduleDAO();

    @Override
    public List<PTScheduleDTO> getScheduleByDate(String date) {
        return dao.getScheduleByDate(date);
    }

    @Override
    public void saveAll(List<PTScheduleDTO> saveList) {
        try {
            if (!saveList.isEmpty()) {
                String date = saveList.get(0).getBookDate();
                dao.deleteByDate(date);
                for (PTScheduleDTO dto : saveList) {
                    dao.insert(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // 혹은 로깅 처리
        }
    }
}
