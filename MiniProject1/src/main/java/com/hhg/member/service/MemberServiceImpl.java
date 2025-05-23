package com.hhg.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.member.dao.MemberDAO;
import com.hhg.member.dto.Member;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO = new MemberDAO();
	
	@Override
	public List<Member> list() {
		List<Member> list = null;
		try {
			list = memberDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Member select(int no) {
		return null;
	}
	
	@Override
	public Member selectById(int no) {
		Member member = null;
		try {
			Map<Object, Object> map = new HashMap<>();
			map.put("no", no);
			member = memberDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public Member insert(Member member) {
		return null;
	}

	@Override
	public boolean update(Member member) {
		return false;
	}

	@Override
	public boolean delete(Member member) {
		return false;
	}

}
