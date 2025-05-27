package com.hhg.cs.dto;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import com.hhg.admin.dto.Trainer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("comment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comment {
	
	@Pk
	private int qnaId;
	private int trainerId;
	private String comment;
	private Date commentDate;

	@Column(exist = false)
	private Trainer trainer; // 트레이너 정보 (조인용 필드)
}



