package com.hhg.cs.service;

import com.alohaclass.jdbc.dto.PageInfo;
import com.hhg.common.service.BaseService;
import com.hhg.cs.dto.Question;

public interface QuestionService extends BaseService<Question> {
	
	// pageJoinUser
	PageInfo<Question> pageJoinUser(int page, int pageSize); // 페이징 리스트 (page: 페이지 번호, pageSize: 페이지당 데이터 수)

	int update(Question question, String... fields); // 질문 수정

}
