package com.hhg.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.admin.dao.TrainerDAO;
import com.hhg.admin.dto.Trainer;
import com.hhg.sales.dao.SalesDAO;
import com.hhg.sales.dto.Sales;

public class TrainerServiceImpl implements TrainerService {
	
	private TrainerDAO trainerDAO = new TrainerDAO();
	private SalesDAO salesDAO = new SalesDAO();
	
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

	@Override
	public List<Trainer> listWithSales() {
		List<Trainer> list = null;
		try {
			list = trainerDAO.list();
			for (Trainer trainer : list) {
				int trainerId = trainer.getTrainerId();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("trainerId", trainerId);
				List<Sales> salesList = salesDAO.listBy(map);
				trainer.setSalesList(salesList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
