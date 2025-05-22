package com.hhg.machine.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.machine.dao.GymMachineDAO;
import com.hhg.machine.dto.GymMachine;

public class MachineServiceImpl implements MachineService{
	
	private GymMachineDAO gmDAO = new GymMachineDAO();

	@Override
	public List<GymMachine> findByCategory(String category) {
		Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        try {
			return gmDAO.listBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public GymMachine findById(int id) {
	    try {
	        return gmDAO.select(id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	@Override
	public GymMachine insert(GymMachine machine) {
	    try {
	        gmDAO.insert(machine);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return machine;
	}

	@Override
	public boolean update(GymMachine machine) {
		int result = 0;
	    try {
	    	result = gmDAO.update(machine);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return result > 0;
	}

	@Override
	public boolean delete(int no) {
		int result = 0;
	    try {
	       result = gmDAO.delete(no);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return result > 0;
	}

}