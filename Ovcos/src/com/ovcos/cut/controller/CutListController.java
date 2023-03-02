package com.ovcos.cut.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.cut.model.service.CutService;
import com.ovcos.cut.model.vo.Cut;
import com.ovcos.follow.model.service.FollowService;
import com.ovcos.follow.model.vo.Follow;

/**
 * Servlet implementation class cutListController
 */
@WebServlet("/cutList.cut")
public class CutListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CutListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		response.setContentType("application/json; charset=utf-8");
		String userId = request.getParameter("userId");


		ArrayList<Cut> list = new CutService().selectCutList(userId);
		
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
