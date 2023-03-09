package com.ovcos.feed.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * Servlet implementation class AjaxFeedTest
 */
@WebServlet("/aft")
public class AjaxFeedImgPathEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFeedImgPathEnroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String binaryData = request.getParameter("imgSrc");
		String name = request.getParameter("fileName");
		System.out.println(name);
		FileOutputStream stream = null;
		
		try{
			if(binaryData == null || binaryData.trim().equals("")) {
			    throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			String fileName = UUID.randomUUID().toString();
			System.out.println(fileName);
			
			stream = new FileOutputStream("C:\\99_ovcos\\Ovcos\\WebContent\\resources\\gpx_img\\"+name);
			stream.write(file);
			stream.close();
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(name);
			System.out.println("저장성공");
		    
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally{
			if(stream != null) {
				stream.close();
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
