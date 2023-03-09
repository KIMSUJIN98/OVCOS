package com.ovcos.challenge.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.challenge.model.service.ChallengeService;

/**
 * Servlet implementation class NormalChallengeDeleteController
 */
@WebServlet("/deleteNormalChallenge.ch")
public class NormalChallengeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NormalChallengeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int normalChallengeNo = Integer.parseInt(request.getParameter("normalChallengeNo"));
		
		HttpSession session = request.getSession();
		
		int result = new ChallengeService().deleteNormalChallenge(normalChallengeNo);
		
		
		response.sendRedirect(request.getContextPath() + "/ncList.ch");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
