package com.ovcos.inquiry.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.inquiry.model.vo.Inquiry;

import static com.ovcos.common.JDBCTemplate.*;

public class InquiryDao {
	private Properties prop = new Properties();

	// 서버구동없이 새로고침 기본생성자로
	public InquiryDao() {
		try {

			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/sql/inquiry-mapper.xml").getPath()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Inquiry> selectInquiryList(Connection conn, String userId){
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquiryList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquiry(
						rset.getInt("INQ_NO"),
						rset.getInt("INQ_MENU"),
						rset.getString("INQ_TITLE"),
						rset.getString("INQ_DATE"),
						rset.getString("MEM_ID")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		return listCount;
		
	}
	
	public ArrayList<Inquiry> selectList(Connection conn, Pageinfo pi){
		ArrayList<Inquiry> list = new ArrayList<Inquiry>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit()+1;
			int endRow = startRow + (pi.getBoardLimit() -1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Inquiry(
						rset.getInt("INQ_NO"),
						rset.getInt("INQ_MENU"),
						rset.getString("INQ_TITLE"),
						rset.getString("INQ_DATE"),
						rset.getString("INQ_CNT"),
						rset.getString("INQ_DEL_NY")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertInquiry(Connection conn, Inquiry i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, i.getInqMenu());
			pstmt.setString(2, i.getInqTitle());
			pstmt.setString(3, i.getInqCnt());
			pstmt.setString(4, i.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Inquiry selectInquiry(Connection conn, int inqNo) {
		Inquiry i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInquiry");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			
			System.out.println(inqNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				i = new Inquiry(
						rset.getInt("INQ_NO"),
						rset.getInt("INQ_MENU"),
						rset.getString("INQ_TITLE"),
						rset.getString("INQ_DATE"),
						rset.getString("INQ_CNT"),
						rset.getString("MEM_ID"));
		} 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i;
	}
	
	public int updateInquiry(Connection conn, Inquiry i) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, i.getInqTitle());
			pstmt.setString(2, i.getInqCnt());
			pstmt.setInt(3, i.getInqNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteInquiry(Connection conn, int inqNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteInquiry");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqNo);
			
			System.out.println(inqNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	
	}
}