package com.hhg.machine.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.hhg.machine.dto.GymMachine;
import com.hhg.machine.service.MachineService;
import com.hhg.machine.service.MachineServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MachineServlet
 */
@WebServlet("/admin/machine/*")
public class MachineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MachineService machineService = new MachineServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = "";
		// 메인 띄우기
		if( path == null || path.equals("/") ) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/machine/machine.jsp");
			dispatcher.forward(request, response);
		}
        
 		// 기구 목록
 		if( path.equals("/list") || path.equals("/list.jsp") ) {
 			String category = request.getParameter("category");
 			List<GymMachine> machineList = machineService.findByCategory(category);
 			for (GymMachine gymMachine1 : machineList) {
 				System.out.println(gymMachine1);
 			}
 			page = "/WEB-INF/views/admin/machine/list.jsp";
 			request.setAttribute("list", machineList);
 			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
 			dispatcher.forward(request, response);
 		}
 		
		// 기구 조회 수정
		if( path.equals("/edit") || path.equals("/edit.jsp") ) {
			int id = Integer.parseInt(request.getParameter("id"));
			GymMachine gymMachine = machineService.findById(id);
			request.setAttribute("machine", gymMachine);
			page = "/WEB-INF/views/admin/machine/edit.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
        
		// 기구 등록
		if( path.equals("/create") || path.equals("/create.jsp") ) {
			page = "/WEB-INF/views/admin/machine/create.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = "";
		// 게시글 등록
		if( path.equals("/create") ) {
			String name = request.getParameter("name");
			String brand = request.getParameter("brand");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			GymMachine machine = GymMachine.builder() 
										   .name(name)
										   .brand(brand)
										   .category(category)
										   .status(status)
										   .build();
			GymMachine createdMachine = machineService.insert(machine);
			if( createdMachine != null ) {
				response.sendRedirect(root + "/admin/machine/list?category=" + category);
			}
			else {
				response.sendRedirect(root + "/admin/machine/create.jsp?error=true");
			}
		}
		
		if( path.equals("/edit") ) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String brand = request.getParameter("brand");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			GymMachine machine = GymMachine.builder()
										   .name(name)
										   .brand(brand)
										   .category(category)
										   .status(status)
										   .id(id)
										   .build();
			try {
				boolean result = machineService.update(machine);
				if( result ) {
					response.sendRedirect(root + "/admin/machine/list?category=" + category);
				}
				else {
					response.sendRedirect(root + "/admin/machine/edit.jsp?id=" +id+ "&error=true");
				}
				
			} catch (Exception e) {
				
			}
		}
		
		// 게시글 삭제
		if( path.equals("/delete") ) {
			int id = Integer.parseInt(request.getParameter("id"));
			String category = request.getParameter("category");
			boolean result = machineService.delete(id);
			if( result ) {
				response.sendRedirect(root + "/admin/machine/list?category=" + category);
			}
			else {
				response.sendRedirect(root + "board/update.jsp?error=true");
			}
		}
		
		
	}

}