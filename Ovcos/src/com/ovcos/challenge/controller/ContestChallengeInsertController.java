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
import com.ovcos.common.ContestChallengeFileRenamePolicy;
import com.ovcos.loginRegister.model.vo.Member;
import com.ovcos.upload.model.vo.ImageUpload;

/**
 * Servlet implementation class ContestChallengeInsertController
 */
@WebServlet("/newContestChallenge.ch")
public class ContestChallengeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContestChallengeInsertController() {
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
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "utf-8", new ContestChallengeFileRenamePolicy());
			
			String contestChallengeId = multi.getParameter("userId");
			String contestChallengeTitle = multi.getParameter("challengeName");
			String challengeDate = multi.getParameter("challengeDate");
			String challengeTime = multi.getParameter("challengeTime");
			int contestChallengeMax = Integer.parseInt(multi.getParameter("challengeMax"));
			String contestChallengeContent = multi.getParameter("challengeContent");
			String fileName = multi.getFilesystemName("challengeImg");
			String contestNo = multi.getParameter("contestNo");
			
			String YYYY = challengeDate.substring(0, 4);
			String MM = challengeDate.substring(5, 7);
			String DD = challengeDate.substring(8, 10);
			String[] challengeTime1 = challengeTime.split(":");
			
//			System.out.println(YYYY);
//			System.out.println(MM);
//			System.out.println(DD);
//			System.out.println(challengeTime1[0]);
//			System.out.println(challengeTime1[1]);
			
			String contestChallengeDate = YYYY + MM + DD + challengeTime1[0] + challengeTime1[1];
			
//			System.out.println(contestChallengeDate);
			
			ContestChallenge cc = new ContestChallenge();
			cc.setContestChallengeId(contestChallengeId);
			cc.setContestChallengeTitle(contestChallengeTitle);
			cc.setContestChallengeDate(contestChallengeDate);
			cc.setContestNo(contestNo);
			cc.setContestChallengeMax(contestChallengeMax);
			cc.setContestChallengeContent(contestChallengeContent);
			
			ImageUpload img = null;
			if(multi.getOriginalFileName("challengeImg") != null) {
				img = new ImageUpload();
				img.setUplId(((Member)request.getSession().getAttribute("loginUser")).getMemId());
				img.setUplMenu(2);
				img.setOriginName(multi.getOriginalFileName("challengeImg"));
				img.setChangeName(fileName);
			}
			
			PrintWriter out = response.getWriter();
			
			int result = new ChallengeService().insertContestChallenge(cc, img);
			
			response.sendRedirect(request.getContextPath() + "/ccList.ch?contestNo=" + contestNo);
			
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
