package com.ovcos.explore.model.service;

import static com.ovcos.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.explore.model.dao.ExploreDao;
import com.ovcos.explore.model.vo.Explore;
import com.ovcos.feed.model.vo.Feed;

public class ExploreService {

	public int selectListCount() {
		Connection conn = getConnection();
		
		int result = new ExploreDao().selectListCount(conn);
		
		return result;
	}

	public ArrayList<Explore> selectList(Pageinfo pi, String status) {
		Connection conn = getConnection();
		
		ArrayList<Explore> list = new ExploreDao().selectList(conn, pi, status);
		
		return list;
	}
	
	public ArrayList<Explore> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Explore> list = new ExploreDao().selectList(conn);
		
		return list;
	}

	public ArrayList<Explore> selectKeywordList(Pageinfo pi, String search) {
		Connection conn = getConnection();
		System.out.println("서비스 시작");
		ArrayList<Explore> list = new ExploreDao().selectKeywordList(conn,pi,search);
		
		close(conn);
		
		return list;
	}
	

	public ArrayList<Explore> selectMyNewList(Pageinfo pi, String status, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Explore> list = new ExploreDao().selectMyNewList(conn,pi,status,userId);
		
		return list;
	}

	/**
	 * 내코스에서의 검색시 사용하는 메서드
	 * @param pi
	 * @param search
	 * @param userId
	 * @return
	 */
	public ArrayList<Explore> selectKeywordList(Pageinfo pi, String search, String userId) {
		Connection conn = getConnection();
		
		ArrayList<Explore> list = new ExploreDao().selectKeywordList(conn, pi,search,userId);
		
		return list;
	}

	

}
