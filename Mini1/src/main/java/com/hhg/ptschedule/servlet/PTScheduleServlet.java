package com.hhg.ptschedule.servlet;

import java.io.IOException;
import java.util.List;

import com.hhg.member.dto.Member;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;
import com.hhg.ptschedule.dto.PTSchedule;
import com.hhg.ptschedule.service.PTScheduleService;
import com.hhg.ptschedule.service.PTScheduleServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ptschedule/*")
public class PTScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PTScheduleService ptScheduleService = new PTScheduleServiceImpl();
	private MemberService memberService = new MemberServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PTSchedule> ptScheduleList = ptScheduleService.list();
		request.setAttribute("ptScheduleList", ptScheduleList);
		List<Member> memberList = memberService.list();
		request.setAttribute("memberList", memberList);
	}

}
