
package trainer_schedule.dto;

import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("member")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberScheduleDTO {
    private int memberNo;
    private String name;
    private String phone;
}

