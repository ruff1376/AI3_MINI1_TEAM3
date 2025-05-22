package com.hhg.admin.service;

import java.util.List;

import com.hhg.admin.dao.TrainerDAO;
import com.hhg.admin.dto.Trainer;

public class TrainerServiceImpl implements TrainerService {
	
	private TrainerDAO trainerDAO = new TrainerDAO();
	
	@Override
	public List<Trainer> list() {
		List<Trainer> list = null;
		try {
			list = trainerDAO.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Trainer select(int no) {
		return null;
	}

	@Override
	public Trainer insert(Trainer trainer) {
		return null;
	}

	@Override
	public boolean update(Trainer trainer) {
		return false;
	}

	@Override
	public boolean delete(Trainer trainer) {
		return false;
	}

}
