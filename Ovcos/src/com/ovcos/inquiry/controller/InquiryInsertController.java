package com.ovcos.inquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.ovcos.inquiry.model.service.InquiryService;
import com.ovcos.inquiry.model.vo.Inquiry;
import com.ovcos.loginRegister.model.vo.Member;

/**
 * Servlet implementation class InquiryInsertController
 */
@WebServlet("/insert.bo")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String inqTitle = request.getParameter("inqTitle");
		
		
		int inqMenu = Integer.parseInt(request.getParameter("select"));
		System.out.println(inqMenu);
		String inqCnt = request.getParameter("inqCnt");
		
		HttpSession session = request.getSession();
		String memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		Inquiry i = new Inquiry();
		i.setInqTitle(inqTitle);
		i.setInqMenu(inqMenu);
		i.setInqCnt(inqCnt);
		i.setMemId(memId);
		
		int result = new InquiryService().insertInquiry(i);
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "문의사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo");
		} else {
			
			request.setAttribute("alertMsg", "문의사항 등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo");
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
