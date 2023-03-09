package com.ovcos.loginRegister.model.service;

import static com.ovcos.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ovcos.loginRegister.model.dao.MemberDao;
import com.ovcos.loginRegister.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	public Member refreshMember(String userId) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().refreshMember(conn, userId);
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

public Member checkRegister(String name,String email) {
	Connection conn = getConnection();
	
	Member m = new MemberDao().checkRegister(conn, name, email);
	
	System.out.println(name);
	System.out.println(email);
	close(conn);
	return m;
}

public Member pwdRegister(String id, String email) {
	Connection conn = getConnection();
	
	Member m = new MemberDao().pwdRegister(conn, id, email);
	
	System.out.println(id);
	System.out.println(email);
	
	close(conn);
	return m;
}
public Member updatePwd(String updatePwd, String id) {
	Connection conn = getConnection();
	
	int result = new MemberDao().updatePwd(conn, updatePwd, id);
	Member updateMem = null; 
	
	System.out.println(updatePwd); 
	System.out.println(id);
	
	if(result>0) {
		commit(conn);
		updateMem = new MemberDao().selectMember(conn, id);
	} else {
		rollback(conn);
		
	}
	close(conn);
	return updateMem;
}

}
