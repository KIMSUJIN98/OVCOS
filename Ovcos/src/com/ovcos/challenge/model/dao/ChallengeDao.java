package com.ovcos.challenge.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.EntryList;
import com.ovcos.challenge.model.vo.Local;
import com.ovcos.challenge.model.vo.NEntryList;
import com.ovcos.challenge.model.vo.NormalChallenge;

import static com.ovcos.common.JDBCTemplate.*;

public class ChallengeDao {
	
	private Properties prop = new Properties();

	public ChallengeDao() {
		try {
			prop.loadFromXML(new FileInputStream(
					ChallengeDao.class.getResource("/db/sql/challenge-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Contest> selectContest(Connection conn) {
		ArrayList<Contest> list = new ArrayList<Contest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Contest(rset.getInt("CNTS_NO"),
						             rset.getString("CNTS_NAME"),
									 rset.getDate("CNTS_DATE"),
									 rset.getString("CNTS_URL")
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

	public int contestProgressCount(Connection conn, String userId) {
		int contestProgressCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("contestProgressCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				contestProgressCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return contestProgressCount;
	}

	public int contestCompleteCount(Connection conn, String userId) {
		int contestCompleteCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("contestCompleteCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				contestCompleteCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return contestCompleteCount;
	}

	public int normalProgressCount(Connection conn, String userId) {
		int normalProgressCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("normalProgressCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				normalProgressCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return normalProgressCount;
		
	}

	public int normalCompleteCount(Connection conn, String userId) {
		int normalCompleteCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("normalCompleteCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				normalCompleteCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return normalCompleteCount;
		
	}

	public ArrayList<ContestChallenge> mainContestList(Connection conn, String userId) {
		ArrayList<ContestChallenge> list1 = new ArrayList<ContestChallenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("mainContestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list1.add(new ContestChallenge(rset.getString("CNTS_CHLG_TITLE"),
											   rset.getDate("ENROLL_DATE"),
											   rset.getDate("CNTS_CHLG_DATE"),
											   rset.getInt("CNTS_CHLG_MAX"),
											   rset.getString("CNTS_CHLG_ID"),
											   rset.getString("CNTS_NAME")
											   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list1;
	}

	public ArrayList<NormalChallenge> mainNormalList(Connection conn, String userId) {
		ArrayList<NormalChallenge> list2 = new ArrayList<NormalChallenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("mainNormalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list2.add(new NormalChallenge(rset.getString("NOR_CHLG_TITLE"),
											  rset.getDate("ENROLL_DATE"),
											  rset.getDate("NOR_CHLG_DATE"),
											  rset.getInt("NOR_CHLG_MAX"),
											  rset.getString("NOR_CHLG_ID"),
											  rset.getString("LOCAL_NAME")
											  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list2;
	}

	public ArrayList<ContestChallenge> contestChallengeList(Connection conn, String contestName) {
		ArrayList<ContestChallenge> list = new ArrayList<ContestChallenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("contestChallengeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contestName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ContestChallenge(rset.getInt("CNTS_CHLG_NO"),
											  rset.getString("CNTS_CHLG_TITLE"),
											  rset.getDate("ENROLL_DATE"),
											  rset.getDate("CNTS_CHLG_DATE"),
											  rset.getInt("CNTS_CHLG_MAX"),
											  rset.getString("CNTS_CHLG_ID"),
											  rset.getString("CNTS_NAME"),
											  rset.getInt("COUNT")
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

	public ArrayList<Local> selectLocalList(Connection conn) {
		
		ArrayList<Local> list1 = new ArrayList<Local>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocalList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list1.add(new Local(rset.getInt("LOCAL_NO"),
									  rset.getString("LOCAL_NAME")
									  ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list1;
	}

	public ArrayList<NormalChallenge> normalChallengeList(Connection conn, int local) {
		ArrayList<NormalChallenge> list2 = new ArrayList<NormalChallenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		try {
			
			if(local == 0) {
				String sql = prop.getProperty("normalChallengeList");
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list2.add(new NormalChallenge(rset.getInt("NOR_CHLG_NO"),
							rset.getString("NOR_CHLG_TITLE"),
							rset.getDate("ENROLL_DATE"),
							rset.getDate("NOR_CHLG_DATE"),
							rset.getInt("NOR_CHLG_MAX"),
							rset.getString("NOR_CHLG_ID"),
							rset.getString("LOCAL_NAME"),
							rset.getInt("COUNT")
							));
				}
				
				
			}else {
				String sql = prop.getProperty("normalChallengeListLocal");
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, local);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list2.add(new NormalChallenge(rset.getInt("NOR_CHLG_NO"),
							rset.getString("NOR_CHLG_TITLE"),
							rset.getDate("ENROLL_DATE"),
							rset.getDate("NOR_CHLG_DATE"),
							rset.getInt("NOR_CHLG_MAX"),
							rset.getString("NOR_CHLG_ID"),
							rset.getString("LOCAL_NAME"),
							rset.getInt("COUNT")
							));
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(local);
		System.out.println(list2);
		return list2;
		
	}

	
}
