package com.ovcos.loginRegister.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication pa;
	
	public MyAuthentication() {
		String id="dlemrdl95@gmail.com";
		String pw = "ubzzupbswsvtzbnd";
		
		pa=new PasswordAuthentication(id, pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
	return pa;
}
}