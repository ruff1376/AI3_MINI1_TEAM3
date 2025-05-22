package com.hhg.machine.servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class MachineListServlet
 */
@WebServlet("/admin/machinelist")
public class MachineListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MachineService machineService = new MachineServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MachineListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");
        List<GymMachine> machineList = machineService.findByCategory(category);
        for (GymMachine gymMachine : machineList) {
			System.out.println(gymMachine);
		}
        request.setAttribute("list", machineList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/machine/list.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}