package com.hhg.machine.dto;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("gym_machine")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GymMachine {
	
	@Pk
	private int gymMachineId;
	private String name;
	private String brand;
	private String category;
	private String status;
}