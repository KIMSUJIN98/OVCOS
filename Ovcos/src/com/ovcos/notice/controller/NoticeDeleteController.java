package com.ovcos.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/deleteForm.no")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ntcNo = Integer.parseInt(request.getParameter("num")); //디테일뷰.jsp 에서 String으로 넘어오니까 int로 파싱
		int result = new NoticeService().deleteNotice(ntcNo);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alertMsg","성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.no");
			
		}else {//실패 => 에러문구(공지사항 등록 실패) 담아서 에러메세지 포워딩 
			
			request.setAttribute("alertMsg", "공지사항 삭제 실패");
			
			response.sendRedirect(request.getContextPath() + "/list.no");
			//RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			//view.forward(request, response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
