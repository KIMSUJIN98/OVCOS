package com.ovcos.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class ContestMainController
 */
@WebServlet("/cntsMain.ch")
public class ContestListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContestListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ArrayList<Contest> list = new ChallengeService().selectContestList();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
//		int contestNo = 0;
//		for(Contest c : list) {
//			contestNo = c.getContestNo();
//		}
		
		request.setAttribute("list", list);
		request.setAttribute("loginUser", loginUser);
		request.getRequestDispatcher("views/challenge/contestMain.jsp").forward(request, response);
		
//		request.setAttribute("contestNo", contestNo);
//		request.getRequestDispatcher("views/challenge/ccList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
