package com.hhg.admin.service;

import com.hhg.admin.dto.Trainer;

public interface TrainerService {
	Trainer select(int no);
	Trainer insert(Trainer trainer);
	boolean update(Trainer trainer);
	boolean delete(Trainer trainer);
}
