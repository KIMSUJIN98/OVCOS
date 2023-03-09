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
@WebServlet("/detail.fe")
public class feeddetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feeddetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int feedNo = Integer.parseInt(request.getParameter("fno"));
		Feeddetails f = null;
		
		int result = new FeedService().updateCount(feedNo);
		if(result > 0) {
			f = new FeedService().selectFeedDetail(feedNo);
			
			if(f != null) {
				// 성공했을때
			
				request.setAttribute("f", f);
				
				request.getRequestDispatcher("views/feed/feeddetail.jsp").forward(request, response);
			
//				RequestDispatcher view = request.getRequestDispatcher("views/feed/feeddetail2.jsp");
//				view.forward(request, response);
			
			}else {
		
				// 에러페이지
				request.getSession().setAttribute("alertMsg", "불러오기 실패");
				response.sendRedirect("/list.feed");
				
			}
		}else {
			//조회수 증가 안될 때 에러메세지
		}
		
		
		
//		System.out.println(m);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
