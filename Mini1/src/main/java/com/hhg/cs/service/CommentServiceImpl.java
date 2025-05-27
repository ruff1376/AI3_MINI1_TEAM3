package com.hhg.cs.service;

import com.hhg.common.service.BaseServiceImpl;
import com.hhg.cs.dao.CommentDAO;
import com.hhg.cs.dto.Comment;

public class CommentServiceImpl extends BaseServiceImpl<CommentDAO, Comment> implements CommentService {

	public CommentServiceImpl(CommentDAO dao) {
		super(dao);
	}
}
