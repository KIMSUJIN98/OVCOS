package com.ovcos.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.inquiry.model.service.InquiryService;
import com.ovcos.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryUpdateController
 */
@WebServlet("/update.bo")
public class InquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int inqNo = Integer.parseInt(request.getParameter("num"));
		String inqTitle = request.getParameter("inqTitle");
		String inqCnt = request.getParameter("inqCnt");
		
		Inquiry i = new Inquiry();
		
		i.setInqNo(inqNo);
		i.setInqTitle(inqTitle);
		i.setInqCnt(inqCnt);
		
		int result = new InquiryService().updateInquiry(i);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 문의사항 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/detail.bo?num=" + inqNo);
		} else {
			request.getSession().setAttribute("alertMsg", "문의사항 수정에 실패했습니다.");
			request.getRequestDispatcher("views/inquiry/errorPage.jsp").forward(request, response);
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
