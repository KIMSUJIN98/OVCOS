package com.ovcos.feed.model.service;

import static com.ovcos.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.feed.model.dao.FeedDao;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.upload.model.vo.Gpx;

public class FeedService {
	
	public int insertFeed(Feed f, Gpx gpx) {
		Connection conn = getConnection();
		
		int result = new FeedDao().insertFeed(conn, f);
		
		int result2 = new FeedDao().insertGpx(conn, gpx);
		
		if(result * result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result*result2;
	}
	
	
	public ArrayList<Feed> selectAllFeedList(){
		
		Connection conn = getConnection();
		
		ArrayList<Feed> allList = new FeedDao().selectAllFeedList(conn);
		
		close(conn);
		
		return allList; 
	}
}
