package com.ovcos.loginRegister.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.loginRegister.model.service.MemberService;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String updatePwd = request.getParameter("memPwd");
		String id = request.getParameter("id");
		/*
		 * String id = request.getParameter("id");
		 */
		
		Member updateMem = new MemberService().updatePwd(updatePwd, id);
		
		System.out.println(updatePwd); 
		System.out.println(id);
		System.out.println(updateMem);
		
		if(updateMem == null) {
			System.out.println("실패");
			request.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/loginRegister/findPwd2.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("변경완료");
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/loginRegister/findPwd3.jsp");
			dispatcher.forward(request, response);
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
