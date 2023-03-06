package com.ovcos.feed.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.feed.model.dao.FeedDao;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.detail2comments;

/**
 * Servlet implementation class detail2selectController
 */
@WebServlet("/rselect.de")
public class detail2selectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail2selectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int feedin = Integer.parseInt(request.getParameter("feed_index"));
		//System.out.println(feedin);
		
		ArrayList<detail2comments> list = new FeedService().selectdetail2(feedin);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
