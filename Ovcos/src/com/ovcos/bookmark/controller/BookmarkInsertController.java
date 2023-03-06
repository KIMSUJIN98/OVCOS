package com.ovcos.bookmark.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.bookmark.model.service.BookMarkService;
import com.ovcos.bookmark.model.vo.BookMark;

/**
 * Servlet implementation class BookMarkInsertController
 */
@WebServlet("/insert.bk")
public class BookmarkInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int feedIndex = Integer.parseInt(request.getParameter("feedIndex"));
		String userId = request.getParameter("userId");
		
		
		ArrayList<BookMark> list = new BookMarkService().selectCheckinsert(feedIndex,userId);
	
		int result = 0;
		
		if(list.size()>0) {
			//이미 테이블에 존재하니까 y로 업데이트 
			result = new BookMarkService().updateInsertBookmark(feedIndex,userId);
			
		}else {
			//테이블에 없으면 insert 
			result = new BookMarkService().insertBookMark(feedIndex,userId);
		}

		new Gson().toJson(result,response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
