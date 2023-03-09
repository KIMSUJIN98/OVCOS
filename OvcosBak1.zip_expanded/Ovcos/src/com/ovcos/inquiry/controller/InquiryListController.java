package com.ovcos.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.inquiry.model.service.InquiryService;
import com.ovcos.inquiry.model.vo.Inquiry;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class InquiryListController
 */
@WebServlet("/list.bo")
public class InquiryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId=((Member)request.getSession().getAttribute("loginUser")).getMemId();
		
		ArrayList<Inquiry> list = new InquiryService().selectInquiryList(userId);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/inquiry/inquiryListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
