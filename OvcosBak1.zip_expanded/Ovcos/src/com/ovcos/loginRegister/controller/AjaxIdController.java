package com.ovcos.loginRegister.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.loginRegister.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdController
 */
@WebServlet("/idCheck.me")
public class AjaxIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checkId = request.getParameter("checkId");
		
		int count = new MemberService().idCheck(checkId);
		
		if(count > 0) { // 존재하는 id가 있음 => 사용 불가 => "NNNNN"
			response.getWriter().print("NNNNN");
		} else { // 존재하는 id가 없음 => 사용 가능 => "NNNNY"
			response.getWriter().print("NNNNY");
			// 이게 멤버인롤폼으로 넘어옴
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
