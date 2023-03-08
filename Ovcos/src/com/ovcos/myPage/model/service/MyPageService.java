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
	
	public ArrayList<MyPage> dayDistanceList(String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<MyPage> list = new MyPageDao().dayDistanceList(conn, userId);
		
		close(conn);
		
		return list;
	}

}
