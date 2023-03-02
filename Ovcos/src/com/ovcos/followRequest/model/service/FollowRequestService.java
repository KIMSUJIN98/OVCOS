package com.ovcos.followRequest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.ovcos.common.JDBCTemplate.*;

import com.ovcos.cut.model.dao.CutDao;
import com.ovcos.cut.model.vo.Cut;
import com.ovcos.followRequest.model.dao.FollowRequestDao;
import com.ovcos.followRequest.model.vo.FollowRequest;

public class FollowRequestService {
	
	

	public ArrayList<FollowRequest> selectInsertList(String friendId,String userId){
		
		
		Connection conn = getConnection();
		
		ArrayList<FollowRequest> list = new FollowRequestDao().selectInsertList(conn, friendId,userId);
		
		close(conn);
		
		return list;
		
	}
	
	

	
	public int updateInsertFollowRequest(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowRequestDao().updateInsertFollowRequest(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	
	/**
	 * 차단테이블에 없으면 insert 
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int insertFollowRequest(String friendId, String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowRequestDao().insertFollowRequest(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	
	
	public ArrayList<FollowRequest> selectFollowRequestList(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<FollowRequest> list = new FollowRequestDao().selectFollowRequestList(conn, userId);
		
		close(conn);
		return list;
		
	}
	
	public int deleteFollowRequest(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowRequestDao().deleteFollowRequest(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
}
