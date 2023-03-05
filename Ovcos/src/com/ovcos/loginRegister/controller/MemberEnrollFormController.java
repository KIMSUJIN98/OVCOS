package com.ovcos.loginRegister.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.loginRegister.model.service.MemberService;

/**
 * Servlet implementation class MemberEnrollFormController
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEnrollFormController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String result = request.getParameter("select");

		request.setAttribute("select", result);
		
		request.getRequestDispatcher("views/loginRegister/insertInfo.jsp").forward(request, response);

		
		/* System.out.println(result + "dnfkfkfkf"); */

		/* int res = new MemberService().insertNy(result); */

		/*
		 * if(result!=null) { HttpSession session = request.getSession();
		 * System.out.println("잘됨"); response.sendRedirect(request.getContextPath() +
		 * "/enrollForm.me"); } else { System.out.println("다시 해");
		 * response.sendRedirect(request.getContextPath() +"/enrollForm.me"); }
		 */

		/*
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("views/loginRegister/insertInfo.jsp");
		 * view.forward(request, response);
		 */

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
