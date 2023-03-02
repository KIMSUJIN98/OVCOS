package com.ovcos.loginRegister.model.service;

import static com.ovcos.common.JDBCTemplate.*;

import java.sql.Connection;

import com.ovcos.loginRegister.model.dao.MemberDao;
import com.ovcos.loginRegister.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

public int idCheck(String checkId) {
	Connection conn = getConnection();
	
	int count = new MemberDao().idCheck(conn, checkId);
	
	close(conn);
	return count;
}

public int nickCheck(String checkNick) {
	Connection conn = getConnection();
	
	int count = new MemberDao().nickCheck(conn, checkNick);
	
	close(conn);
	return count;
}
}
