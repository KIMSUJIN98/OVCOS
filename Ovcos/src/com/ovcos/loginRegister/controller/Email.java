package com.ovcos.loginRegister.controller;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

@WebServlet("/EmailAuthServlet")
public class Email extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이메일 발송 정보 설정
        String host = "smtp.gmail.com"; // SMTP 서버 주소
        String user = "khofcos@gmail.com"; // 발송자 이메일 계정
        String password = "ofcospass01"; // 발송자 이메일 계정 비밀번호

        // 이메일 수신자 정보 설정
        String recipient = request.getParameter("email"); // 수신자 이메일 주소
        String subject = "이메일 인증 코드"; // 이메일 제목

        // 이메일 인증 코드 생성
        Random rand = new Random();
        String code = String.format("%04d", rand.nextInt(10000)); // 4자리 무작위 인증 코드 생성

        // 이메일 내용 작성
        String content = "<h2>이메일 인증 코드는 다음과 같습니다.</h2><br><h3>" + code + "</h3>";

        // 이메일 발송
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            message.setSubject(subject);
            message.setContent(content, "text/html;charset=utf-8");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        } 
    }
}