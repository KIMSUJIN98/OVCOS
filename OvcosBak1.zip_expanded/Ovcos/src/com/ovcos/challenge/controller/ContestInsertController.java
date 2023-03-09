package com.ovcos.challenge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.common.ContestFileRenamePolicy;
import com.ovcos.loginRegister.model.vo.Member;
import com.ovcos.upload.model.vo.ImageUpload;

/**
 * Servlet implementation class ContestInsertController
 */
@WebServlet("/insertContest.ch")
public class ContestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContestInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println(ServletFileUpload.isMultipartContent(request));
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new ContestFileRenamePolicy());
			
			String contestName = multi.getParameter("contestName");
			String contestDateTime = multi.getParameter("contestDate");
			String contestUrl = multi.getParameter("contestUrl");
			String fileName = multi.getFilesystemName("contestImg");
			
			String YYYY = contestDateTime.substring(0, 4);
			String MM = contestDateTime.substring(5, 7);
			String DD = contestDateTime.substring(8, 10);
			String HH = contestDateTime.substring(11, 13);
			String MI = contestDateTime.substring(14, 16);
			String contestDate = YYYY + MM + DD + HH + MI;
			
//			System.out.println(YYYY);
//			System.out.println(MM);
//			System.out.println(DD);
//			System.out.println(HH);
//			System.out.println(MI);
			
			Contest c = new Contest();
			c.setContestName(contestName);
			c.setContestDate(contestDate);
			c.setContestUrl(contestUrl);
			
			ImageUpload img = null;
			if(multi.getOriginalFileName("contestImg") != null) {
				img = new ImageUpload();
				img.setUplId(((Member)request.getSession().getAttribute("loginUser")).getMemId());
				img.setUplMenu(1);
				img.setOriginName(multi.getOriginalFileName("contestImg"));
				img.setChangeName(fileName);
			}
			
			PrintWriter out = response.getWriter();
			
			int result = new ChallengeService().insertContest(c, img);
			
//			HttpSession session = request.getSession();
			
//			request.setAttribute("img", img);
			response.sendRedirect(request.getContextPath() + "/cntsMain.ch");
//			request.getRequestDispatcher("views/challenge/contestMain.jsp").forward(request, response);
			
			
//			response.sendRedirect("/Ovcos/cntsMain.ch");
			
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
