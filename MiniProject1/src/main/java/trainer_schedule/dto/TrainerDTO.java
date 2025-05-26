package trainer_schedule.dto;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("trainer")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrainerDTO {
	@Pk
    private int trainerId;
    private String name;

  
}
