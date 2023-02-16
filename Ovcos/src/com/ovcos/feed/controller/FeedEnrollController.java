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

@WebServlet("/enroll.feed")
public class FeedEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FeedEnrollController() {
        super();
    }

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
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			
			
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
