
package trainer_schedule.dao;

import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import trainer_schedule.dto.TrainerDTO;

public class TrainerDAO extends BaseDAOImpl<TrainerDTO>{
	
	public List<TrainerDTO> getTrainerList() throws Exception {
	return list();
	}
}

