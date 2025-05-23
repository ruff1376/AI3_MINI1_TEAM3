package com.hhg.admin.servlet;

import java.io.IOException;
import java.util.List;

import com.hhg.admin.dto.Trainer;
import com.hhg.admin.service.TrainerService;
import com.hhg.admin.service.TrainerServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/admin/*")
public class TrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TrainerService trainerService = new TrainerServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = request.getPathInfo();
		String page = "";
		
//		System.out.println(path);
		List<Trainer> trainerList = trainerService.list();
		request.setAttribute("trainerList", trainerList);
		page = "/WEB-INF/views/admin/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
