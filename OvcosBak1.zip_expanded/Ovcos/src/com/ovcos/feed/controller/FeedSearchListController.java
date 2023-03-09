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
 * Servlet implementation class FeedSearchListController
 */
@WebServlet("/searchList.feed")
public class FeedSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String select =  request.getParameter("f_search_select");
		String search = request.getParameter("search");
		
		System.out.println("셀렉트값"+select);
		System.out.println("검색값"+search);
		
		if(select.equals("1")) {
			//작성자검색
			ArrayList<Feed> list = new FeedService().selectIdSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}else if(select.equals("2")) {
			//피드제목으로 검색
			
			ArrayList<Feed> list = new FeedService().selectTitleSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			
		}else if(select.equals("3")) {
			//피드내용검색
			
			ArrayList<Feed> list = new FeedService().selectCntSearchList(search);
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", list);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}
		//ArrayList<Feed> list = new FeedService().selectSearchList();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
