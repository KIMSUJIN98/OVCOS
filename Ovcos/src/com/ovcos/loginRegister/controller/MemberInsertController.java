package com.ovcos.loginRegister.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ovcos.loginRegister.model.service.MemberService;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		System.out.println("여기 탐?");
		Member m = new Member();
		
		m.setMemId(request.getParameter("memId"));
		m.setMemPwd(request.getParameter("memPwd"));
		m.setMemName(request.getParameter("memName"));
		m.setMemNick(request.getParameter("memNick"));
		m.setMemBirth(request.getParameter("memBirth"));
		m.setMemEml(request.getParameter("memEml"));
		
		System.out.println(m);
		
		HttpSession session = request.getSession();
		String marketAgree = (String) session.getAttribute("marketAgree");
			
		  String memId=request.getParameter("memId"); 
		  String memPwd=request.getParameter("memPwd"); 
		  String memName=request.getParameter("memName"); 
		  String memNick=request.getParameter("memNick");
		  String memBirth=request.getParameter("memBirth");
		  String memEml=request.getParameter("memEml");
		  //String marketNy=(String) request.getParameter("select");
		  String marketNy = request.getParameter("selectResult");
		  System.out.println(marketNy);
		 
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		m.setMemName(memName);
		m.setMemNick(memNick);
		m.setMemBirth(memBirth);
		m.setMemEml(memEml);
		m.setMarketNy(marketNy);
		
		System.out.println(m);
	
		  int result = new MemberService().insertMember(m);
		  
		  if(result>0) {
			  String message = "회원가입에 성공했습니다.";
			  request.setAttribute("alertMsg", message);
			} else {
				 String message = "회원가입에 실패했습니다. 다시 시도해주세요.";
				  request.setAttribute("alertMsg", message);
				 }

		  RequestDispatcher rd = request.getRequestDispatcher("views/loginRegister/login.jsp");
		  rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
