package com.ovcos.followRequest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.cut.model.service.CutService;
import com.ovcos.cut.model.vo.Cut;
import com.ovcos.followRequest.model.service.FollowRequestService;
import com.ovcos.followRequest.model.vo.FollowRequest;

/**
 * Servlet implementation class FollowRequestInsertController
 */
@WebServlet("/insert.rq")
public class FollowRequestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowRequestInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//차단하기 버튼 눌렀을 시 여기로옴

		String friendId = request.getParameter("friendId");
		String userId = request.getParameter("userId");
		
		ArrayList<FollowRequest> list = new FollowRequestService().selectInsertList(friendId,userId);
		
		
		int result = 0;
		
		if(list.size()>0) {
			//컷테이블에 이미 있으면 status를 y로 바꾸기 
			result = new FollowRequestService().updateInsertFollowRequest(friendId,userId);
			
		}else{
			//팔로테이블에 결과 없으면 인서트되기 
			result = new FollowRequestService().insertFollowRequest(friendId,userId);
		}
		
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
