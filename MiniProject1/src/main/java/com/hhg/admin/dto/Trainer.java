package com.hhg.admin.dto;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Trainer")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Trainer {
	@Pk
	private int trainerId;
	private String name;
	private String phone;
	private boolean admin;
}
