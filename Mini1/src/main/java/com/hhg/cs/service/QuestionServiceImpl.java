package com.hhg.cs.service;

import java.util.List;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;
import com.hhg.common.service.BaseServiceImpl;
import com.hhg.cs.dao.QuestionDAO;
import com.hhg.cs.dto.Question;
import com.hhg.member.dto.Member;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;

public class QuestionServiceImpl extends BaseServiceImpl<QuestionDAO, Question> implements QuestionService {

	MemberService memberService = new MemberServiceImpl();
	
	public QuestionServiceImpl(QuestionDAO dao) {
		super(dao);
	}

	@Override
	public PageInfo<Question> pageJoinUser(int page, int pageSize) {
		PageInfo<Question> pageInfo = null;
		Page pageObj = new Page(page, pageSize);
		List<Question> list = null;
		int count = 0;
		try {
			count = dao.count();
			System.out.println("count: " + count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			pageInfo = dao.page(pageObj);
			pageObj = pageInfo.getPage();
			pageObj.setTotal(count); // 전체 데이터 수 설정
			
			list = pageInfo.getList();
			if (list != null && !list.isEmpty()) {
				for (Question question : list) {
					Member member =  memberService.select(question.getMemberNo()); // 회원 정보 조회
					if (member != null) {
						question.setMember(member); // 회원 정보를 Question 객체에 설정
					} else {
						question.setMember(new Member()); // 회원 정보가 없을 경우 빈 Member 객체 설정
					}
//					System.out.println(question);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pageInfo;
	}

	@Override
	public int update(Question question, String... fields) {
		int result = 0;
		
		try {
			result = dao.update(question, fields);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}





