package com.ovcos.followRequest.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.followRequest.model.service.FollowRequestService;

/**
 * Servlet implementation class FollowRequestDeleteController
 */
@WebServlet("/delete.rq")
public class FollowRequestDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowRequestDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String friendId = request.getParameter("friendId");
		String userId = request.getParameter("userId");
		
		System.out.println("친구요청리스트컨트롤러 프렌드아이디:"+friendId+"로긴아이디:"+userId);
		int result = new FollowRequestService().deleteFollowRequest(friendId,userId);
		
		System.out.println("컨트롤러리절트값"+result);
		new Gson().toJson(result,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
