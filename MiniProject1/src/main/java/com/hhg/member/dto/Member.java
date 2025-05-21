package com.hhg.member.dto;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("Member")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	@Pk
	private int memberNo;
	private String name;
	private String memberId;
	private String password;
	private String phone;
	private Date joinDate;
	private Date expireDate;
	private boolean admin;
}
