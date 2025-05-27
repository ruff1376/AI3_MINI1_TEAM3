package com.hhg.admin.servlet;

import java.io.IOException;
import java.util.List;

import com.alohaclass.jdbc.dto.PageInfo;
import com.hhg.admin.dto.Trainer;
import com.hhg.admin.service.TrainerService;
import com.hhg.admin.service.TrainerServiceImpl;
import com.hhg.cs.dao.QuestionDAO;
import com.hhg.cs.dto.Question;
import com.hhg.cs.service.QuestionService;
import com.hhg.cs.service.QuestionServiceImpl;
import com.hhg.machine.dto.GymMachine;
import com.hhg.machine.service.MachineService;
import com.hhg.machine.service.MachineServiceImpl;
import com.hhg.member.dto.Member;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;
import com.hhg.ptschedule.dto.PTSchedule;
import com.hhg.ptschedule.service.PTScheduleService;
import com.hhg.ptschedule.service.PTScheduleServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/*")
public class TrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TrainerService trainerService = new TrainerServiceImpl();
	private PTScheduleService ptScheduleService = new PTScheduleServiceImpl();
	private MemberService memberService = new MemberServiceImpl();
	private MachineService machineService = new MachineServiceImpl();
	private QuestionService questionService = new QuestionServiceImpl(new QuestionDAO());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";
		
		List<Trainer> trainerList = trainerService.list();
		request.setAttribute("trainerList", trainerList);
		
		List<PTSchedule> ptScheduleList = ptScheduleService.list();
		request.setAttribute("ptScheduleList", ptScheduleList);
		
		List<Member> memberList = memberService.list();
		request.setAttribute("memberList", memberList);
		
		List<GymMachine> gymMachineList = machineService.list();
		request.setAttribute("gymMachineList", gymMachineList);
		
//		PageInfo<Question> pageInfo = (PageInfo<Question>) questionService.list();
//		List<Question> questionList = pageInfo.getList();
//		request.setAttribute("questionList", questionList);
		
		page = "/WEB-INF/views/admin/admin.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
