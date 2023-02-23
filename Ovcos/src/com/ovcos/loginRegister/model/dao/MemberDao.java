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
								, rset.getDate(6)
								, rset.getString(7)
								, rset.getString(8)
								, rset.getString(9)
								, rset.getInt(10)
								, rset.getString(11)
								, rset.getInt(12)
								, rset.getString(13)
								, rset.getString(14)
								, rset.getString(15)
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
