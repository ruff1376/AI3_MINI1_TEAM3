package com.hhg.cs.servlet;

import java.io.IOException;
import java.util.List;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;
import com.hhg.admin.dto.Trainer;
import com.hhg.admin.service.TrainerService;
import com.hhg.admin.service.TrainerServiceImpl;
import com.hhg.cs.dao.CommentDAO;
import com.hhg.cs.dao.QuestionDAO;
import com.hhg.cs.dto.Comment;
import com.hhg.cs.dto.Question;
import com.hhg.cs.service.CommentService;
import com.hhg.cs.service.CommentServiceImpl;
import com.hhg.cs.service.QuestionService;
import com.hhg.cs.service.QuestionServiceImpl;
import com.hhg.member.service.MemberService;
import com.hhg.member.service.MemberServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/cs/*")
public class QnAListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	QuestionService questionService;
	CommentService commentService;
	MemberService memberService = new MemberServiceImpl(); // 회원 서비스 (추가된 부분)
	TrainerService trainerService = new TrainerServiceImpl(); // 트레이너 서비스 (추가된 부분)

    public QnAListServlet() {
    	QuestionDAO questionDAO = new QuestionDAO();
    	CommentDAO commentDAO = new CommentDAO();
		this.questionService = new QuestionServiceImpl(questionDAO);
		this.commentService = new CommentServiceImpl(commentDAO);
	}


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    	String path = req.getPathInfo();
    	System.out.println("path: " + path);
    	
    	// 문의사항 목록
    	if( path == null || path.equals("/")) {
    		int pageNo = 1;	// 기본 페이지 번호
    		pageNo = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : pageNo;
    		PageInfo<Question> pageInfo = questionService.pageJoinUser(pageNo, 5);
    		List<Question> list = pageInfo.getList();
    		Page page = pageInfo.getPage();
//        System.out.println("pageInfo: " + pageInfo);
//        System.out.println("list: " + list);
        System.out.println("page :" + page);
    		
    		req.setAttribute("pageInfo", pageInfo);
    		req.setAttribute("list", list);
    		req.setAttribute("page", page);
    		
    		req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnAList.jsp").forward(req, res);
    	}
    	
    	// 문의사항 상세
		else if (path.equals("/detail")) {
			String qnaId = req.getParameter("qnaId");
			if (qnaId != null && !qnaId.isEmpty()) {
				
				// 문의사항 상세 조회
				Question question = questionService.select( Long.parseLong(qnaId) );
				if (question != null) {
					// 회원 정보 조회
					question.setMember(memberService.select(question.getMemberNo()));
				} else {
					question = new Question(); // 없는 경우 빈 객체 생성
				}
				req.setAttribute("question", question);
				
				// 답변 조회
				Comment comment = commentService.select( Long.parseLong(qnaId) );
				
				if (comment != null) {
					// 트레이너 정보 조회
					comment.setTrainer(trainerService.select(comment.getTrainerId()));
				} else {
					comment = new Comment(); // 없는 경우 빈 객체 생성
				}
				req.setAttribute("comment", comment);
				
				// 트레이너 목록 조회
				List<Trainer> trainerList = trainerService.list();
				req.setAttribute("trainerList", trainerList);
				
				req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnADetail.jsp").forward(req, res);
			} else {
				res.sendRedirect(req.getContextPath() + "/admin/cs");
			}
		}
		
		else {
			res.sendError(HttpServletResponse.SC_NOT_FOUND); // 404 Not Found
		}
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	// 답변 등록 또는 수정
    	int qnaId = Integer.parseInt(req.getParameter("qnaId"));
    	int trainerId = Integer.parseInt(req.getParameter("trainerId"));
    	String comment = req.getParameter("comment");
    	
    	Comment commentObj = commentService.select((long) qnaId); // qnaId로 기존 답변 조회
    	// 기존에 답변이 있는 경우
    	if( commentObj != null) {
    		// 답변 수정
			commentObj.setTrainerId(trainerId);
			commentObj.setComment(comment);
			boolean isUpdated = commentService.update(commentObj);
			
			if (isUpdated) {
				Question question = questionService.select((long) qnaId);
				if (question != null) {
					question.setStatus(true); // 답변 완료 상태로 변경
					questionService.update(question); // 문의사항 상태 업데이트
				}
				
				res.sendRedirect(req.getContextPath() + "/admin/cs/detail?qnaId=" + qnaId);
			} else {
				req.setAttribute("errorMessage", "답변 수정에 실패했습니다.");
				req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnADetail.jsp").forward(req, res);
			}
		}
    	// 답변이 없는 경우
    	else {
			// 답변 등록
			commentObj = new Comment();
			commentObj.setQnaId( qnaId );
			commentObj.setTrainerId(trainerId);
			commentObj.setComment(comment);
			
			boolean isInserted = commentService.insert(commentObj);
			
			if (isInserted) {
				Question question = questionService.select((long) qnaId);
				if (question != null) {
					question.setStatus(true); // 답변 완료 상태로 변경
					questionService.update(question); // 문의사항 상태 업데이트
				}
				
				
				res.sendRedirect(req.getContextPath() + "/admin/cs/detail?qnaId=" + qnaId);
			} else {
				req.setAttribute("errorMessage", "답변 등록에 실패했습니다.");
				req.getRequestDispatcher("/WEB-INF/views/admin/cs/QnADetail.jsp").forward(req, res);
			}
    	}		
    }
}



















