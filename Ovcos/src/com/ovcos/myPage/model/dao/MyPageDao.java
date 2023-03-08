package com.ovcos.myPage.model.dao;

import static com.ovcos.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.AddressException;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;

import com.ovcos.feed.model.dao.FeedDao;
import com.ovcos.myPage.model.vo.MyPage;

public class MyPageDao {
	
	Properties prop = new Properties();
	
	public MyPageDao() {
		String filePath = FeedDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 이번달 총 달린거리를 계산하는 메소드
	 * @param conn
	 * @param userId
	 */
	public MyPage totalDistance(Connection conn, String userId) {
		MyPage mp = new MyPage();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("totalDistance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mp = new MyPage(rset.getString("MEM_ID"), rset.getDouble("DISTANCE"), rset.getString("RUNDATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mp;
	}
	
	/**
	 * 오늘 날짜를 String으로 반환해주는 메소드
	 * @param conn
	 * @return
	 */
	public String selectToday(Connection conn) {
		String today = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectToday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				today = rset.getString("RUNDATE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return today;
	}
	
	/**
	 * 오늘 날짜를 기준으로 일주일간의 일자별 달린거리를 담은 리스트를 반환하는 메소드
	 * @param conn
	 * @param userId
	 */
	public ArrayList<MyPage> dayDistanceList(Connection conn, String userId) {
		ArrayList<MyPage> list = new ArrayList<MyPage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("dayDistanceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyPage mp = new MyPage();
				mp.setUserId(rset.getString("MEM_ID"));
				mp.setDistance(rset.getDouble("DISTANCE"));
				mp.setRunDate(rset.getString("RUNDATE"));
				list.add(mp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
	/**
	 * 목표 재설정을 위한 메소드
	 * @param conn
	 * @param userGoal
	 * @param userId
	 * @return
	 */
	public int updateSetGoal(Connection conn, int userGoal, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateSetGoal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userGoal);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	// 개인정보수정시 인증코드 발송을 위한 메소드 구문
//	public static void gmailSend() {
//        String user = "khofcos@gmail.com";
//        String password = "ofcospass01";
//
//        // SMTP 서버 정보를 설정한다.
//        Properties prop = new Properties();
//        prop.put("mail.smtp.host", "smtp.gmail.com"); 
//        prop.put("mail.smtp.port", 465); 
//        prop.put("mail.smtp.auth", "true"); 
//        prop.put("mail.smtp.ssl.enable", "true"); 
//        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//        
//        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(user, password);
//            }
//        });
//
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(user));
//
//            //수신자메일주소
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress("otter98k@gmail.com")); 
//
//            // Subject
//            message.setSubject("개인정보수정을 위한 인증코드입니다."); //메일 제목을 입력
//
//            // Text
//            message.setText("인증코드는 41235 입니다. 제한시간내에 입력 바랍니다.");    //메일 내용을 입력
//
//            // send the message
//            Transport.send(message); ////전송
//            System.out.println("message sent successfully...");
//        } catch (AddressException e) {
//            e.printStackTrace();
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }

}
