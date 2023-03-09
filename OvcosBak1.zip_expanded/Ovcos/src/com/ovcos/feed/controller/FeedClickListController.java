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
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;

/**
 * Servlet implementation class FeedFriendListController
 */
@WebServlet("/clickList.feed")
public class FeedClickListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedClickListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//메인에서 전체피드/ 친구피드/ 내피드 탭을 클릭했을시 여기로 옴

		
		
		String num = request.getParameter("num"); //1이면 전체피드 2면 내친구피드 3이면 내피드 
		String userId = request.getParameter("userId"); // 로그인유저아이디
		//탭 클릭하는 곳에서 쿼리스트링으로 값을 받아옴
		
		String sorting = request.getParameter("sorting");// 최신순/오래된순/별점순/찜순 정렬 선택한값이 들어있음
		//피드select box의 form 태그로 값을 받아옴

		
		ArrayList<Feed>  allList = null;
		
		request.getSession().setAttribute("num", num);
		
		switch (num) {
		
		
		case "1": // 전체 피드 탭을 클릭했을 시 
			
			
			allList = new FeedService().selectArrayList(userId);//전체피드 조회 데이터			
			response.setContentType("application/json; charset=utf-8");
			
			
			
			if(sorting==null) { //정렬 선택전에는 NULL  (최신순)
				
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
				
				
			}else if(sorting.equals("oldest")) { //전체피드탭에서 오래된순으로 정렬 선택시 
				
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
			
				
				
			}else if(sorting.equals("rating")) { //전체피드 탭에서 별점순으로 정렬 선택시 
				
				//별점높은순 정렬
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
			
				
				
			}else if(sorting.equals("bookmark")) { //전체피드 탭에서 찜순정렬 선택시 
				
				//찜 개수 높은 순 정렬
				allList = new FeedService().selectBookmarkSorting(userId);
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
				
			
			}else {
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			}
			break;
			
			
			
		case "2": //친구피드 탭을 클릭했을 시 
			
			allList = new FeedService().selectFriendList(userId); // 친구피드 조회 데이터 
			
			response.setContentType("application/json; charset=utf-8");
			
			if(sorting==null) {
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			}
			else if(sorting.equals("oldest")) { //친구피드탭에서 오래된순으로 정렬
				
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
			
			}else if(sorting.equals("rating")) { //친구피드탭에서 별점순으로 정렬
				
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
				
			}else if(sorting.equals("bookmark")) { //친구피드 탭에서 찜순정렬 선택시 
				
				//찜 개수 높은 순 정렬
				allList = new FeedService().selectFriendBookmarkSorting(userId);
				response.setContentType("application/json; charset=utf-8");
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			
			}else {
				
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			}
			break;
			
			
		case "3":  // 내피드 탭 클릭시 
			
			allList = new FeedService().selectMyList(userId);
			response.setContentType("application/json; charset=utf-8");
			
			if(sorting==null) {
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
				
			}else if(sorting.equals("oldest")) {
				
				//오래된순
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
				
			}else if(sorting.equals("rating")) {
				
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
			}else if(sorting.equals("bookmark")) { //친구피드 탭에서 찜순정렬 선택시 
				//찜 개수 높은 순 정렬
				allList = new FeedService().selectMyBookmarkSorting(userId);
				response.setContentType("application/json; charset=utf-8");
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
			}else {
				
				request.setAttribute("allList", allList);
				request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
				
			}
			break;

		default: 			
			allList = new FeedService().selectArrayList(userId);
			System.out.println("else탐");
			response.setContentType("application/json; charset=utf-8");
			request.setAttribute("allList", allList);
			request.getRequestDispatcher("views/feed/feedMain.jsp").forward(request, response);
				break;
		}
		
		
		//밖으로 빼니까 두번 클릭했을 때 포워딩한거 또 포워딩한다고 에러남 
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
