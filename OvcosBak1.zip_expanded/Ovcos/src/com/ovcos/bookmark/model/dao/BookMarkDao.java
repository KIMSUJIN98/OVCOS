package com.ovcos.bookmark.model.dao;

import static com.ovcos.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.bookmark.model.vo.BookMark;
import com.ovcos.follow.model.dao.FollowDao;

public class BookMarkDao {
	
private Properties prop = new Properties();
	
	public BookMarkDao() {
		try {
			
			prop.loadFromXML(new FileInputStream(FollowDao.class.getResource("/db/sql/bookmark-mapper.xml").getPath()));
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertBookMark(Connection conn,int feedIndex,String userId) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBookMark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<BookMark> checkBookmark(Connection conn,int feedIndex,String userId) {
		
		
		ArrayList<BookMark> check = new ArrayList<BookMark>();
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkBookmark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				check.add(new BookMark(rset.getInt("BK_NO")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
		
	}
	
	
	public int deleteBookMark(Connection conn,int feedIndex,String userId) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBookMark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public ArrayList<BookMark> selectCheckinsert(Connection conn,int feedIndex,String userId) {
		
		ArrayList<BookMark> check = new ArrayList<BookMark>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCheckinsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				check.add(new BookMark(rset.getInt("BK_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
		
	}
		
	

	public int updateInsertBookmark(Connection conn,int feedIndex,String userId) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInsertBookmark");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
