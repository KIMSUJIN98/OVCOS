package com.ovcos.feed.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ovcos.explore.model.service.ExploreService;
import com.ovcos.explore.model.vo.Explore;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.loginRegister.model.vo.Member;
import com.ovcos.notice.model.service.NoticeService;
import com.ovcos.notice.model.vo.Notice;

/**
 * Servlet implementation class FeedListController
 */
@WebServlet("/list.feed")
public class FeedListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**list.feed
     * @see HttpServlet#HttpServlet()
     */
    public FeedListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//로그인하고나서 바로연결되는서블릿 (전체피드 조회리스트만을 반환하고있음) 
//
//		HttpSession session = request.getSession();
//		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
//
//		ArrayList<Feed>  allList = new FeedService().selectArrayList(userId);
//		
//
//		response.setContentType("application/json; charset=utf-8");
//		//new Gson().toJson(allList,response.getWriter());
//
//		request.setAttribute("allList", allList);
//		request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
//		
	
		
//		-----------수정 코드------------ sorting 값을 가져오고 메인(전체피드)띄우는데 select box 정렬 가능하게하기
		
		HttpSession session = request.getSession();
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		String select = request.getParameter("sorting");
		
		
		ArrayList<Notice> nlist = new NoticeService().selectNoticeList();
		request.setAttribute("nlist", nlist);//메인 공지사항 출력용
		
		ArrayList<Feed> mylist = new FeedService().selectMyList(userId); 
		request.setAttribute("mylist", mylist);//메인 최근활동 출력용
		
		
		ArrayList<Feed>  allList = new FeedService().selectArrayList(userId);
		response.setContentType("application/json; charset=utf-8");
		
		
		if(select == null) {
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}else if(select.equals("oldest")) {
			
			Collections.sort(allList, new Comparator<Feed>() {
	            @Override
	            public int compare(Feed f1, Feed f2) {
	            	 Integer feedIndex1 = Integer.valueOf(f1.getFeedIndex());
	            	    Integer feedIndex2 = Integer.valueOf(f2.getFeedIndex());
	            	    return feedIndex1.compareTo(feedIndex2);
	            }
	        });
					
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
		}else if(select.equals("rating")) {
			
			//별점높은순
			Collections.sort(allList, new Comparator<Feed>() {
	            @Override
	            public int compare(Feed f1, Feed f2) {
	            	 Integer feedIndex1 = Integer.valueOf(f1.getFeedEval());
	            	    Integer feedIndex2 = Integer.valueOf(f2.getFeedEval());
	            	    return feedIndex2.compareTo(feedIndex1);
	            }
	        });
					
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
		
		}else if(select.equals("bookmark")) { //전체피드 탭에서 찜순정렬 선택시 
			
			//찜 개수 높은 순 정렬
			allList = new FeedService().selectBookmarkSorting(userId);
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
		
		}else {
			
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
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
