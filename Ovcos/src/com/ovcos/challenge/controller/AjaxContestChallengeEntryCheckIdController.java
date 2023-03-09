package com.ovcos.challenge.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.EntryList;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class AjaxContestChallengeEntryCheckController
 */
@WebServlet("/checkEntryId.ch")
public class AjaxContestChallengeEntryCheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public AjaxContestChallengeEntryCheckIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int contestChallengeNo = Integer.parseInt(request.getParameter("contestChallengeNo"));
		
		EntryList el = new EntryList();
		el.setContestChallNo(contestChallengeNo);
		el.setContestEntryId(userId);
		
		int result = new ChallengeService().checkEntryId(el);
		
		response.getWriter().print(result); // 1, 0
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
