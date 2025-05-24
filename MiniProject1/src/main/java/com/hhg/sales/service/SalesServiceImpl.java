package com.hhg.sales.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.sales.dao.SalesDAO;
import com.hhg.sales.dto.Sales;

public class SalesServiceImpl implements SalesService {

	private SalesDAO dao = new SalesDAO();
	
	
	@Override
	public Sales insert(Sales sales) {
		int result = 0;
		try {
			dao.insert(sales);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if( result > 0 ) {
			return sales;
		}
		return null;
	}

	@Override
	public boolean update(Sales sales) {
		int result = 0;
		try {
			dao.update(sales);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result > 0;
	}

	@Override
	public Sales findById(int salesId) {
		Sales sales = null;
		try {
			sales = dao.select(salesId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sales;
	}

	@Override
	public List<Sales> findByTrainerId(int trainerId) {
		List<Sales> list = null;
		Map<String, Object> map = new HashMap<>();
        map.put("trainerid", trainerId);
        try {
			list = dao.listBy(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return list;
	}

	@Override
	public List<Sales> findAll() {
		List<Sales> list = null;
		try {
			list = dao.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


}
