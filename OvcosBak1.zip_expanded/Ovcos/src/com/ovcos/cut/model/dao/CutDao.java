package com.ovcos.cut.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ovcos.common.JDBCTemplate.*;
import com.ovcos.cut.model.vo.Cut;

public class CutDao {
	
	
	private Properties prop = new Properties();
	
	public CutDao() {
		try {
			
			prop.loadFromXML(new FileInputStream(CutDao.class.getResource("/db/sql/cut-mapper.xml").getPath()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 차단한 유저 리스트 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Cut> selectCutList(Connection conn, String userId){
		
	
		ArrayList<Cut> list = new ArrayList<Cut>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCutList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Cut(rset.getString("MEM_ID"), 
								rset.getString("MEM_NAME"),
								rset.getString("MEM_INTRO")
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
	
	
	/**
	 * 친구가 차단한 친구인지 아닌지 조회
	 * @param conn
	 * @param friendCheckId
	 * @param userId
	 * @return
	 */
	public ArrayList<Cut> cutCheck(Connection conn,String friendCheckId, String userId){
		
		ArrayList<Cut> list = new ArrayList<Cut>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("cutCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, friendCheckId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Cut(rset.getString("MEM_ID")
						));
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	
	/**
	 * 차단 insert전 테이블에 존재하는지 조회
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public ArrayList<Cut> selectInsertList(Connection conn, String friendId,String userId){
		
		ArrayList<Cut> list = new ArrayList<Cut>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInsertList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, friendId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Cut(rset.getString("MEM_ID")
								
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
	 * 차단테이블에 있으면 status Y로
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int updateInsertCut(Connection conn,String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInsertCut");
		
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
	 * 차단 추가 
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int insertCut(Connection conn, String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCut");
		
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
	 * 차단 해제 (status n으로)
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int deleteCut(Connection conn,String friendId,String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCut");
		
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
}
