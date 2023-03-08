package com.ovcos.loginRegister.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ovcos.loginRegister.model.service.MemberService;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
       String email= request.getParameter("memEml") + request.getParameter("email-provider");
       String name = request.getParameter("memName");
       
       Member isRegistered = new MemberService().checkRegister(name, email);
       
       System.out.println("여기?");
       
       System.out.println(isRegistered);
       if(isRegistered == null) {
    	   request.setAttribute("errorMessage", "조회된 회원정보가 없습니다. 다시 시도해주세요.");
    	   RequestDispatcher dispatcher = request.getRequestDispatcher("views/loginRegister/findId2.jsp");
           dispatcher.forward(request, response);
    	   System.out.println("여기?");
       } else {
    	   String id = isRegistered.getMemId();
           request.setAttribute("id", id);
           System.out.println(id);
       }
       System.out.println("여기?");
       //System.out.println(id);
       RequestDispatcher dispatcher = request.getRequestDispatcher("views/loginRegister/findId2.jsp");
       dispatcher.forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
