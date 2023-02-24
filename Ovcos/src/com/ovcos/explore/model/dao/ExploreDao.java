package com.ovcos.explore.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.explore.model.vo.Explore;
import com.ovcos.feed.model.vo.Feed;

import static com.ovcos.common.JDBCTemplate.*;

public class ExploreDao {
	
	Properties prop = new Properties();
	
	public ExploreDao() {
		String filePath = ExploreDao.class.getResource("/db/sql/explore-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
				System.out.println(listCount);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Explore> selectList(Connection conn, Pageinfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Explore> list = new ArrayList<Explore>();
		
		String sql = prop.getProperty("selecList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Explore(rset.getInt("rnum")
						   		  , rset.getString("date")
						   		  , rset.getString("feed_title")
						   		  , rset.getString("feed_cnt")
						   		  , rset.getInt("feed_eval")
						   		  , rset.getDouble("distance")
						   		  , rset.getDouble("start_lat")
						   		  , rset.getDouble("start_lon")
						   		  , rset.getString("mem_id")
						   		  , rset.getString("change_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Explore> selectList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Explore> list = new ArrayList<Explore>();
		
		String sql = prop.getProperty("selecList1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Explore(rset.getInt("feed_index")
						   		  , rset.getString("date")
						   		  , rset.getString("feed_title")
						   		  , rset.getString("feed_cnt")
						   		  , rset.getInt("feed_eval")
						   		  , rset.getDouble("distance")
						   		  , rset.getDouble("start_lat")
						   		  , rset.getDouble("start_lon")
						   		  , rset.getString("mem_id")
						   		  , rset.getString("change_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Explore> selectKeywordList(Connection conn, Pageinfo pi, String search) {
		ArrayList<Explore> list = new ArrayList<Explore>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectKeywordList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Explore(rset.getInt("rnum")
						   		  , rset.getString("date")
						   		  , rset.getString("feed_title")
						   		  , rset.getString("feed_cnt")
						   		  , rset.getInt("feed_eval")
						   		  , rset.getDouble("distance")
						   		  , rset.getDouble("start_lat")
						   		  , rset.getDouble("start_lon")
						   		  , rset.getString("mem_id")
						   		  , rset.getString("change_name")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
