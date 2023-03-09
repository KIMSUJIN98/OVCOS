package com.ovcos.feed.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.feed.model.service.FeedService;

/**
 * Servlet implementation class detail2ReplyController
 */
@WebServlet("/insertcomm.de")
public class detail2commentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail2commentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int feedin = Integer.parseInt(request.getParameter("feed_index"));
		//System.out.println(feedin);
		String cmnid = request.getParameter("feed_cmn_id");
		//System.out.println(cmnid);
		String cmncnt = request.getParameter("feed_cmn_cnt");
		//System.out.println(cmncnt);
		
		
		int result = new FeedService().insertcomments(feedin, cmnid, cmncnt);
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
