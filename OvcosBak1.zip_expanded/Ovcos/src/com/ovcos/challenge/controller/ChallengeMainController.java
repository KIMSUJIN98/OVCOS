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
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.EntryList;
import com.ovcos.challenge.model.vo.NEntryList;
import com.ovcos.challenge.model.vo.NormalChallenge;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class ChallengeMainController
 */
@WebServlet("/main.ch")
public class ChallengeMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getMemId();
		
		ChallengeService cService = new ChallengeService();
		
		int contestProgressCount = cService.contestProgressCount(userId);
		int contestCompleteCount = cService.contestCompleteCount(userId);
		request.setAttribute("contestProgressCount", contestProgressCount);
		request.setAttribute("contestCompleteCount", contestCompleteCount);
		
		int normalProgressCount = cService.normalProgressCount(userId);
		int normalCompleteCount = cService.normalCompleteCount(userId);
		request.setAttribute("normalProgressCount", normalProgressCount);
		request.setAttribute("normalCompleteCount", normalCompleteCount);
		
		int totalProgressCount = contestProgressCount + normalProgressCount;
		int totalCompleteCount = contestCompleteCount + normalCompleteCount;
		request.setAttribute("totalProgressCount", totalProgressCount);
		request.setAttribute("totalCompleteCount", totalCompleteCount);
		
		ArrayList<ContestChallenge> list1 = new ChallengeService().mainContestList(userId);
		ArrayList<NormalChallenge> list2 = new ChallengeService().mainNormalList(userId);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("views/challenge/challengeMain.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
