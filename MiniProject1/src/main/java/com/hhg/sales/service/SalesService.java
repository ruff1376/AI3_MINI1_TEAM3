package com.hhg.sales.service;

import java.util.List;

import com.hhg.sales.dto.Sales;

public interface SalesService {

	// 매출 리스트
	Sales findById(int salesId);
	// 매출 등록
	Sales insert(Sales sales);
	// 매출 수정
	boolean update(Sales sales);
	// 트레이너별 매출 조회
	List<Sales> findByTrainerId(int trainerId);
	// 전체 매출 조회
	List<Sales> findAll();
	
	// 매출 삭제
	boolean delete(int no);
}
