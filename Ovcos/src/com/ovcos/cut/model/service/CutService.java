package com.ovcos.cut.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.cut.model.dao.CutDao;
import com.ovcos.cut.model.vo.Cut;
import com.ovcos.follow.model.dao.FollowDao;
import com.ovcos.follow.model.vo.Follow;

import static com.ovcos.common.JDBCTemplate.*;

public class CutService {
	
	public ArrayList<Cut> selectCutList(String userId){
		
		
		Connection conn = getConnection();
		
		ArrayList<Cut> list = new CutDao().selectCutList(conn, userId);
		
		close(conn);
		return list;
		
	}

	
	
	public ArrayList<Cut> cutCheck(String friendCheckId, String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Cut> list = new CutDao().cutCheck(conn, friendCheckId, userId);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 차단테이블에 insert 하기 전 차단테이블에 존재하는지 조회
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public ArrayList<Cut> selectInsertList(String friendId,String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Cut> list = new CutDao().selectInsertList(conn, friendId, userId);
		
		close(conn);
		
		return list;
	}
	
	
	
	/**
	 * 컷테이블에 이미 존재하면 차단추가시 status = 'y'로 update 
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int updateInsertCut(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new CutDao().updateInsertCut(conn, friendId, userId);
		
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
	public int insertCut(String friendId, String userId) {
		
		Connection conn = getConnection();
		
		int result = new CutDao().insertCut(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	
	/**
	 * 차단해제 ( status = 'n')
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int deleteCut(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new CutDao().deleteCut(conn, friendId,userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}
	
	
}
