package com.ovcos.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(local);
		
		ArrayList<NormalChallenge> list2 = new ChallengeService().normalChallengeList(local);
		
//		ArrayList<NormalChallenge> list3 = new ChallengeService().normalChallengeListLocal(local);
//		request.setAttribute("list3", list3);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("views/challenge/normalList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
