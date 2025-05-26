package com.hhg.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.hhg.member.dto.Member;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;
import com.hhg.pthistory.dto.PTHistory;
import com.hhg.pthistory.service.PTHistoryService;
import com.hhg.pthistory.service.PTHistoryServiceImpl;

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
	private PTHistoryService ptHistoryService = new PTHistoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";
		String idParam = request.getParameter("id");
		
		if (idParam != null) {
			int id = Integer.parseInt(idParam);
			Member member = memberService.read(id);
			
			if (member == null) {
		        response.sendError(HttpServletResponse.SC_NOT_FOUND, "회원 정보를 찾을 수 없습니다.");
		        return;
		    }
			
			PTHistory pt = ptHistoryService.findByMemberId(id); // usedCount, totalCount 포함된 객체
			if (pt == null) {
		        pt = new PTHistory();
		        pt.setUsedCount(0);
		        pt.setTotalCount(0);
		    }
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			out.print("{");
			out.printf("\"memberNo\": %d,", member.getMemberNo());
			out.printf("\"name\": \"%s\",", member.getName());
			out.printf("\"phone\": \"%s\",", member.getPhone());
			out.printf("\"joinDate\": \"%s\",", member.getJoinDate().toString());
			out.printf("\"usedCount\": %d,", pt.getUsedCount());
			out.printf("\"totalCount\": %d", pt.getTotalCount());
			out.print("}");
			return;
		}
		
		List<Member> memberList = memberService.list();
		request.setAttribute("memberList", memberList);
		page = "/WEB-INF/views/admin/member/member.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
