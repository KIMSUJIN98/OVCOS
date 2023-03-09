package com.ovcos.challenge.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.EntryList;

/**
 * Servlet implementation class ContestChallengeListViewController
 */
@WebServlet("/ccList.ch")
public class ContestChallengeListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContestChallengeListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int contestNo = Integer.parseInt(request.getParameter("contestNo"));
		
		ArrayList<ContestChallenge> list = new ChallengeService().contestChallengeList(contestNo);
		
		Contest c = new ChallengeService().selectContest(contestNo);
		
		request.setAttribute("list", list);
		request.setAttribute("c", c);
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
