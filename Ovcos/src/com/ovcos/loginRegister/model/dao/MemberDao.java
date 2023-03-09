package com.ovcos.loginRegister.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.ovcos.common.JDBCTemplate.*;
import com.ovcos.loginRegister.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
								  rset.getString(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getInt(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	public Member refreshMember(Connection conn, String userId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		
		String sql = prop.getProperty("refreshMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
								  rset.getString(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getInt(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	public Member selectMember(Connection conn, String userId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
								  rset.getString(1)
								, rset.getString(2)
								, rset.getString(3)
								, rset.getString(4)
								, rset.getString(5)
								, rset.getString(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getInt(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
								, rset.getString(16)
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemNick());
			pstmt.setString(5, m.getMemBirth());
			pstmt.setString(6, m.getMemEml());
			pstmt.setString(7, m.getMarketNy());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// select문 => rset => int
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public int nickCheck(Connection conn, String checkNick) {
		// select문 => rset => int
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("nickCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkNick);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public Member checkRegister(Connection conn, String name, String email) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				m= new Member(
						rset.getString("MEM_ID"));
						
				
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	public Member pwdRegister(Connection conn, String id, String email) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql= prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member (
					rset.getString("MEM_ID"),
					rset.getString("MEM_PWD"));
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}
	
	public int updatePwd(Connection conn,String updatePwd, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		System.out.println(updatePwd); 
		System.out.println(id);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, id);
			
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
