package com.ovcos.follow.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.follow.model.vo.Follow;

import static com.ovcos.common.JDBCTemplate.*;

public class FollowDao {
	
	
	private Properties prop = new Properties();
	
	public FollowDao() {
		try {
			
			prop.loadFromXML(new FileInputStream(FollowDao.class.getResource("/db/sql/follow-mapper.xml").getPath()));
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int selectListCount(Connection conn, String userId) {
		
	
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql  = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	

	
	/**
	 * 페이징 갖고 가는 내친구목록...?
	 * @param conn
	 * @param pi
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectList(Connection conn, Pageinfo pi , String userId){
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Follow(rset.getString("mem_id"),
									rset.getString("mem_name"),
									rset.getString("mem_intro")
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
	
	
	
	
	/**	ajax용 내친구목록 조회 (내친구목록 버튼 새로 클릭했을시)
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectMyfriendList(Connection conn, String userId){
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Follow(rset.getString("mem_id"),
						rset.getString("mem_name"),
						rset.getString("mem_intro")
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
	 * ajax용 나를 추가한친구 목록 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectaddMeList(Connection conn, String userId){
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectaddMeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Follow(rset.getString("mem_id"),
						rset.getString("mem_name"),
						rset.getString("mem_intro")
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
	 * ajax 검색한유저 목록 조회
	 * @param conn
	 * @param memName
	 * @return
	 */
	public ArrayList<Follow> selectSearchList(Connection conn, String memName){
			
			ArrayList<Follow> list = new ArrayList<Follow>();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectSearchList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, memName);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					list.add(new Follow(rset.getString("mem_id"),
							rset.getString("mem_name"),
							rset.getString("mem_intro")
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
	 * 조회한 유저가 친구인지아닌지 결과 반환용
	 * @param conn
	 * @param fId
	 * @param uId
	 * @return
	 */
	public ArrayList<Follow> friendCheck(Connection conn, String fId, String uId) {
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("friendCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uId);
			pstmt.setString(2, fId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Follow(rset.getString("mem_id")
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
	 * 친구추가 insert 하기 전 팔로테이블에 존재하는지 조회
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public ArrayList<Follow> selectInsertList(Connection conn, String friendId,String userId){
		
		ArrayList<Follow> list = new ArrayList<Follow>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInsertList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, friendId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Follow(rset.getString("MEM_ID")
								
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
	 * 친구 추가 
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int insertFollow(Connection conn, String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFollow");
		
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
	 * 친구삭제 (status n으로)
	 * @param conn
	 * @param friendId
	 * @param userId
	 * @return
	 */
	public int deleteFollow(Connection conn,String friendId,String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteFollow");
		
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
	
	
	public int updateInsertFollow(Connection conn,String friendId,String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInsertFollow");
		
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
