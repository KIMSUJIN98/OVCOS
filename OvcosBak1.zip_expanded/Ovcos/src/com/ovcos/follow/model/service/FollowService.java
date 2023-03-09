package com.ovcos.follow.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.follow.model.dao.FollowDao;
import com.ovcos.follow.model.vo.Follow;

import static com.ovcos.common.JDBCTemplate.*;


public class FollowService {
	
	
	
	
	/**
	 * 페이징개수조회
	 * @param userId
	 * @return
	 */
	public int selectListCount(String userId) {
		
		Connection conn = getConnection();
		
		int listCount = new FollowDao().selectListCount(conn, userId);
		
		close(conn);
		
		return listCount;
	}
	
	
	
	/**
	 * 페이징 조회
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectList(Pageinfo pi, String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectList(conn, pi, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	/**
	 * 내가 추가한 친구 조회 (ajax)
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectMyfriendList(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectMyfriendList(conn, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 나를 추가한 친구 목록 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectaddMeList (String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectaddMeList(conn, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 검색한 유저 리스트 조회
	 * @param memName
	 * @return
	 */
	public ArrayList<Follow> selectSearchList(String memName, String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectSearchList(conn, memName, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 로그인 사용자와 상대방이 친구인지 아닌지 조회 
	 * @param friendCheckId
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> friendCheck(String friendCheckId, String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().friendCheck(conn, friendCheckId, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 친구추가 insert 하기 전 팔로테이블에 존재하는지 조회
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectInsertList(String friendId,String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Follow> list = new FollowDao().selectInsertList(conn, friendId, userId);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 친구 추가 
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int insertFollow(String friendId, String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowDao().insertFollow(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	

	/**
	 * 친구삭제 ( status = 'n')
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int deleteFollow(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowDao().deleteFollow(conn, friendId,userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}
	
	/**
	 * 팔로테이블에 이미 존재할시 status = 'y'로 update 
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int updateInsertFollow(String friendId,String userId) {
		
		Connection conn = getConnection();
		
		int result = new FollowDao().updateInsertFollow(conn, friendId, userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
		
	}
}
