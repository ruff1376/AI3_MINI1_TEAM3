package com.hhg.sales.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hhg.admin.dto.Trainer;
import com.hhg.admin.service.TrainerService;
import com.hhg.admin.service.TrainerServiceImpl;
import com.hhg.sales.dto.Sales;
import com.hhg.sales.service.SalesService;
import com.hhg.sales.service.SalesServiceImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SalesServlet
 */
@WebServlet("/admin/sales/*")
public class SalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SalesService service = new SalesServiceImpl();
		TrainerService trainerService = new TrainerServiceImpl();
		
        Map<Integer, List<Sales>> trainerSalesMap = new HashMap<>();
		String root = request.getContextPath();
		String path = request.getPathInfo();
		String page = "";
		if( path == null || path.equals("/") ) {
			String[] ids = request.getParameterValues("trainerid");
			page = "/WEB-INF/views/admin/sales/sales.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			if (ids != null) {
				for (String id : ids) {
					int trainerId = Integer.parseInt(id);
					List<Sales> sales = service.findByTrainerId(trainerId);
					trainerSalesMap.put(trainerId, sales);
				}
			} else {
				request.setAttribute("salesList", service.findAll());
			}
			request.setAttribute("trainerSalesMap", trainerSalesMap);
		}
		
		if( path.equals("/create") || path.equals("/create.jsp") ) {
			List<Trainer> trainerList = trainerService.list();
			request.setAttribute("trainerList", trainerList);
			page = "/WEB-INF/views/admin/sales/create.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if( path.equals("/list") || path.equals("/list.jsp") ) {
//			List<Sales> trainerSalesList = service.findAll();
//			for (Sales sales : trainerSalesList) {
//				System.out.println(sales);
//			}
//			
//			request.setAttribute("list", trainerSalesList);
			
			List<Trainer> trainerList = trainerService.listWithSales();
			request.setAttribute("trainerList", trainerList);
			
			page = "/WEB-INF/views/admin/sales/list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
		if( path.equals("/edit") || path.equals("/edit.jsp") ) {
			List<Trainer> trainerList = trainerService.list();
			request.setAttribute("trainerList", trainerList);
			int id = Integer.parseInt(request.getParameter("id"));
			Sales sales = service.findById(id);
			request.setAttribute("sales", sales);
			
			page = "/WEB-INF/views/admin/sales/edit.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		SalesService service = new SalesServiceImpl();
		String root = req.getContextPath();
		String path = req.getPathInfo();
		String page = "";
		
		if( path.equals("/create") || path.equals("/create.jsp") ) {
			int trainerid = Integer.parseInt(req.getParameter("trainerid"));
	        int amount = Integer.parseInt(req.getParameter("amount"));
	        String note = req.getParameter("note");

	        Sales sale = Sales.builder()
	        				  .trainerId(trainerid)
	        				  .amount(amount)
	        				  .note(note)
	        				  .build();

	        service.insert(sale);
	        res.sendRedirect(req.getContextPath() + "/admin/sales/list");
	    }
		
		if( path.equals("/edit") || path.equals("/edit.jsp") ) {
			int result = 0;
			int trainerid = Integer.parseInt(req.getParameter("trainerid"));
	        int amount = Integer.parseInt(req.getParameter("amount"));
	        String note = req.getParameter("note");
	        
	        Sales sale = Sales.builder()
			  				  .trainerId(trainerid)
			  				  .amount(amount)
			  				  .note(note)
			  				  .build();
			page = "/WEB-INF/views/admin/sales/edit.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(page);
			dispatcher.forward(req, res);
		}
	}

}
