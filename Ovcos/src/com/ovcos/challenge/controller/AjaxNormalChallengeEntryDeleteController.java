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
 * Servlet implementation class AjaxNormalChallengeDeleteController
 */
@WebServlet("/normalEntryDelete.ch")
public class AjaxNormalChallengeEntryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNormalChallengeEntryDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String normalEntryId = ((Member)request.getSession().getAttribute("loginUser")).getMemId();
		int normalChallNo = Integer.parseInt(request.getParameter("normalEntryDelete"));
		
		NEntryList nel = new NEntryList();
		nel.setNormalChallNo(normalChallNo);
		nel.setNormalEntryId(normalEntryId);
		
		int result = new ChallengeService().deleteNEntryList(nel);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
