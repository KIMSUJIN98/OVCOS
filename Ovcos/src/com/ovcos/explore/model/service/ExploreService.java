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

	public ArrayList<Explore> selectList(Pageinfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Explore> list = new ExploreDao().selectList(conn, pi);
		
		return list;
	}

}
