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
import com.ovcos.loginRegister.model.vo.Member;

@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 컨트롤러 시작");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 로그인완료시 회원정보 가져옴
		Member m = new MemberService().loginMember(userId,userPwd);
		
		//로그인 정보 또는 실패할시 정보를 알려주기 위해 세션 가져오기
		HttpSession session = request.getSession();
		
		if(m == null) {
			session.setAttribute("erroMsg", "로그인에 실패했습니다");
		}else {
			session.setAttribute("loginUser", m);
			response.sendRedirect(request.getContextPath()+"/list.feed");
			
			//RequestDispatcher view = request.getRequestDispatcher("views/feed/feedMain.jsp");
			//view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
