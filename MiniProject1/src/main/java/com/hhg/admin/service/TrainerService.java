package com.hhg.admin.service;

import java.util.List;

import com.hhg.admin.dto.Trainer;

public interface TrainerService {
	List<Trainer> list();
	Trainer select(int no);
	Trainer insert(Trainer trainer);
	boolean update(Trainer trainer);
	boolean delete(Trainer trainer);
}
