package com.ovcos.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.inquiry.model.service.InquiryService;
import com.ovcos.inquiry.model.vo.Inquiry;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class AdminMainController
 */
@WebServlet("/main.admin")
public class AdminMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Feed>  list  = new FeedService().selectFeedList();
		ArrayList<Inquiry> iqList = new InquiryService().selectInquiryList();
		response.setContentType("application/json; charset=utf-8");
		
		
		request.setAttribute("list", list);
		request.setAttribute("iqList", iqList);
		
		request.getRequestDispatcher("views/admin/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
