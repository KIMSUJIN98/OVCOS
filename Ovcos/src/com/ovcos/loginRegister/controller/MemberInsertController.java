package com.ovcos.loginRegister.controller;

import java.io.IOException;
import java.sql.Date;
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
		m.setMemBirth(request.getParameter("memBirth"));gr
		m.setMemEml(request.getParameter("memEml"));
		
		System.out.println(m);
		
		HttpSession session = request.getSession();
		String marketAgree = (String) session.getAttribute("marketAgree");
		
		/*
		 * Properties props = System.getProperties(); props.put("mail.stmp.user",
		 * "khofcos@gmail.com"); props.put("mail.stmp.host", "stmp.gmail.com");
		 * props.put("mail.stmp.port", "465"); props.put("mail.stmp.starttls.enable",
		 * "true"); props.put("mail.smtp.auth", "true");
		 * props.put("mail.stmp.socketFactory.port", "465");
		 * props.put("mail.stmp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 * props.put("mail.smtp.socketFactory.fallback", "false");
		 * 
		 * Authenticator auth = new MyAuthentication();
		 * 
		 * Session session1 = Session.getDefaultInstance(props, auth); MimeMessage msg =
		 * new MimeMessage(session1);
		 * 
		 * msg.setSentDate(new java.util.Date()); InternetAddress from = new
		 * InternetAddress("khofcos@gmail.com");
		 * 
		 * msg.setFrom(from); String email=request.getParameter("receiver");
		 * InternetAddress to = new InternetAddress(email);
		 * msg.setRecipient(Message.RecipientType.TO, to);
		 * 
		 * msg.setSubject("비밀번호 인증번호", "UTF-8");
		 * 
		 * String code = request.getParameter("code_check");
		 * request.setAttribute("code", code); msg.setText(code, "UTF-8");
		 * 
		 * msg.setHeader("content-Type", "text/html");
		 * 
		 * javax.mail.Transport.send(msg); System.out.println("보냄!");
		 * 
		 * RequestDispatcher rd = request.getRequestDispatcher("인증번호확인페이지");
		 * rd.forward(request, response);
		 * 
		 * String marketNy = marketAgree != null && marketAgree.equals("Y") ? "Y" : "N";
		 * m.setMarketNy(marketNy);
		 * 
		 * int result = new MemberService().insertMember(m);
		 * 
		 * if(result>0) { session = request.getSession();
		 * session.setAttribute("alertMsg", "회원가입이 완료되었습니다.");
		 * 
		 * response.sendRedirect(request.getContextPath()); } else {
		 * request.setAttribute("alertMsg", "회원가입에 실패했습니다.");
		 * 
		 * RequestDispatcher view =
		 * request.getRequestDispatcher("/views/loginRegister/login.jsp");
		 * view.forward(request, response); }
		 */
		
		  String memId=request.getParameter("memId"); 
		  String memPwd=request.getParameter("memPwd"); 
		  String memName=request.getParameter("memName"); 
		  String memNick=request.getParameter("memNick");
		  String memBirth=request.getParameter("memBirth");
		 String memEml=request.getParameter("memEml");
		 String marketNy=request.getParameter("marketNy");
		  
		  m = new Member(memId, memPwd, memName, memNick, memBirth, memEml, marketNy);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
