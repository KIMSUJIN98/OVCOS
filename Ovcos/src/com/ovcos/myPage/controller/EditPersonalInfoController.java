package com.ovcos.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		
		if(inputPwd.equals(userPwd)) {
			request.getRequestDispatcher("views/myPage/editPersonalInfo.jsp").forward(request, response);
		}else {
			session.removeAttribute("alertMsg");
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
