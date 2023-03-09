package com.ovcos.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.notice.model.dao.NoticeDao;
import com.ovcos.notice.model.vo.Notice;

import static com.ovcos.common.JDBCTemplate.*;

public class NoticeService {

	
	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		
		close(conn);
		
		return list; 
	}
	


	public int increaseCount(int ntcNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, ntcNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	
	public Notice selectNotice(int ntcNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, ntcNo);
		
		close(conn);
		
		return n;
	}
	
	
	public int insertNotice( Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		//트랜젝션처리
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}
	
	
	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result ;
	}
	
	
	public int deleteNotice(int ntcNo) {

		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, ntcNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result ;
	}
	
	
}//class end
