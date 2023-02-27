package com.ovcos.follow.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.follow.model.dao.FollowDao;
import com.ovcos.follow.model.vo.Follow;

import static com.ovcos.common.JDBCTemplate.*;


public class FollowService {
	
	
	
	
	public int selectListCount(String userId) {
		
		
		
		Connection conn = getConnection();
		
		int listCount = new FollowDao().selectListCount(conn, userId);
		//죄회만하는거라서 트랜젝션처리 필요없음
		
		close(conn);
		
		return listCount;
	}
	
	
	public ArrayList<Follow> selectList(Pageinfo pi, String userId){
		
		
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectList(conn, pi, userId);
		
		close(conn);
		
		
		return list;
		
		
		
		
	}
	
	public ArrayList<Follow> selectMyfriendList(String userId){
		
		
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectMyfriendList(conn, userId);
		
		close(conn);
		
		
		return list;
		
		
		
		
	}
	
	
	public ArrayList<Follow> selectaddMeList (String userId){
		
		
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectaddMeList(conn, userId);
		
		close(conn);
		
		
		return list;
		
		
		
		
	}
	

}
