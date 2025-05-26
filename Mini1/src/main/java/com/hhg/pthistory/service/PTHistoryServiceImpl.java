package com.hhg.pthistory.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.pthistory.dao.PTHistoryDAO;
import com.hhg.pthistory.dto.PTHistory;

public class PTHistoryServiceImpl implements PTHistoryService {
	private PTHistoryDAO ptHistoryDAO = new PTHistoryDAO();

	@Override
	public List<PTHistory> list() {
		List<PTHistory> list = null;
		try {
			list = ptHistoryDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PTHistory findByMemberId(int id) {
		PTHistory ptHistory = null;
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("member_no", id);
			ptHistory = ptHistoryDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ptHistory;
	}
	
}
