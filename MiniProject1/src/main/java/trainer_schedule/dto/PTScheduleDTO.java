package trainer_schedule.dto;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("pt_schedule")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PTScheduleDTO {
	@Pk
    private int trainerId;
    private int memberNo;
    private String bookDate; // "YYYY-MM-DD"
    private String bookTime; // "HH:mm"
    private String note;     // 선택 사항

   
}
