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
import com.ovcos.feed.model.vo.Feeddetails;
import com.ovcos.feed.model.vo.detail2comments;
import com.ovcos.loginRegister.model.vo.Member;
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

	public Feeddetails selectMember(Connection conn, int feedNo) {
		
		Feeddetails m = new Feeddetails();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Feeddetails(rset.getInt("feed_index"),
									  rset.getString("feed_date"),
									  rset.getString("feed_title"),
									  rset.getString("feed_cnt"),
									  rset.getInt("feed_eval"),
									  rset.getInt("distance"),
									  rset.getInt("start_lat"),
									  rset.getInt("start_lon"),
									  rset.getString("mem_id"),
									  rset.getString("change_name"),
									  rset.getInt("hit")
						);
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

	

	public int insertcomments(Connection conn, int feedin, String cmnid, String cmncnt) {
		 int result = 0;
		 PreparedStatement pstmt = null;
		 
		 String sql = prop.getProperty("insertcomments");
//		System.out.println(sql);
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmnid);
			pstmt.setString(2, cmncnt);
			pstmt.setInt(3, feedin);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<detail2comments> selectdetail2(Connection conn, int feedin) {
		ArrayList<detail2comments> list = new ArrayList<detail2comments>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectdetail2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedin);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new detail2comments(rset.getInt("feed_cmn_no"),
											 rset.getString("feed_cmn_id"),
											 rset.getString("feed_cmn_cnt"),
											 rset.getString("feed_cmn_date")
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
