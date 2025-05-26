package com.hhg.pthistory.service;

import java.util.List;

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
	
}
