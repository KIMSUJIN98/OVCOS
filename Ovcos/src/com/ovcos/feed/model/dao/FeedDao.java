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

import com.ovcos.common.model.vo.Pageinfo;
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
			pstmt.setString(10, f.getImgPath());
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
							rset.getString("FEED_RPR_DATE"),
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


	public Feeddetails selectFeedDetail(Connection conn, int feedNo) {
		
		Feeddetails f = new Feeddetails();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFeedDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				f = new Feeddetails(rset.getInt("feed_index"),
									  rset.getString("feed_date"),
									  rset.getString("feed_title"),
									  rset.getString("feed_cnt"),
									  rset.getInt("feed_eval"),
									  rset.getDouble("distance"),
									  rset.getDouble("start_lat"),
									  rset.getDouble("start_lon"),
									  rset.getString("mem_id"),
									  rset.getString("change_name"),
									  rset.getString("origin_name"),
									  rset.getInt("hit"),
									  rset.getInt("count")
						);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return f;
		}


	/**
	 * 전체 피드 조회 (feed vo 필드 추가 수정후) 
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectArrayList(Connection conn,String userId){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectArrayList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("IMGPATH")
						));
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
		}catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}
		


	
	
	/**
	 * 친구 피드만 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectFriendList(Connection conn,String userId){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFriendList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("IMGPATH")
						));
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


	public int updateCount(Connection conn, int feedNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, feedNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int selectWishCount(Connection conn, int feedNo) {
		
		int wishCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("wishListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, feedNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wishCount = rset.getInt("count"); 
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return wishCount;
	}


	
	/** 내피드 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectMyList(Connection conn,String userId){
			
			ArrayList<Feed> list = new ArrayList<Feed>();
			PreparedStatement pstmt= null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMyList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
			
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					list.add(new Feed(rset.getInt("FEED_INDEX"),
								rset.getString("DATE"),
								rset.getString("FEED_TITLE"),
								rset.getString("FEED_CNT"),
								rset.getInt("FEED_EVAL"),
								rset.getString("FEED_PUBLIC_TYPE"),
								rset.getString("FEED_PATH_NY"),
								rset.getDouble("DISTANCE"),
								rset.getDouble("START_LAT"),
								rset.getDouble("START_LON"),
								rset.getString("MEM_ID"),
								rset.getString("CHANGE_NAME"),
								rset.getString("MEM_NAME"),
								rset.getString("MEM_NICK"),
								rset.getString("ORIGIN_NAME"),
								rset.getString("IMGPATH")
								));
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
	
	
	/**
	 * 작성자로 피드 검색 조회
	 * @param conn
	 * @param userId
	 * @return "%"+search+"%"
	 */
	public ArrayList<Feed> selectIdSearchList(Connection conn,String search){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectIdSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
							rset.getString("DATE"),
							rset.getString("FEED_TITLE"),
							rset.getString("FEED_CNT"),
							rset.getInt("FEED_EVAL"),
							rset.getDouble("DISTANCE"),
							rset.getDouble("START_LAT"),
							rset.getDouble("START_LON"),
							rset.getString("MEM_ID"),
							rset.getString("CHANGE_NAME"),
							rset.getString("MEM_NAME"),
							rset.getString("MEM_NICK"),
							rset.getString("ORIGIN_NAME"),
							rset.getString("IMGPATH")
							));
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

	
	
	
	/**
	 * 피드 제목으로 피드 검색
	 * @param conn
	 * @param search
	 * @return
	 */
	public ArrayList<Feed> selectTitleSearchList(Connection conn,String search){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTitleSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
							rset.getString("DATE"),
							rset.getString("FEED_TITLE"),
							rset.getString("FEED_CNT"),
							rset.getInt("FEED_EVAL"),
							rset.getDouble("DISTANCE"),
							rset.getDouble("START_LAT"),
							rset.getDouble("START_LON"),
							rset.getString("MEM_ID"),
							rset.getString("CHANGE_NAME"),
							rset.getString("MEM_NAME"),
							rset.getString("MEM_NICK"),
							rset.getString("ORIGIN_NAME"),
							rset.getString("IMGPATH")
							));
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
	
	
	/**
	 * 피드 내용 검색 조회
	 * @param conn
	 * @param search
	 * @return
	 */
	public ArrayList<Feed> selectCntSearchList(Connection conn,String search){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCntSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
							rset.getString("DATE"),
							rset.getString("FEED_TITLE"),
							rset.getString("FEED_CNT"),
							rset.getInt("FEED_EVAL"),
							rset.getDouble("DISTANCE"),
							rset.getDouble("START_LAT"),
							rset.getDouble("START_LON"),
							rset.getString("MEM_ID"),
							rset.getString("CHANGE_NAME"),
							rset.getString("MEM_NAME"),
							rset.getString("MEM_NICK"),
							rset.getString("ORIGIN_NAME"),
							rset.getString("IMGPATH")
							));
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
	
	
	
	/**
	 * 전체 피드에서 찜 많은 순으로 정렬 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectBookmarkSorting(Connection conn,String userId){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookmarkSorting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
							rset.getString("DATE"),
							rset.getString("FEED_TITLE"),
							rset.getString("FEED_CNT"),
							rset.getInt("FEED_EVAL"),
							rset.getDouble("DISTANCE"),
							rset.getDouble("START_LAT"),
							rset.getDouble("START_LON"),
							rset.getString("MEM_ID"),
							rset.getString("CHANGE_NAME"),
							rset.getString("MEM_NAME"),
							rset.getString("MEM_NICK"),
							rset.getString("ORIGIN_NAME"),
							rset.getInt("BOOKMARK_COUNT"),
							rset.getString("IMGPATH")
							));
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
	
	
	
	/**
	 * 친구 피드에서 찜 많은 순서대로 조회
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectFriendBookmarkSorting(Connection conn,String userId){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFriendBookmarkSorting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("BOOKMARK_COUNT"),
						rset.getString("IMGPATH")
						));
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
	
	
	

	/**
	 * 내 피드에서 찜순으로 정렬 조회하기
	 * @param conn
	 * @param userId
	 * @return
	 */
	public ArrayList<Feed> selectMyBookmarkSorting(Connection conn,String userId){
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyBookmarkSorting");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("BOOKMARK_COUNT"),
						rset.getString("IMGPATH")
						));
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

	
	
	/**
	 * 피드 삭제
	 * @param conn
	 * @param feedIndex
	 * @return
	 */
	public int deleteFeed(Connection conn, int feedIndex) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteFeed");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	/**
	 * 신고 상태로 업뎃
	 * @param conn
	 * @param feedIndex
	 * @param rprId
	 * @return
	 */
	public int updateRpr(Connection conn, int feedIndex, String rprId) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateRpr");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rprId);
			pstmt.setInt(2, feedIndex);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	public Feed selectFeed(Connection conn,int feedIndex) {
		
		
		Feed f  = new Feed();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFeed");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, feedIndex);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			
				f = new Feed( 		
						
						rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("IMGPATH")
						
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	
	}
	
	
	
	/**
	 * 진짜 전체 조회 용 ( admin 피드조회)
	 * @param conn
	 * @return
	 */
	public ArrayList<Feed> selectFeedList(Connection conn){
		
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFeedList");
		
		try {
			pstmt = conn.prepareStatement(sql);

		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getString("FEED_RPR_NY"),
						rset.getString("RPR_DATE"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("FEED_DEL_NY"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("HIT"),
						rset.getString("FEED_RPR_ID"),
						rset.getString("IMGPATH")
						
						));
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

	public int updateGpx(Connection conn, Gpx gpx) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateGpx");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gpx.getOriginName());
			pstmt.setString(2, gpx.getChangeName());
			pstmt.setInt(3, gpx.getFeedIndex());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateFeed(Connection conn, Feed f) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateFeed");
		System.out.println(f);
		
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
			pstmt.setString(9, f.getImgPath());
			pstmt.setInt(10, f.getFeedIndex());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	
	/**
	 * 페이징개수 조회
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql  = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			
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
	 * 페이징이랑 게시글 조회랑 같이
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Feed> selectList(Connection conn, Pageinfo pi){
		//select문 => resultSet 객체 필요, 여러행리턴 =>ArrayList
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFeedList1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			/*
			 * currentPage(현재페이징번호) : 1번누름 -> 시작값:1 | 끝값 : 10 번 데이터 조회~
			 * currentPage(현재페이징번호) : 2번누름 -> 시작값:11 | 끝값 : 20 번 까지의 게시판글 조회~
			 * currentPage(현재페이징번호) : 3번누름 -> 시작값:21 | 끝값 : 30 번 까지의 게시판글 조회~
			 * 
			 * 시작값과 끝값을 구해서 쿼리로 넘겨주야함
			 * 시작값  : (currentPage -1) * boardLimit +1
			 * 끝값 	: 시작값 + boardLimit - 1
			 */
			
			//물음표에 넘겨줄 값
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + (pi.getBoardLimit()-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			rset = pstmt.executeQuery();

			//이쿼리 수행하면  데이터가 열행이가 나옴
			while(rset.next()) {
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getString("FEED_RPR_NY"),
						rset.getString("RPR_DATE"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("FEED_DEL_NY"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("HIT"),
						rset.getString("FEED_RPR_ID"),
						rset.getString("IMGPATH")
						
						));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	

	/**
	 * 신고 피드 리스트 조회 
	 * @param conn
	 * @return
	 */
	public ArrayList<Feed> selectRprList(Connection conn){
		
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRprList");
		
		try {
			pstmt = conn.prepareStatement(sql);

		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getString("FEED_RPR_NY"),
						rset.getString("RPR_DATE"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("FEED_DEL_NY"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("HIT"),
						rset.getString("FEED_RPR_ID"),
						rset.getString("IMGPATH")
						
						));
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
	
	
	/**
	 * 신고 된 피드 원상태로 업데이트
	 * @param conn
	 * @param feedIndex
	 * @return
	 */
	public int updateRprRestore(Connection conn,int feedIndex) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateRprRestore");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	
	/**
	 * 누적신고수 업데이트
	 * @param conn
	 * @param feedIndex
	 * @return
	 */
	public int updateRprCum(Connection conn,int feedIndex) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateRprCum");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feedIndex);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	
	public ArrayList<Feed> selectDelList(Connection conn){
		
		
		ArrayList<Feed> list = new ArrayList<Feed>();
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDelList");
		
		try {
			pstmt = conn.prepareStatement(sql);

		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Feed(rset.getInt("FEED_INDEX"),
						rset.getString("DATE"),
						rset.getString("FEED_TITLE"),
						rset.getString("FEED_CNT"),
						rset.getInt("FEED_EVAL"),
						rset.getString("FEED_PUBLIC_TYPE"),
						rset.getString("FEED_PATH_NY"),
						rset.getString("FEED_RPR_NY"),
						rset.getString("RPR_DATE"),
						rset.getDouble("DISTANCE"),
						rset.getDouble("START_LAT"),
						rset.getDouble("START_LON"),
						rset.getString("FEED_DEL_NY"),
						rset.getString("MEM_ID"),
						rset.getString("CHANGE_NAME"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_NICK"),
						rset.getString("ORIGIN_NAME"),
						rset.getInt("HIT"),
						rset.getString("FEED_RPR_ID"),
						rset.getString("IMGPATH")
						
						));
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
	

	
}
