package com.ovcos.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ovcos.follow.model.service.FollowService;
import com.ovcos.follow.model.vo.Follow;

/**
 * Servlet implementation class FolllowInsertController
 */
@WebServlet("/insertFriend.fw")
public class FollowInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//친구"추가" 버튼 눌렀을 시 탐
		
		String friendId = request.getParameter("friendId");
		String userId = request.getParameter("userId");
		
		
		//select떄려서 팔로테이블에 값 있으면 update하고 없으면 insert하기
		ArrayList<Follow> list = new FollowService().selectInsertList(friendId,userId);
		

		
		int result = 0;
		
		if(list.size()>0) {
			//팔로테이블에 이미 있으면 업데이트 status를 y로 바꾸기 

			result = new FollowService().updateInsertFollow(friendId,userId);
			
		}else{
			//팔로테이블에 결과 없으면 인서트되기 
			result = new FollowService().insertFollow(friendId,userId);
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
