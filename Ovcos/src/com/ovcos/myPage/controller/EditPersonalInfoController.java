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

/**
 * Servlet implementation class EditInfoController
 */
@WebServlet("/editInfo.me")
public class EditPersonalInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPersonalInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("check-userId");
		String userPwd = request.getParameter("check-userPwd");
		String inputPwd = request.getParameter("inputPwd");
		
		Member m = new MemberService().loginMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		
		if(inputPwd.equals(userPwd)) {
			session.setAttribute("userInfo", m);
			request.getRequestDispatcher("views/myPage/editPersonalInfo.jsp").forward(request, response);
		}else {
			session.removeAttribute("alertMsg");
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			/*request.getRequestDispatcher("views/myPage/myPageMain.jsp").forward(request, response);*/
			response.sendRedirect(request.getContextPath() + "/myPage.me?userId=" + userId);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
