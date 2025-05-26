package com.hhg.sales.dto;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("sales")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Sales {
	
	@Pk
	private int salesId;
	private int trainerId;
	private int amount;
	private String note;
	private Date date;

}
