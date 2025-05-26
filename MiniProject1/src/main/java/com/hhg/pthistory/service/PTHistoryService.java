package com.hhg.pthistory.service;

import java.util.List;

import com.hhg.pthistory.dto.PTHistory;

public interface PTHistoryService {
	List<PTHistory> list();
	PTHistory findByMemberId(int id);
}
