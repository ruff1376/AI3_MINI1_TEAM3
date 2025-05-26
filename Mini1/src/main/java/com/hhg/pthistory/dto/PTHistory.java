package com.hhg.pthistory.dto;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("pt_history")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PTHistory {
	@Pk
	private int historyId;
	private int memberNo;
	private int totalCount;
	private int usedCount;
	private int remainCount;
}
