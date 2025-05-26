package com.hhg.ptschedule.service;

import java.util.List;

import com.hhg.ptschedule.dao.PTScheduleDAO;
import com.hhg.ptschedule.dto.PTSchedule;

public class PTScheduleServiceImpl implements PTScheduleService {
	
	private PTScheduleDAO ptScheduleDAO = new PTScheduleDAO();

	@Override
	public List<PTSchedule> list() {
		List<PTSchedule> list = null;
		try {
			list = ptScheduleDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public PTSchedule select(int no) {
		PTSchedule ptSchedule = null;
		try {
			ptSchedule = ptScheduleDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ptSchedule;
	}

	@Override
	public PTSchedule insert(PTSchedule ptSchedule) {
		return null;
	}

	@Override
	public boolean update(PTSchedule ptSchedule) {
		return false;
	}

	@Override
	public boolean delete(PTSchedule ptSchedule) {
		return false;
	}

}
