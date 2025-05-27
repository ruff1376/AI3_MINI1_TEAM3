package com.hhg.cs.dto;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import com.hhg.member.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("question")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Question {
	
	@Pk
	private int qnaId;
	private int memberNo;
	private String title;
	private String question;
	private Date questionDate;
	private Boolean status;
	
	@Column(exist = false)
	private Member member; // 회원 정보 (조인용 필드)

}






