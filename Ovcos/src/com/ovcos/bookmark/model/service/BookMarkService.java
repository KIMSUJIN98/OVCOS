package com.ovcos.bookmark.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.bookmark.model.dao.BookMarkDao;
import com.ovcos.bookmark.model.vo.BookMark;

import static com.ovcos.common.JDBCTemplate.*;

public class BookMarkService {
	
	
	public int insertBookMark(int feedIndex,String userId) {
		
		Connection conn = getConnection();
		
		int result = new BookMarkDao().insertBookMark(conn,feedIndex,userId);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	}
	
	
	public ArrayList<BookMark> checkBookmark (int feedIndex, String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<BookMark> check = new BookMarkDao().checkBookmark(conn,feedIndex,userId);
		
		close(conn);
		
		return check;
		
		
	}
	
	
	public int deleteBookMark(int feedIndex,String userId) {
		
		Connection conn = getConnection();
		int result = new BookMarkDao().deleteBookMark(conn,feedIndex,userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	}
	
	public ArrayList<BookMark> selectCheckinsert (int feedIndex, String userId) {
		
		Connection conn = getConnection();
		
		ArrayList<BookMark> check = new BookMarkDao().selectCheckinsert(conn,feedIndex,userId);
		
		close(conn);
		
		return check;
		
		
	}
	
	
	public int updateInsertBookmark(int feedIndex,String userId) {
		
		Connection conn = getConnection();
		int result = new BookMarkDao().updateInsertBookmark(conn,feedIndex,userId);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
		
	}
	

}
