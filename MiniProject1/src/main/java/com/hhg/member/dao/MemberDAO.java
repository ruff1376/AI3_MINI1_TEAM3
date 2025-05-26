package com.hhg.member.dao;

import java.util.HashMap;
import java.util.Map;

import com.alohaclass.jdbc.dao.BaseDAOImpl;
import com.hhg.member.dto.Member;

public class MemberDAO extends BaseDAOImpl<Member> {

	public Member selectById(int no) {
		Member member = null;
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("no", no);
			member = selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

}
