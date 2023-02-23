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
				list.add(new Contest(rset.getString("CNTS_NAME"),
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
	
}
