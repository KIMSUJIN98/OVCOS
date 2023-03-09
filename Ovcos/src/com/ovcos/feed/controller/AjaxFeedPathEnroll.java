package com.ovcos.feed.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.ovcos.common.GpxFileRenamePolicy;
import com.ovcos.common.GpxFileRenamePolicy2;

@WebServlet("/enroll.ajax")
public class AjaxFeedPathEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxFeedPathEnroll() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 최대크기 정하기
			int maxSize = 10*1024*1024;
			
			// 전달된 파일을 저장시킬 폴더의 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/temp_gpx_upfiles/");
			// 전달된 파일명 수정
			
			MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"utf-8", new GpxFileRenamePolicy2());
			
//			String userId = multi.getParameter("userId");
//			double startLon = Double.parseDouble(multi.getParameter("startLon"));
//			double startLat = Double.parseDouble(multi.getParameter("startLat"));
//			double distance = Double.parseDouble(multi.getParameter("distance"));
//			int rate = 0;
//			if(multi.getParameter("rating") != null) {
//				rate = Integer.parseInt(multi.getParameter("rating"));
//			}
			String fileName = multi.getFilesystemName("file");
			System.out.println(fileName);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(fileName);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
