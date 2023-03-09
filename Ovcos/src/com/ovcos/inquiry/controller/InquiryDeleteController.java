package com.ovcos.inquiry.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.inquiry.model.service.InquiryService;

/**
 * Servlet implementation class InquiryDeleteController
 */
@WebServlet("/deleteForm.bo")
public class InquiryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int inqNo = Integer.parseInt(request.getParameter("num"));
		System.out.println(inqNo);
		int result = new InquiryService().deleteNotice(inqNo);
		
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			response.sendRedirect(request.getContextPath()+"/list.bo");
		} else {
			request.setAttribute("alertMsg", "문의사항 삭제가 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/list.bo");
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
