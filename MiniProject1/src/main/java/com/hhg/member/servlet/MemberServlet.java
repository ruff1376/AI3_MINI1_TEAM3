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

@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		String page = "";
		
		if (path.equals("/list") || path.equals("/list.jsp")) {
			List<Member> memberList = memberService.list();
			request.setAttribute("memberList", memberList);
			page = "/WEB-INF/views/admin/member/member.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
