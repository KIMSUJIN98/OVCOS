package com.ovcos.cut.model.vo;

public class Cut {
	
	 private String memId;
	 private String cutId;
	 private String cutStatus;
	 private String memName;
	 private String memIntro;
	 private String memNick;
	 
	 
	 public Cut() {}


	public Cut(String memId, String cutId, String cutStatus, String memName, String memIntro, String memNick) {
		super();
		this.memId = memId;
		this.cutId = cutId;
		this.cutStatus = cutStatus;
		this.memName = memName;
		this.memIntro = memIntro;
		this.memNick = memNick;
	}


	public Cut(String memId, String memName, String memIntro) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memIntro = memIntro;
	}


	
	public Cut(String memId) {
		super();
		this.memId = memId;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getCutId() {
		return cutId;
	}


	public void setCutId(String cutId) {
		this.cutId = cutId;
	}


	public String getCutStatus() {
		return cutStatus;
	}


	public void setCutStatus(String cutStatus) {
		this.cutStatus = cutStatus;
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
		return "Cut [memId=" + memId + ", cutId=" + cutId + ", cutStatus=" + cutStatus + ", memName=" + memName
				+ ", memIntro=" + memIntro + ", memNick=" + memNick + "]";
	}

	
	 
	

}
