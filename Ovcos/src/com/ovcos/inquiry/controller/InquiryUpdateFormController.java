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
 * Servlet implementation class InquiryUpdateFormController
 */
@WebServlet("/updateForm.bo")
public class InquiryUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int inqNo = Integer.parseInt(request.getParameter("num"));
		
		Inquiry i = new InquiryService().selectInquiry(inqNo);
		
		request.setAttribute("i", i);
		request.getRequestDispatcher("views/inquiry/inquiryUpdateForm.jsp").forward(request, response);
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
