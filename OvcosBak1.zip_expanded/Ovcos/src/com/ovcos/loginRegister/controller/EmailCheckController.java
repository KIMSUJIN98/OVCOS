package com.ovcos.loginRegister.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.ssl.SSLContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.ovcos.loginRegister.model.vo.MyAuthentication;

/**
 * Servlet implementation class EmailCheckController
 */
@WebServlet("/send.ma1")
public class EmailCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        StringBuffer jb= new StringBuffer();
        String line = null;
        
        try {
        BufferedReader reader = request.getReader();
        while((line = reader.readLine()) != null) 
        	jb.append(line);
        } catch (Exception e) {
        	System.out.println("error");
        }
        
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(jb.toString());

	 Properties props = System.getProperties();
	    props.put("mail.smtp.user", "dlemrdl95");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactroy.fallback", "false");
	    props.put("mail.smtp.ssl.protocols", "TLSv1.2");

    Authenticator auth = new MyAuthentication();
    
    Session session = Session.getDefaultInstance(props, auth);
    MimeMessage msg = new MimeMessage(session);

    SSLContext sc;
    Transport transport = null;
	try {
		msg.setSentDate(new Date());
		
		InternetAddress from = new InternetAddress("dlemrdl95@gmail.com");
		msg.setFrom(from);
		
		System.out.println(from);
		String email = element.getAsJsonObject().get("email").getAsString();
		InternetAddress to = new InternetAddress(email);
		msg.setRecipient(Message.RecipientType.TO, to);
		
		System.out.println(to);
		msg.setSubject("OVCOS 이메일 인증 코드입니다.", "UTF-8");
		
		String code = element.getAsJsonObject().get("code").getAsString();
		request.setAttribute("code", code);
		msg.setText(code, "UTF-8");
		
		System.out.println(code);
		msg.setHeader("content-Type", "text/html");
		
		
		sc = SSLContext.getInstance("TLSv1.2");
        sc.init(null, null, null);


        transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", "Ovcos@gmail.com", "ubzzupbswsvtzbnd");

        System.out.println("여기까지는 돼?");
        javax.mail.Transport.send(msg);
        System.out.println("보냄!");
    } catch (NoSuchAlgorithmException | KeyManagementException e2) {
        // TODO Auto-generated catch block
        e2.printStackTrace();
    } catch (NoSuchProviderException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } catch (MessagingException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } catch (IllegalArgumentException e) {
        // email이 null이거나 비어있는 경우 예외처리
        e.printStackTrace();
    
    	    }
    

    RequestDispatcher rd = request.getRequestDispatcher("views/loginRegister/insertInfo.jsp");
    rd.forward(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
