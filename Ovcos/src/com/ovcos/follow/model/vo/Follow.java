package com.ovcos.follow.model.vo;

import java.sql.Date;

public class Follow {

	
	 private String memId;// 로그인아이디
	 private String flwId; // 로그인유저가 팔로우한 아이디 
	 private Date flwDate; // 팔로우한 날짜
	 private String memName;  //내가 친추건 회원 네임
	 private String memIntro; // 친추건 회원 자기소개 
	 private String memNick; //친추건 회원 닉네임 
	 
	 
	 public Follow() {}

	 

	public Follow(String flwId) {
		super();
		this.flwId = flwId;
	}



	public Follow(String memId, String flwId, Date flwDate, String memName, String memIntro) {
		super();
		this.memId = memId;
		this.flwId = flwId;
		this.flwDate = flwDate;
		this.memName = memName;
		this.memIntro = memIntro;
	}


	
	public Follow(String flwId, String memName, String memIntro) {
		super();
		this.flwId = flwId;
		this.memName = memName;
		this.memIntro = memIntro;
	}


	public Follow(String memName, String memIntro) {
		super();
		this.memName = memName;
		this.memIntro = memIntro;
	}

	




	public Follow(String memId, String flwId, String memName, String memIntro) {
		super();
		this.memId = memId;
		this.flwId = flwId;
		this.memName = memName;
		this.memIntro = memIntro;

	}



	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getFlwId() {
		return flwId;
	}


	public void setFlwId(String flwId) {
		this.flwId = flwId;
	}


	public Date getFlwDate() {
		return flwDate;
	}


	public void setFlwDate(Date flwDate) {
		this.flwDate = flwDate;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemIntro() {
		return memIntro;
	}


	public void setMemIntro(String memIntro) {
		this.memIntro = memIntro;
	}


	public String getMemNick() {
		return memNick;
	}


	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}


	@Override
	public String toString() {
		return "Follow [memId=" + memId + ", flwId=" + flwId + ", flwDate=" + flwDate + ", memName=" + memName
				+ ", memIntro=" + memIntro + ", memNick=" + memNick + "]";
	}




	 


	
	
}
