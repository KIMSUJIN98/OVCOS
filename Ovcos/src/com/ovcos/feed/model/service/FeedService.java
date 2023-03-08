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


	public Feeddetails selectFeedDetail(int feedNo) {
		Connection conn = getConnection();
		
		Feeddetails f = new FeedDao().selectFeedDetail(conn, feedNo); 
		close(conn);

		
		return f;
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
	
	
	/**
	 * 전체 피드 리스트 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectArrayList(String userId){
		Connection conn = getConnection();
		
		ArrayList<Feed> allList = new FeedDao().selectArrayList(conn,userId);
		
		close(conn);
		
		return allList; 
		
	}
	
	
	/**
	 * 친구피드 리스트 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectFriendList(String userId){
		Connection conn = getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectFriendList(conn,userId);
		
		close(conn);
		
		return list; 
		
	}
	
	
	/**
	 * 내 피드 리스트 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectMyList(String userId){
		Connection conn = getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectMyList(conn,userId);
		
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


		
	
	/**
	 * 작성자 아이디로 피드 검색
	 * @param search
	 * @return
	 */
	public ArrayList<Feed> selectIdSearchList(String search){
		Connection conn = getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectIdSearchList(conn,search);
		
		close(conn);
		
		return list;
	}
	
	

	/**
	 * 피드 제목으로 피드 검색
	 * @param search
	 * @return
	 */
	public ArrayList<Feed> selectTitleSearchList(String search){
		Connection conn = getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectTitleSearchList(conn,search);
		
		close(conn);
		
		return list;
	}
	
	
	
	/**
	 * 피드 내용으로 피드 검색
	 * selectCntSearchList(search)
	 * @param search
	 * @return
	 */
	public ArrayList<Feed> selectCntSearchList(String search){
		Connection conn = getConnection();
		
		ArrayList<Feed> list = new FeedDao().selectCntSearchList(conn,search);
		
		close(conn);
		
		return list;
	}
	
	
	
	/**
	 * 전체 피드에서 찜 많은 순으로 정렬 조회
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectBookmarkSorting(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Feed> allList = new FeedDao().selectBookmarkSorting(conn,userId);
		
		close(conn);
		
		return allList; 
	}
	
	
	
	
	/**
	 * 친구 피드에서 찜 많은 순으로 정렬 조회 
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectFriendBookmarkSorting(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Feed> allList = new FeedDao().selectFriendBookmarkSorting(conn,userId);
		
		close(conn);
		
		return allList; 
	}
	
	
	/**
	 * 내 피드에서 찜 많은 순 정렬 조회.. 노가다 오지쥬?
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectMyBookmarkSorting(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Feed> allList = new FeedDao().selectMyBookmarkSorting(conn,userId);
		
		close(conn);
		
		return allList; 
	}
	
	
	

	/**
	 * 피드 삭제 
	 * @param feedIndex
	 * @return
	 */
	public int deleteFeed(int feedIndex){
		
		Connection conn = getConnection();
		int result =  new FeedDao().deleteFeed(conn, feedIndex);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * 신고상태로 업데이트
	 * @param feedIndex
	 * @param rprId
	 * @return
	 */
	public int updateRpr(int feedIndex, String rprId){
		
		Connection conn = getConnection();
		int result =  new FeedDao().updateRpr(conn, feedIndex, rprId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	public Feed selectFeed(int feedIndex) {
		
		Connection conn = getConnection();
		
		Feed f = new FeedDao().selectFeed(conn, feedIndex);
		
		close(conn);
		
		return f;
		
		
		
		
	}
	
	
	
}
