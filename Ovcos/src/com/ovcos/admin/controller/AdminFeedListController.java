package com.ovcos.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.follow.model.service.FollowService;
import com.ovcos.follow.model.vo.Follow;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class AdminFeedListController
 */
@WebServlet("/feedList.admin")
public class AdminFeedListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFeedListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		
		int listCount;		//현재 총 게시글 개수 저장용
		int currentPage; 	//현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		//페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩 배치할건지) 1,2,3,4,....10개/ 5개
		int boardLimit;		//한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩) 15개씩, 20개씩

		int maxPage;		//가장 마지막페이지 (총 페이지 수) 전체게시글에서 가장 끝
		int startPage; 		//페이징 바의 시작 수 4번선택시 1, 12번시 11
		int endPage; 		//페이징 바의 끝 수 4번선택시10, 12선택시 20
		
		listCount = new FeedService().selectListCount();
		
		currentPage =  Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);		
		startPage = (currentPage-1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit -1;
		
		if(endPage>maxPage) {//endPage가 maxPage보다 크면
			endPage = maxPage; //endPage를 maxpage로
		}
		
		Pageinfo pi = new Pageinfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Feed> list = new FeedService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		//System.out.println(list);
		response.setContentType("application/json; charset=utf-8");
		request.getRequestDispatcher("views/admin/feedAdmin.jsp").forward(request, response);
		
//		
//		
//		ArrayList<Feed> list  = new FeedService().selectFeedList();
//		response.setContentType("application/json; charset=utf-8");
//		
//		
//		request.setAttribute("list", list);
//		
//		
//		request.getRequestDispatcher("views/admin/feedAdmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
