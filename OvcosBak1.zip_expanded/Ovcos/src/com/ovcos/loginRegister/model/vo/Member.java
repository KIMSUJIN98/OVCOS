package com.ovcos.loginRegister.model.vo;

public class Member {
	private String memId;
	private String memPwd;
	private String memName;
	private String memNick;
	private String memIntro;
	private String memBirth;
	private String memStatus;
	private String memLocInfo;
	private String memPublicNy;
	private int memGoalDtn;
	private String memCodeNy;
	private int memRprCum;
	private String memApiType;
	private String memApiToken;
	private String memEml;
	private String marketNy;
	
	public Member() {}
	
	public Member(String memId, String memPwd, String memName, String memNick, String memIntro, String memBirth,
			String memStatus, String memLocInfo, String memPublicNy, int memGoalDtn, String memCodeNy, int memRprCum,
			String memApiType, String memApiToken, String memEml, String marketNy) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memNick = memNick;
		this.memIntro = memIntro;
		this.memBirth = memBirth;
		this.memStatus = memStatus;
		this.memLocInfo = memLocInfo;
		this.memPublicNy = memPublicNy;
		this.memGoalDtn = memGoalDtn;
		this.memCodeNy = memCodeNy;
		this.memRprCum = memRprCum;
		this.memApiType = memApiType;
		this.memApiToken = memApiToken;
		this.memEml = memEml;
		this.marketNy = marketNy;
	}



	
	public Member(String memId, String memPwd, String memName, String memNick, String memBirth, String memEml,
			String marketNy) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memNick = memNick;
		this.memBirth = memBirth;
		this.memEml = memEml;
		this.marketNy = marketNy;
	}

	public Member(String memId) {
		super();
		this.memId = memId;
	}
	
	
	 public Member(String memId, String memPwd) {
		 super(); 
		 this.memId = memId;
		 this.memPwd = memPwd; 
	 }
	 


	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemIntro() {
		return memIntro;
	}

	public void setMemIntro(String memIntro) {
		this.memIntro = memIntro;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemLocInfo() {
		return memLocInfo;
	}

	public void setMemLocInfo(String memLocInfo) {
		this.memLocInfo = memLocInfo;
	}

	public String getMemPublicNy() {
		return memPublicNy;
	}

	public void setMemPublicNy(String memPublicNy) {
		this.memPublicNy = memPublicNy;
	}

	public int getMemGoalDtn() {
		return memGoalDtn;
	}

	public void setMemGoalDtn(int memGoalDtn) {
		this.memGoalDtn = memGoalDtn;
	}

	public String getMemCodeNy() {
		return memCodeNy;
	}

	public void setMemCodeNy(String memCodeNy) {
		this.memCodeNy = memCodeNy;
	}

	public int getMemRprCum() {
		return memRprCum;
	}

	public void setMemRprCum(int memRprCum) {
		this.memRprCum = memRprCum;
	}

	public String getMemApiType() {
		return memApiType;
	}

	public void setMemApiType(String memApiType) {
		this.memApiType = memApiType;
	}

	public String getMemApiToken() {
		return memApiToken;
	}

	public void setMemApiToken(String memApiToken) {
		this.memApiToken = memApiToken;
	}

	public String getMemEml() {
		return memEml;
	}

	public void setMemEml(String memEml) {
		this.memEml = memEml;
	}
	
	

	public String getMarketNy() {
		return marketNy;
	}


	public void setMarketNy(String marketNy) {
		this.marketNy = marketNy;
	}


	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName + ", memNick=" + memNick
				+ ", memIntro=" + memIntro + ", memBirth=" + memBirth + ", memStatus=" + memStatus + ", memLocInfo="
				+ memLocInfo + ", memPublicNy=" + memPublicNy + ", memGoalDtn=" + memGoalDtn + ", memCodeNy="
				+ memCodeNy + ", memRprCum=" + memRprCum + ", memApiType=" + memApiType + ", memApiToken=" + memApiToken
				+ ", memEml=" + memEml + ", marketNy=" + marketNy + "]";
	}

}