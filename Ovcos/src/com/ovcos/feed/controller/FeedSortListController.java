package com.ovcos.feed.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;

/**
 * Servlet implementation class FeedSortListController
 */
@WebServlet("/sort.feed")
public class FeedSortListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedSortListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	/*	
		String num = request.getParameter("num");
		String userId = request.getParameter("userId");
		
		System.out.println("번호:" +num);
		System.out.println("아이디 : "+userId);
		//System.out.println(num+"아이디 : ");
//		ArrayList<Feed> allList = new FeedService().selectAllFeedList();
		
		//ArrayList<Explore> allList = new ExploreService().selectList();
		//1이면 전체피드 2면 내친구피드 3이면 내피드 
		
		

		
		ArrayList<Feed>  allList = null;
		
		switch (num) {
		case "1":
			allList = new FeedService().selectArrayList(userId);
			System.out.println("1번탐");
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			break;
		case "2":
			allList = new FeedService().selectFriendList(userId);
			System.out.println("2번탐");

			System.out.println(allList.size());
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			break;
		case "3": 
			allList = new FeedService().selectMyList(userId);
			System.out.println("3번탐");
			
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			break;

		default: 			
			allList = new FeedService().selectArrayList(userId);
			System.out.println("else탐");
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
				break;
		}
		
		
	//값 제대로 가져오나
		String select = request.getParameter("sorting");
		System.out.println(select);
	
		
		if(select.equals("latest")) {
			//최신순 정렬
			ArrayList<Feed> list = new FeedService().selectSortlatestList();
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}else if(select.equals("oldest")) {
			//오래된순 정렬
			
			ArrayList<Feed> list = new FeedService().selectTitleSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			
		}else if(select.equals("rating")) {
			//별점순 정렬
			
			ArrayList<Feed> list = new FeedService().selectCntSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}else if(select.equals("bookmark")) {
			//찜순 정렬
			
			ArrayList<Feed> list = new FeedService().selectCntSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}
		*/
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
