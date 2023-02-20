package com.ovcos.feed.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ovcos.common.JDBCTemplate.*;
import com.ovcos.feed.model.vo.Feed;
import com.ovcos.upload.model.vo.Gpx;

public class FeedDao {
	
	Properties prop = new Properties();
	
	public FeedDao() {
		String filePath = FeedDao.class.getResource("/db/sql/feed-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertFeed(Connection conn, Feed f) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println(f);
		
		String sql = prop.getProperty("insertFeed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFeedTitle());
			pstmt.setString(2, f.getFeedCnt());
			pstmt.setInt(3, f.getFeedEval());
			pstmt.setString(4, f.getFeedPublicType());
			pstmt.setString(5, f.getFeedPathNy());
			pstmt.setDouble(6, f.getDistance());
			pstmt.setDouble(7, f.getStartLat());
			pstmt.setDouble(8, f.getStartLon());
			pstmt.setString(9, f.getMemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertGpx(Connection conn, Gpx gpx) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertGpx");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gpx.getOriginName());
			pstmt.setString(2, gpx.getChangeName());
			pstmt.setString(3, gpx.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public ArrayList<Feed> selectAllFeedList(Connection conn){
		
		ArrayList<Feed> allList = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllFeedList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				allList.add(new Feed(rset.getInt("FEED_INDEX"),
							rset.getString("FEED_DATE"),
							rset.getString("FEED_TITLE"),
							rset.getString("FEED_CNT"),
							rset.getInt("FEED_EVAL"),
							rset.getString("FEED_PATH_NY"),
							rset.getDate("FEED_RPR_DATE"),
							rset.getInt("DISTANCE"),
							rset.getInt("START_LAT"),
							rset.getInt("START_LON"),
							rset.getString("MEM_NICK")				
							));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return allList;
	}
}
