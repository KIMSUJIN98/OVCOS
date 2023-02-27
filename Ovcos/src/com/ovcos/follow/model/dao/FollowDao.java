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
		//select문 => resultSet 객체 (한개) ->숫자 잗을게  int형 변수에 넘어주면됨
	
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
				//count, 그룹함수 할때는 반드시 별칭을 주자~~  카운트값을 listcount에 넣어줌
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
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
				
				list.add(new Follow(rset.getString("mem_name"),
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
				
				list.add(new Follow(rset.getString("mem_name"),
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
				
				list.add(new Follow(rset.getString("mem_name"),
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
	
}
