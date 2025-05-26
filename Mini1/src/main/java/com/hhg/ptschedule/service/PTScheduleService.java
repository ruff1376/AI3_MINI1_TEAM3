package com.hhg.ptschedule.service;

import java.util.List;

import com.hhg.ptschedule.dto.PTSchedule;

public interface PTScheduleService {
	List<PTSchedule> list();
	PTSchedule select(int no);
	PTSchedule insert(PTSchedule ptSchedule);
	boolean update(PTSchedule ptSchedule);
	boolean delete(PTSchedule ptSchedule);
}
