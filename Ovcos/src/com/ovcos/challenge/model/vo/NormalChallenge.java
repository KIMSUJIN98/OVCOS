package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class NormalChallenge {
	
	private int normalChallengeNo;
	private String normalChallengeTitle;
	private String normalChallengeContent;
	private Date enrollDate;
	private String normalChallengeDate;
	private int normalChallengeMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String normalChallengeId;
	private String normalChallengeLocal;
	
	private String changeName;
	private String localName;
	private int localNo;
	private int count;
	
	
	public NormalChallenge() {}
	

	public NormalChallenge(int normalChallengeNo, String normalChallengeTitle, String normalChallengeContent,
			Date enrollDate, String normalChallengeDate, int normalChallengeMax, String rprStatus, Date rprDate,
			String delStatus, String rprId, String normalChallengeId, String normalChallengeLocal, int count) {
		super();
		this.normalChallengeNo = normalChallengeNo;
		this.normalChallengeTitle = normalChallengeTitle;
		this.normalChallengeContent = normalChallengeContent;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
		this.count = count;
	}


	public NormalChallenge(int normalChallengeNo, String normalChallengeTitle, Date enrollDate,
			String normalChallengeDate, int normalChallengeMax, String normalChallengeId, String normalChallengeLocal,
			int count) {
		super();
		this.normalChallengeNo = normalChallengeNo;
		this.normalChallengeTitle = normalChallengeTitle;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
		this.count = count;
	}

	public NormalChallenge(String normalChallengeTitle, Date enrollDate, String normalChallengeDate,
			int normalChallengeMax, String normalChallengeId, String normalChallengeLocal) {
		super();
		this.normalChallengeTitle = normalChallengeTitle;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
	}
	
	
	
	public NormalChallenge(int normalChallengeNo, String normalChallengeTitle, String normalChallengeContent,
			Date enrollDate, String normalChallengeDate, int normalChallengeMax, String normalChallengeId,
			String normalChallengeLocal, String changeName, int count) {
		super();
		this.normalChallengeNo = normalChallengeNo;
		this.normalChallengeTitle = normalChallengeTitle;
		this.normalChallengeContent = normalChallengeContent;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
		this.changeName = changeName;
		this.count = count;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}

	public int getNormalChallengeNo() {
		return normalChallengeNo;
	}

	public void setNormalChallengeNo(int normalChallengeNo) {
		this.normalChallengeNo = normalChallengeNo;
	}

	public String getNormalChallengeTitle() {
		return normalChallengeTitle;
	}

	public void setNormalChallengeTitle(String normalChallengeTitle) {
		this.normalChallengeTitle = normalChallengeTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getNormalChallengeDate() {
		return normalChallengeDate;
	}

	public void setNormalChallengeDate(String normalChallengeDate) {
		this.normalChallengeDate = normalChallengeDate;
	}

	public int getNormalChallengeMax() {
		return normalChallengeMax;
	}

	public void setNormalChallengeMax(int normalChallengeMax) {
		this.normalChallengeMax = normalChallengeMax;
	}

	public String getRprStatus() {
		return rprStatus;
	}

	public void setRprStatus(String rprStatus) {
		this.rprStatus = rprStatus;
	}

	public Date getRprDate() {
		return rprDate;
	}

	public void setRprDate(Date rprDate) {
		this.rprDate = rprDate;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public String getRprId() {
		return rprId;
	}

	public void setRprId(String rprId) {
		this.rprId = rprId;
	}

	public String getNormalChallengeId() {
		return normalChallengeId;
	}

	public void setNormalChallengeId(String normalChallengeId) {
		this.normalChallengeId = normalChallengeId;
	}

	public String getNormalChallengeLocal() {
		return normalChallengeLocal;
	}

	public void setNormalChallengeLocal(String normalChallengeLocal) {
		this.normalChallengeLocal = normalChallengeLocal;
	}

	

	public String getNormalChallengeContent() {
		return normalChallengeContent;
	}


	public void setNormalChallengeContent(String normalChallengeContent) {
		this.normalChallengeContent = normalChallengeContent;
	}
	
	


	public String getLocalName() {
		return localName;
	}


	public void setLocalName(String localName) {
		this.localName = localName;
	}


	
	public int getLocalNo() {
		return localNo;
	}


	public void setLocalNo(int localNo) {
		this.localNo = localNo;
	}


	@Override
	public String toString() {
		return "NormalChallenge [normalChallengeNo=" + normalChallengeNo + ", normalChallengeTitle="
				+ normalChallengeTitle + ", normalChallengeContent=" + normalChallengeContent + ", enrollDate="
				+ enrollDate + ", normalChallengeDate=" + normalChallengeDate + ", normalChallengeMax="
				+ normalChallengeMax + ", rprStatus=" + rprStatus + ", rprDate=" + rprDate + ", delStatus=" + delStatus
				+ ", rprId=" + rprId + ", normalChallengeId=" + normalChallengeId + ", normalChallengeLocal="
				+ normalChallengeLocal + ", count=" + count + "]";
	}

	
	

	
	
	
}
