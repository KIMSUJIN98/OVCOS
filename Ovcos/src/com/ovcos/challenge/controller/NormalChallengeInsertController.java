package com.ovcos.challenge.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.NormalChallenge;
import com.ovcos.common.NormalChallengeFileRenamePolicy;
import com.ovcos.loginRegister.model.vo.Member;
import com.ovcos.upload.model.vo.ImageUpload;

/**
 * Servlet implementation class NormalChallengeInsertController
 */
@WebServlet("/newNormalChallenge.ch")
public class NormalChallengeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NormalChallengeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		System.out.println(ServletFileUpload.isMultipartContent(request));
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new NormalChallengeFileRenamePolicy());
			
			String normalChallengeId = multi.getParameter("userId");
			String normalChallengeTitle = multi.getParameter("challengeName");
			String normalChallengeLocal = multi.getParameter("insertLocal");
			String normalDate = multi.getParameter("challengeDate");
			String normalTime = multi.getParameter("challengeTime");
			int normalChallengeMax = Integer.parseInt(multi.getParameter("challengeMax"));
			String normalChallengeContent = multi.getParameter("challengeContent");
			String fileName = multi.getFilesystemName("challengeImg");
			
			String YYYY = normalDate.substring(0, 4);
			String MM = normalDate.substring(5, 7);
			String DD = normalDate.substring(8, 10);
			String[] normalTime1 = normalTime.split(":");
			
//			System.out.println(YYYY);
//			System.out.println(MM);
//			System.out.println(DD);
//			System.out.println(normalTime1[0]);
//			System.out.println(normalTime1[1]);
			
			String normalChallengeDate = YYYY + MM + DD + normalTime1[0] + normalTime1[1];
			
//			System.out.println(normalChallengeDate);
			
			NormalChallenge nc = new NormalChallenge();
			nc.setNormalChallengeId(normalChallengeId);
			nc.setNormalChallengeTitle(normalChallengeTitle);
			nc.setNormalChallengeDate(normalChallengeDate);
			nc.setNormalChallengeMax(normalChallengeMax);
			nc.setNormalChallengeContent(normalChallengeContent);
			nc.setNormalChallengeLocal(normalChallengeLocal);
			
			ImageUpload img = null;
			if(multi.getOriginalFileName("challengeImg") != null) {
				img = new ImageUpload();
				img.setUplId(((Member)request.getSession().getAttribute("loginUser")).getMemId());
				img.setUplMenu(2);
				img.setOriginName(multi.getOriginalFileName("challengeImg"));
				img.setChangeName(fileName);
			}
			
			PrintWriter out = response.getWriter();
			
			int result = new ChallengeService().insertNormalChallenge(nc, img);
			
			response.sendRedirect(request.getContextPath() + "/ncList.ch?local=0");
			
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
