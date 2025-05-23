package com.hhg.admin.dto;

import java.util.List;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import com.hhg.sales.dto.Sales;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("trainer")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Trainer {
	@Pk
	private int trainerId;
	private String name;
	private String phone;
	private boolean admin;
	
	@Column(exist = false)
	private List<Sales> salesList;
}
