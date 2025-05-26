package com.hhg.ptschedule.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("pt_schedule")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PTSchedule {
	@Pk
	private int scheduleId;
	private int trainerId;
	private int memberNo;
	private LocalDate bookDate;
	private LocalTime bookTime;
	private String note;
	private String memberName;
}
