package com.ovcos.follow.model.vo;

import java.sql.Date;

public class Follow {

	
	 private String memId;
	 private String flwId;
	 private Date flwDate;
	 private String memName;
	 private String memIntro;
	 
	 
	 public Follow() {}


	public Follow(String memId, String flwId, Date flwDate, String memName, String memIntro) {
		super();
		this.memId = memId;
		this.flwId = flwId;
		this.flwDate = flwDate;
		this.memName = memName;
		this.memIntro = memIntro;
	}


	
	public Follow(String memName, String memIntro) {
		super();
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


	@Override
	public String toString() {
		return "Follow [memId=" + memId + ", flwId=" + flwId + ", flwDate=" + flwDate + ", memName=" + memName
				+ ", memIntro=" + memIntro + "]";
	}


	 


	
	
}
