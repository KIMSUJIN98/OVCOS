package com.ovcos.followRequest.model.dao;

import static com.ovcos.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import com.ovcos.followRequest.model.vo.FollowRequest;

public class FollowRequestDao {
	
	
	private Properties prop = new Properties();
	
	public FollowRequestDao() {
		try {
			prop.loadFromXML(new FileInputStream(FollowRequestDao.class.getResource("/db/sql/followRequest-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	public ArrayList<FollowRequest> selectInsertList(Connection conn,String friendId,String userId){
		
		ArrayList<FollowRequest> list = new ArrayList<FollowRequest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInsertList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, friendId);
			pstmt.setString(2, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new FollowRequest(rset.getString("SEND_ID")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	/**
	 * 테이블에 있으면 status Y로
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int updateInsertFollowRequest(Connection conn,String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInsertFollowRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, friendId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
		
	}
	
	
	
	
	public int insertFollowRequest(Connection conn, String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFollowRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, friendId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
		
	}
	

	/**
	 * 친구요청 리스트 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<FollowRequest> selectFollowRequestList(Connection conn, String userId){
		
	
		ArrayList<FollowRequest> list = new ArrayList<FollowRequest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowRequestList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new FollowRequest(rset.getString("MEM_ID"), 
								rset.getString("MEM_NAME"),
								rset.getString("MEM_INTRO"),
								rset.getString("MEM_NICK")
						));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	public int deleteFollowRequest(Connection conn,String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFollowRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, friendId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		
		return result;
		
	}
	
	
	
	
}/////////////////////////////close class dao 
