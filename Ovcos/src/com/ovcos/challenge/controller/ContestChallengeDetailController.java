package com.ovcos.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.ContestChallenge;

/**
 * Servlet implementation class ContestChallengeDetailController
 */
@WebServlet("/detailContestChallenge.ch")
public class ContestChallengeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContestChallengeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int contestChallengeNo = Integer.parseInt(request.getParameter("challengeNo"));
		int contestNo = Integer.parseInt(request.getParameter("contestNo"));
		
		ArrayList<ContestChallenge> list1 = new ChallengeService().selectContestChallenge(contestChallengeNo, contestNo);
		System.out.println(list1);
		
		request.setAttribute("list1", list1);
		request.getRequestDispatcher("views/challenge/contestList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
