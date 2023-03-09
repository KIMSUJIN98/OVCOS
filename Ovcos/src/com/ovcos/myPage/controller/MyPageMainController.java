package com.ovcos.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.bookmark.model.service.BookMarkService;
import com.ovcos.bookmark.model.vo.BookMark;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.myPage.model.service.MyPageService;
import com.ovcos.myPage.model.vo.MyPage;

/**
 * Servlet implementation class MyPageMainController
 */
@WebServlet("/myPage.me")
public class MyPageMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		
		MyPage mp = new MyPageService().totalDistance(userId);
		double monthDistance = mp.getDistance();
		
		String today = new MyPageService().selectToday();
		
		ArrayList<MyPage> list = new MyPageService().dayDistanceList(userId);
		
		ArrayList<Feed> fList = new FeedService().selectMyList(userId);
		
		ArrayList<Feed> cList = new FeedService().selectMyComments(userId);
		
		ArrayList<BookMark> bList = new BookMarkService().selectMyBookmark(userId);
		
		HttpSession session = request.getSession();
		if(monthDistance != 0 && !list.isEmpty()) {
			session.setAttribute("monthDistance", monthDistance);
			session.setAttribute("dayList", list);
		} /*
			 * else if(monthDistance != 0 && list.isEmpty()){
			 * session.setAttribute("alertMsg", "저장된 러닝 기록이 없을리가 없는데..."); }else
			 * if(monthDistance == 0 && !list.isEmpty()){ session.setAttribute("alertMsg",
			 * "이번달은 러닝 기록이 없습니다."); }else { session.setAttribute("alertMsg",
			 * "저장된 러닝 기록이 없습니다."); }
			 */
		
		/*
		 * if(!fList.isEmpty()) { session.setAttribute("feedList", fList); }else {
		 * request.setAttribute("alertMsg", "작성한 피드 게시글이 없습니다!"); }
		 */
		
		if(today != null) {
			session.setAttribute("today", today);
		}
		
		session.setAttribute("feedList", fList);
		session.setAttribute("CommentList", cList);
		session.setAttribute("BookmarkList", bList);
		
		request.getRequestDispatcher("views/myPage/myPageMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
