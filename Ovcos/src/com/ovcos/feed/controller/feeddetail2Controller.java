package com.ovcos.feed.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.feed.model.vo.Feeddetails;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class feeddetail2
 */
@WebServlet("/detail2.fe")
public class feeddetail2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feeddetail2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int feedNo = Integer.parseInt(request.getParameter("fno"));
		Feeddetails m = new FeedService().selectMember(feedNo);
		
		System.out.println(m);
		
		if(m != null) {
			// 성공했을때
			System.out.println("dsdsdsdsdsdsdsdsdd");
			request.setAttribute("m", m);
			request.getRequestDispatcher("views/feed/feeddetail2.jsp").forward(request, response);
		
//			RequestDispatcher view = request.getRequestDispatcher("views/feed/feeddetail2.jsp");
//			view.forward(request, response);
		
		}else {
			System.out.println("00000000000000000000000000000");
			// 에러페이지
			request.getSession().setAttribute("alertMsg", "불러오기 실패");
			response.sendRedirect("/list.feed");
			
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
