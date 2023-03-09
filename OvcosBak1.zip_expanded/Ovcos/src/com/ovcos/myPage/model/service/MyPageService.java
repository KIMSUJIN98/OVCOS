package com.ovcos.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.myPage.model.dao.MyPageDao;
import com.ovcos.myPage.model.vo.MyPage;

import static com.ovcos.common.JDBCTemplate.*;

public class MyPageService {
	
	public MyPage totalDistance(String userId) {
		
		Connection conn = getConnection();
		
		MyPage mp = new MyPageDao().totalDistance(conn, userId);
		
		close(conn);
		
		return mp;
	}
	
	public String selectToday() {
		
		Connection conn = getConnection();
		
		String today = new MyPageDao().selectToday(conn);
		
		close(conn);
		
		return today;
	}
	
	public ArrayList<MyPage> dayDistanceList(String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<MyPage> list = new MyPageDao().dayDistanceList(conn, userId);
		
		close(conn);
		
		return list;
	}
	
	public int updateSetGoal(int userGoal, String userId) {

		Connection conn = getConnection();
		
		int result = new MyPageDao().updateSetGoal(conn, userGoal, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
