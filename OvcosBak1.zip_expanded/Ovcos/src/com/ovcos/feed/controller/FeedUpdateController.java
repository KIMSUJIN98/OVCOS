package com.ovcos.feed.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.ovcos.common.GpxFileRenamePolicy;
import com.ovcos.feed.model.service.FeedService;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.upload.model.vo.Gpx;

/**
 * Servlet implementation class FeedUpdateController
 */
@WebServlet("/update.feed")
public class FeedUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 데이터를 넘겨야 하니깐 
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 최대크기 정하기
			int maxSize = 10*1024*1024;
			
			// 전달된 파일을 저장시킬 폴더의 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/gpx_upfiles/");
			
			// 전달된 파일명 수정
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"utf-8", new GpxFileRenamePolicy());
			
			String userId = multi.getParameter("userId");
			double startLon = Double.parseDouble(multi.getParameter("startLon"));
			double startLat = Double.parseDouble(multi.getParameter("startLat"));
			double distance = Double.parseDouble(multi.getParameter("distance"));
			System.out.println(multi.getParameter("startLon"));
			int rate = 0;
			int feedIndex = Integer.parseInt(multi.getParameter("feedIndex"));
			if(multi.getParameter("rating") != null) {
				rate = Integer.parseInt(multi.getParameter("rating"));
			}
			
			String imgPath = multi.getParameter("imgPath");
			System.out.println("컨트롤러"+imgPath);
			String title = multi.getParameter("title");	
			String content = multi.getParameter("content");
			String feedPublicType = multi.getParameter("displayNy");
			String feedPathNy = multi.getParameter("trackNy");
			
			// 파일 명, 경로
			String fileName = multi.getFilesystemName("avatar");
			
			
			Feed f = new Feed();
			
			f.setMemId(userId);
			f.setStartLon(startLon);
			f.setStartLat(startLat);
			f.setDistance(distance);
			f.setFeedEval(rate);
			f.setFeedTitle(title);
			f.setFeedCnt(content);
			f.setFeedPublicType(feedPublicType);
			f.setFeedPathNy(feedPathNy);
			f.setImgPath(imgPath);
			f.setFeedIndex(feedIndex);
			
			//Gpx 객체
			Gpx gpx = null;
			if(multi.getOriginalFileName("avatar") != null) {
				gpx = new Gpx();
				gpx.setOriginName(multi.getOriginalFileName("avatar"));
				gpx.setChangeName(fileName);
				gpx.setFilePath("resources/gpx_upfiles/");
				gpx.setFeedIndex(feedIndex);
			}
			
			PrintWriter out = response.getWriter();
			
			//서비스 요청 
			int result = new FeedService().updateFeed(f,gpx);
			
			HttpSession session = request.getSession();
			//응답뷰 지정
			if(result>0) {
				response.sendRedirect(request.getContextPath()+"/list.feed");
				//session.setAttribute("enrollFeed", "success");
			}else {
				response.sendRedirect(request.getContextPath()+"/list.feed");
				//session.setAttribute("enrollFeed", "fail");
			}
			
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
