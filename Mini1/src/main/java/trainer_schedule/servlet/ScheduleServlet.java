
package trainer_schedule.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import trainer_schedule.dao.MemberScheduleDAO;
import trainer_schedule.dao.TrainerDAO;
import trainer_schedule.dto.MemberScheduleDTO;
import trainer_schedule.dto.PTScheduleDTO;
import trainer_schedule.dto.TrainerDTO;
import trainer_schedule.service.TrainerScheduleService;
import trainer_schedule.service.TrainerScheduleServiceImpl;

@WebServlet("/admin/schedule")
public class ScheduleServlet extends HttpServlet {
	 private final TrainerScheduleService service = new TrainerScheduleServiceImpl();
	    private final TrainerDAO trainerDAO = new TrainerDAO();
	    private final MemberScheduleDAO memberDAO = new MemberScheduleDAO();

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String selectedDate = request.getParameter("date");
	        if (selectedDate == null || selectedDate.trim().isEmpty()) {
	            selectedDate = LocalDate.now().toString();
	        }

	        try {
	            List<TrainerDTO> trainerList = trainerDAO.list();
	            List<MemberScheduleDTO> memberList = memberDAO.list(); 
	            List<PTScheduleDTO> savedList = service.getScheduleByDate(selectedDate); 

	            request.setAttribute("trainerList", trainerList);
	            request.setAttribute("memberList", memberList);
	            request.setAttribute("selectedDate", selectedDate);
	            request.setAttribute("savedList", savedList);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/pt-schedule/schedule.jsp");
	            dispatcher.forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 조회 중 오류 발생");
	        }
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        List<PTScheduleDTO> saveList = new ArrayList<>();

	        try {
	            int i = 0;
	            while (request.getParameter("entries[" + i + "].trainerId") != null) {
	                PTScheduleDTO dto = new PTScheduleDTO();
	                dto.setTrainerId(Integer.parseInt(request.getParameter("entries[" + i + "].trainerId")));
	                dto.setMemberNo(Integer.parseInt(request.getParameter("entries[" + i + "].memberNo")));
	                dto.setBookDate(request.getParameter("entries[" + i + "].bookDate"));
	                dto.setBookTime(request.getParameter("entries[" + i + "].bookTime"));
	                dto.setNote(request.getParameter("entries[" + i + "].note"));
	                saveList.add(dto);
	                i++;
	            }

	            // ✅ 저장 서비스 호출
	            service.saveAll(saveList);

	            if (!saveList.isEmpty()) {
	                String date = saveList.get(0).getBookDate();
	                response.setContentType("text/html; charset=UTF-8");
	                response.getWriter().println("<script>alert('저장되었습니다.'); location.href='schedule?date=" + date + "';</script>");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "예약 저장 중 오류 발생");
	        }
	    }
}


