package com.ovcos.challenge.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ovcos.challenge.model.service.ChallengeService;
import com.ovcos.challenge.model.vo.Contest;
import com.ovcos.challenge.model.vo.ContestChallenge;
import com.ovcos.challenge.model.vo.EntryList;
import com.ovcos.challenge.model.vo.Local;
import com.ovcos.challenge.model.vo.NEntryList;
import com.ovcos.challenge.model.vo.NormalChallenge;
import com.ovcos.upload.model.vo.ImageUpload;

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

	public ArrayList<Contest> selectContestList(Connection conn) {
		ArrayList<Contest> list = new ArrayList<Contest>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Contest(rset.getInt("CNTS_NO"),
						             rset.getString("CNTS_NAME"),
									 rset.getString("CNTS_DATE"),
									 rset.getString("CNTS_URL"),
									 rset.getString("CHANGE_NAME")
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
				list1.add(new ContestChallenge(rset.getInt("CNTS_CHLG_NO"),
											   rset.getString("CNTS_CHLG_TITLE"),
											   rset.getString("CNTS_CHLG_CONTENT"),
											   rset.getString("ENROLL_DATE"),
											   rset.getString("CNTS_CHLG_DATE"),
											   rset.getInt("CNTS_CHLG_MAX"),
											   rset.getString("CNTS_CHLG_ID"),
											   rset.getString("CNTS_NAME"),
											   rset.getString("CHANGE_NAME")
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
											  rset.getString("NOR_CHLG_DATE"),
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

	public ArrayList<ContestChallenge> contestChallengeList(Connection conn, int contestNo) {
		ArrayList<ContestChallenge> list = new ArrayList<ContestChallenge>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("contestChallengeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ContestChallenge(rset.getInt("CNTS_CHLG_NO"),
											  rset.getString("CNTS_CHLG_TITLE"),
											  rset.getString("CNTS_CHLG_CONTENT"),
											  rset.getString("ENROLL_DATE"),
											  rset.getString("CNTS_CHLG_DATE"),
											  rset.getInt("CNTS_CHLG_MAX"),
											  rset.getString("CNTS_CHLG_ID"),
											  rset.getString("CNTS_NAME"),
											  rset.getString("CHANGE_NAME"),
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
												  rset.getString("NOR_CHLG_CONTENT"),
												  rset.getDate("ENROLL_DATE"),
												  rset.getString("NOR_CHLG_DATE"),
												  rset.getInt("NOR_CHLG_MAX"),
												  rset.getString("NOR_CHLG_ID"),
												  rset.getString("LOCAL_NAME"),
												  rset.getString("CHANGE_NAME"),
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
												  rset.getString("NOR_CHLG_CONTENT"),
												  rset.getDate("ENROLL_DATE"),
												  rset.getString("NOR_CHLG_DATE"),
												  rset.getInt("NOR_CHLG_MAX"),
												  rset.getString("NOR_CHLG_ID"),
												  rset.getString("LOCAL_NAME"),
												  rset.getString("CHANGE_NAME"),
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
		
		return list2;
		
	}

	public int insertContest(Connection conn, Contest c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getContestName());
			pstmt.setString(2, c.getContestDate());
			pstmt.setString(3, c.getContestUrl());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertContestImg(Connection conn, ImageUpload img) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getUplId());
			pstmt.setInt(2, img.getUplMenu());
			pstmt.setString(3, img.getOriginName());
			pstmt.setString(4, img.getChangeName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteContest(Connection conn, int contestNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteContest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, contestNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertContestChallenge(Connection conn, ContestChallenge cc) {
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContestChallenge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cc.getContestChallengeTitle());
			pstmt.setString(2, cc.getContestChallengeContent());
			pstmt.setString(3, cc.getContestChallengeDate());
			pstmt.setInt(4, cc.getContestChallengeMax());
			pstmt.setString(5, cc.getContestChallengeId());
			pstmt.setInt(6, Integer.parseInt(cc.getContestNo()));
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result1;
	}

	public int insertContestChallengeImg(Connection conn, ContestChallenge cc, ImageUpload img) {
		int result2 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertContestChallengeImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getUplId());
			pstmt.setInt(2, img.getUplMenu());
			pstmt.setString(3, img.getOriginName());
			pstmt.setString(4, img.getChangeName());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result2;
		
	}

	public Contest selectContest(Connection conn, int contestNo) {
		Contest c = new Contest();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Contest(rset.getInt("CNTS_NO"),
						rset.getString("CNTS_NAME"),
						rset.getString("CNTS_DATE"),
						rset.getString("CNTS_URL"),
						rset.getString("CHANGE_NAME")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public int deleteContestChallenge(Connection conn, int contestChallengeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteContestChallenge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, contestChallengeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}

	public int insertEntryListSelf(Connection conn, ContestChallenge cc) {
		int result3 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEntryListSelf");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cc.getContestChallengeId());
			
			result3 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result3;		
		
	}

	public int insertEntryList(Connection conn, EntryList el) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, el.getContestChallNo());
			pstmt.setString(2, el.getContestEntryId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<EntryList> selectEntryList(Connection conn, int contestChallengeNo) {
		ArrayList<EntryList> list = new ArrayList<EntryList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, contestChallengeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new EntryList(rset.getInt("CHLG_NO_INLIST"),
								   	   rset.getString("CHLG_ENTRY_ID"),
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

	public int deleteEntryList(Connection conn, EntryList el) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, el.getContestChallNo());
			pstmt.setString(2, el.getContestEntryId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<EntryList> checkEntryId(Connection conn, EntryList el) {
		ArrayList<EntryList> list = new ArrayList<EntryList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkEntryId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, el.getContestChallNo());
			pstmt.setString(2, el.getContestEntryId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new EntryList(rset.getInt("CHLG_NO_INLIST"),
								   	   rset.getString("CHLG_ENTRY_ID")
								   ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}

	public int insertNormalChallenge(Connection conn, NormalChallenge nc) {
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNormalChallenge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nc.getNormalChallengeTitle());
			pstmt.setString(2, nc.getNormalChallengeContent());
			pstmt.setString(3, nc.getNormalChallengeDate());
			pstmt.setInt(4, nc.getNormalChallengeMax());
			pstmt.setString(5, nc.getNormalChallengeId());
			pstmt.setInt(6, Integer.parseInt(nc.getNormalChallengeLocal()));
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result1;
	}

	public int insertNEntryListSelf(Connection conn, NormalChallenge nc) {
		int result3 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNEntryListSelf");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nc.getNormalChallengeId());
			
			result3 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result3;	
		
	}

	public int insertNormalChallengeImg(Connection conn, NormalChallenge nc, ImageUpload img) {
		int result2 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNormalChallengeImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getUplId());
			pstmt.setInt(2, img.getUplMenu());
			pstmt.setString(3, img.getOriginName());
			pstmt.setString(4, img.getChangeName());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result2;
		
	}

	public ArrayList<NEntryList> checkNEntryId(Connection conn, NEntryList nel) {
		ArrayList<NEntryList> list = new ArrayList<NEntryList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkNEntryId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nel.getNormalChallNo());
			pstmt.setString(2, nel.getNormalEntryId());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new NEntryList(rset.getInt("NCHLG_NO_INLIST"),
								   	   rset.getString("NCHLG_ENTRY_ID")
								   ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
		
	}

	public int insertNEntryList(Connection conn, NEntryList nel) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nel.getNormalChallNo());
			pstmt.setString(2, nel.getNormalEntryId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNEntryList(Connection conn, NEntryList nel) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nel.getNormalChallNo());
			pstmt.setString(2, nel.getNormalEntryId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<NEntryList> selectNEntryList(Connection conn, int normalChallengeNo) {
		ArrayList<NEntryList> list = new ArrayList<NEntryList>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNEntryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, normalChallengeNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new NEntryList(rset.getInt("NCHLG_NO_INLIST"),
								   	   rset.getString("NCHLG_ENTRY_ID"),
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

	public int deleteNormalChallenge(Connection conn, int normalChallengeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNormalChallenge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, normalChallengeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<NormalChallenge> selectLocalView(Connection conn, int localNo) {
		ArrayList<NormalChallenge> list = new ChallengeService().selectLocalView(localNo);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocalView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, localNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new NormalChallenge(rset.getInt("NOR_CHLG_NO"),
										  rset.getString("NOR_CHLG_TITLE"),
										  rset.getString("NOR_CHLG_CONTENT"),
										  rset.getDate("ENROLL_DATE"),
										  rset.getString("NOR_CHLG_DATE"),
										  rset.getInt("NOR_CHLG_MAX"),
										  rset.getString("NOR_CHLG_ID"),
										  rset.getString("LOCAL_NAME"),
										  rset.getString("CHANGE_NAME"),
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



	
}
