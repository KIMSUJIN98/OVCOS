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
								  rset.getString("MEM_ID")
								, rset.getString("MEM_PWD")
								, rset.getString("MEM_NAME")
								, rset.getString("MEM_NICK")
								, rset.getString("MEM_INTRO")
								, rset.getDate("MEM_BIRTH")
								, rset.getString("MEM_STATUS")
								, rset.getString("MEM_LOC_INFO")
								, rset.getString("MEM_PUBLIC_NY")
								, rset.getInt("MEM_GOAL_DTN")
								, rset.getString("MEM_CODE_NY")
								, rset.getInt("MEM_RPR_CUM")
								, rset.getString("MEM_API_TYPE")
								, rset.getString("MEM_API_TOKEN")
								, rset.getString("MEM_EML")
								, rset.getString("MARKET_NY")
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
}
