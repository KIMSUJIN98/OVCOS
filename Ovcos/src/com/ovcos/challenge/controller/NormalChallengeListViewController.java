package com.ovcos.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.Local;
import com.ovcos.challenge.model.vo.NormalChallenge;

/**
 * Servlet implementation class NormalChallengeListViewController
 */
@WebServlet("/ncList.ch")
public class NormalChallengeListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NormalChallengeListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Local> list1 = new ChallengeService().selectLocalList();
		
		int local = Integer.parseInt(request.getParameter("local"));
		
		ArrayList<NormalChallenge> list2 = new ChallengeService().normalChallengeList(local);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("views/challenge/normalList.jsp").forward(request, response);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list1, response.getWriter());
		new Gson().toJson(list2, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
