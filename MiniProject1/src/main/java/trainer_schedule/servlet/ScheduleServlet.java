package trainer_schedule.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import trainer_schedule.dao.TrainerDAO;
import trainer_schedule.dto.TrainerScheduleDTO;
import trainer_schedule.service.TrainerScheduleService;
import trainer_schedule.service.TrainerScheduleServiceImpl;

@WebServlet("/schedule")
public class ScheduleServlet extends HttpServlet {
    private final TrainerScheduleService service = new TrainerScheduleServiceImpl();
    private final TrainerDAO trainerDAO = new TrainerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String selectedDate = request.getParameter("date");
        if (selectedDate == null || selectedDate.trim().isEmpty()) {
            selectedDate = "";
        }

        List<TrainerScheduleDTO> scheduleList = service.getScheduleByDate(selectedDate);
        List<String> trainerList = trainerDAO.getTrainerNames();

        request.setAttribute("selectedDate", selectedDate);
        request.setAttribute("trainerList", trainerList);
        request.setAttribute("scheduleList", scheduleList);

        request.getRequestDispatcher("/schedule.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String date = request.getParameter("date");

        List<TrainerScheduleDTO> saveList = new ArrayList<>();
        List<TrainerScheduleDTO> deleteList = new ArrayList<>();

        try {
            // 저장 entries
            int i = 0;
            while (request.getParameter("entries[" + i + "].trainer") != null) {
                TrainerScheduleDTO dto = new TrainerScheduleDTO();
                dto.setScheduleDate(date);
                dto.setTrainer(request.getParameter("entries[" + i + "].trainer"));
                dto.setTime(request.getParameter("entries[" + i + "].time"));
                dto.setMemo(request.getParameter("entries[" + i + "].memo"));
                dto.setChecked("true".equals(request.getParameter("entries[" + i + "].checked")));
                saveList.add(dto);
                i++;
            }

            // 삭제 deleteEntries
            int j = 0;
            while (request.getParameter("deleteEntries[" + j + "].trainer") != null) {
                TrainerScheduleDTO dto = new TrainerScheduleDTO();
                dto.setScheduleDate(date);
                dto.setTrainer(request.getParameter("deleteEntries[" + j + "].trainer"));
                dto.setTime(request.getParameter("deleteEntries[" + j + "].time"));
                deleteList.add(dto);
                j++;
            }

            service.saveAll(saveList, deleteList);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('저장되었습니다.'); location.href='schedule?date=" + date + "';</script>");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류 발생");
        }
    }
}
