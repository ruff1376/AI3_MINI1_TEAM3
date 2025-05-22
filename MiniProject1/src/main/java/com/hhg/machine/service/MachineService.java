package com.hhg.machine.service;

import java.util.List;

import com.hhg.machine.dto.GymMachine;


public interface MachineService {
	
	// 기구 목록
	List<GymMachine> findByCategory(String category);
	// 수정시 기구번호로 찾기
    GymMachine findById(int id);
    // 등록
    GymMachine insert(GymMachine machine);
    // 수정
    boolean update(GymMachine machine);
    // 삭제
    boolean delete(int no);

}