package com.ovcos.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.ovcos.common.JDBCTemplate.*;
import com.ovcos.notice.model.dao.NoticeDao;
import com.ovcos.notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
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
	
	

	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public Notice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		
		return n;
	}
	
}
