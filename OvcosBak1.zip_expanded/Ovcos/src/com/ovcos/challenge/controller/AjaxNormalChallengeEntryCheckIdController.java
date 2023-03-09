package com.ovcos.challenge.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.NEntryList;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class AjaxNormalChallengeEntryCheckIdController
 */
@WebServlet("/normalCheckEntryId.ch")
public class AjaxNormalChallengeEntryCheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNormalChallengeEntryCheckIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int normalChallengeNo = Integer.parseInt(request.getParameter("normalChallengeNo"));
		
		NEntryList el = new NEntryList();
		el.setNormalChallNo(normalChallengeNo);
		el.setNormalEntryId(userId);
		
		int result = new ChallengeService().checkNEntryId(el);
		
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
