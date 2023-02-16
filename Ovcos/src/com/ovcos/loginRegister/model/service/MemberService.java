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
}
