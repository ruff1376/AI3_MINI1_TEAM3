package com.machine.dto;


import com.alohaclass.jdbc.annotation.Pk;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Machine {
	
	@Pk
	private int gymMachineId;
	private String name;
	private String brand;
	private String category;
	private String status;
	private String comment;
}
