package com.ovcos.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	/**
	 *1. 而ㅻ꽖�뀡 媛앹껜 �깮�꽦 (DB�� �젒�냽) �븳 �썑 �빐�떦 connection 媛앹껜 諛섑솚�빐二쇰뒗 硫붿꽌�뱶
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC", "JDBC");
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * 2. commit�쓣 泥섎━�빐二쇰뒗 硫붿꽌�뱶 (而ㅻ꽖�뀡 媛앹껜瑜� �쟾�떖諛쏆븘�꽌)
	 * @param conn
	 */
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 3. Rollback�쓣 泥섎━�빐二쇰뒗 硫붿꽌�뱶 (而ㅻ꽖�뀡 媛앹껜瑜� �쟾�떖諛쏆븘�꽌)
	 * @param conn
	 */
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 4. Statement 愿��젴 媛앹껜 �쟾�떖諛쏆븘�꽌 諛섎궔�떆耳쒖＜�뒗 硫붿꽌�뱶
	 * @param stmt
	 */
	public static void close(Statement stmt) {// �뼐媛� 遺�紐⑤씪�꽌 PreparedStatement 諛쏆쓣�닔 �엳�쓬.
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 5. Connection 媛앹껜 �쟾�떖 諛쏆븘�꽌 諛섎궔�떆耳쒖＜�뒗 硫붿꽌�뱶
	 * @param conn
	 */
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 6. ResultSet 媛앹껜 �쟾�떖 諛쏆븘�꽌 諛섎궔�떆耳쒖＜�뒗 硫붿꽌�뱶
	 * @param rset
	 */
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
