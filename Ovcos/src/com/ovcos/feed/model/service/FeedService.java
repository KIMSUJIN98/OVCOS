package com.ovcos.feed.model.service;

import static com.ovcos.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.feed.model.dao.FeedDao;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.feed.model.vo.Feeddetails;
import com.ovcos.feed.model.vo.detail2comments;
import com.ovcos.loginRegister.model.vo.Member;
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


	public Feeddetails selectMember(int feedNo) {
		Connection conn = getConnection();
		
		Feeddetails m = new FeedDao().selectMember(conn, feedNo); 
		int wishCount = new FeedDao().selectWishCount(conn, feedNo);
		m.setWishCount(wishCount);
		close(conn);

		
		return m;
	}




	public int insertcomments(int feedin, String cmnid, String cmncnt) {
		Connection conn = getConnection();
		int result =  new FeedDao().insertcomments(conn, feedin, cmnid, cmncnt);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	public ArrayList<detail2comments> selectdetail2(int feedin) {

		Connection conn = getConnection();
		ArrayList<detail2comments> list = new FeedDao().selectdetail2(conn, feedin);
		
		close(conn);
		
		return list;
		
	}


	


	public int updateCount(int feedNo) {
	Connection conn = getConnection();
	int result = new FeedDao().updateCount(conn, feedNo);
		
	if(result > 0) {
		commit(conn);
	}else {
		rollback(conn);
	}
		close(conn);
	
		return result;
		
	}


	
}
