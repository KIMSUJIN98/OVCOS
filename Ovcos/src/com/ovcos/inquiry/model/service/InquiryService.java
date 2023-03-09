package com.ovcos.inquiry.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.inquiry.model.dao.InquiryDao;
import com.ovcos.inquiry.model.vo.Inquiry;

import static com.ovcos.common.JDBCTemplate.*;

public class InquiryService {
	public ArrayList<Inquiry> selectInquiryList(String userId){
		Connection conn = getConnection();
		
		ArrayList<Inquiry> list = new InquiryDao().selectInquiryList(conn, userId);
		
		close(conn);
		return list;
	}
	
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new InquiryDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Inquiry> selectList(Pageinfo pi){
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int insertInquiry(Inquiry i) {
		Connection conn = getConnection();
		int result = new InquiryDao().insertInquiry(conn, i);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Inquiry selectInquiry(int inqNo) {
		
		Connection conn = getConnection();
		
		Inquiry i = new InquiryDao().selectInquiry(conn, inqNo);
		
		close(conn);
		
		return i;
	}
	
	public int updateInquiry(Inquiry i) {
		Connection conn = getConnection();
		
		int result = new InquiryDao().updateInquiry(conn, i);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteNotice(int inqNo) {
		
		System.out.println(inqNo);
		Connection conn = getConnection();
		
		int result = new InquiryDao().deleteInquiry(conn, inqNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
}
