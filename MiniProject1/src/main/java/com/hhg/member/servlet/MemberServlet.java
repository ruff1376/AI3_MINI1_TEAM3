package com.hhg.member.servlet;

import java.io.IOException;
import java.util.List;

import com.hhg.member.dto.Member;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/memberlist/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";
//		int id = Integer.parseInt(request.getParameter("id"));

//		Member member = memberService.read(id);
//		PTHistory pt = ptHistoryService.findByMemberId(id); // usedCount, totalCount 포함된 객체
		
		List<Member> memberList = memberService.list();
		request.setAttribute("memberList", memberList);
		page = "/WEB-INF/views/admin/member/member.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
