package com.ovcos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.loginRegister.model.service.MemberService;
import com.ovcos.loginRegister.model.vo.Member;
import com.ovcos.myPage.model.service.MyPageService;
import com.ovcos.myPage.model.vo.MyPage;

/**
 * Servlet implementation class GoalSetController
 */
@WebServlet("/goalSet.me")
public class GoalSetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoalSetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int userGoal = Integer.parseInt(request.getParameter("userGoal"));
		String userId = request.getParameter("goal-userId");
		
		int result = new MyPageService().updateSetGoal(userGoal, userId);
		Member m = new MemberService().refreshMember(userId);
		
		HttpSession session = request.getSession();
		
		if(result <= 0) {
			request.setAttribute("alertMsg", "목표설정에 실패했습니다!");
		}else {
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", m);
		}
		
		response.sendRedirect(request.getContextPath() + "/myPage.me?userId=" + userId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
