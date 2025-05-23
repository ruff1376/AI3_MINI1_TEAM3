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
import trainer_schedule.dao.PTScheduleDAO;
import trainer_schedule.dao.TrainerDAO;
import trainer_schedule.dto.PTScheduleDTO;
import trainer_schedule.dto.TrainerDTO;
import trainer_schedule.service.TrainerScheduleService;
import trainer_schedule.service.TrainerScheduleServiceImpl;

@WebServlet("/admin/schedule")
public class ScheduleServlet extends HttpServlet {
    private final TrainerScheduleService service = new TrainerScheduleServiceImpl();
    private final TrainerDAO trainerDAO = new TrainerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ 날짜 파라미터 가져오기, 없으면 오늘 날짜 사용
        String selectedDate = request.getParameter("date");
        if (selectedDate == null || selectedDate.trim().isEmpty()) {
            selectedDate = LocalDate.now().toString(); // 예: 2025-05-23
        }

        // ✅ 트레이너 및 회원 목록 가져오기
        TrainerDAO trainerDAO = new TrainerDAO();
        MemberScheduleDAO memberDAO = new MemberScheduleDAO();
        PTScheduleDAO ptDao = new PTScheduleDAO();

        List<TrainerDTO> trainerList = trainerDAO.getTrainerList();
        List<PTScheduleDTO> savedList = ptDao.getScheduleByDate(selectedDate);

        request.setAttribute("trainerList", trainerList);
        request.setAttribute("memberList", memberDAO.getAllMembers());
        request.setAttribute("selectedDate", selectedDate);
        request.setAttribute("savedList", savedList);

        // ✅ JSP 포워딩
        String page = "/WEB-INF/views/admin/pt-schedule/schedule.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
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
                dto.setNote(request.getParameter("entries[" + i + "].note")); // 선택사항

                saveList.add(dto);
                i++;
            }

            // ✅ 저장 수행 (delete 처리 안 하는 구조)
            PTScheduleDAO dao = new PTScheduleDAO();

            // 기존 해당 날짜 데이터 삭제 후 새로 저장 (덮어쓰기 방식)
            if (!saveList.isEmpty()) {
                String date = saveList.get(0).getBookDate();
                dao.deleteByDate(date); // 아래에서 메서드 정의
                for (PTScheduleDTO dto : saveList) {
                    dao.insert(dto);
                }
            }

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('저장되었습니다.'); location.href='schedule?date=" + saveList.get(0).getBookDate() + "';</script>");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 오류 발생");
        }
    }
}