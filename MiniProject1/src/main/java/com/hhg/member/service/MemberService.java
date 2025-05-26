package com.hhg.member.service;

import java.util.List;

import com.hhg.member.dto.Member;

public interface MemberService {
	List<Member> list();
	Member select(int no);
	Member selectById(String id);
	Member insert(Member member);
	boolean update(Member member);
	boolean delete(Member member);
}
