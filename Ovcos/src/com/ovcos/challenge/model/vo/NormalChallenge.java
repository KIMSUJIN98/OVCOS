package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class NormalChallenge {
	
	private int normalChallengeNo;
	private String normalChallengeTitle;
	private Date enrollDate;
	private Date normalChallengeDate;
	private int normalChallengeMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String normalChallengeId;
	private String normalChallengeLocal;
	
	private int count;
	
	public NormalChallenge() {}

	public NormalChallenge(int normalChallengeNo, String normalChallengeTitle, Date enrollDate,
			Date normalChallengeDate, int normalChallengeMax, String rprStatus, Date rprDate, String delStatus,
			String rprId, String normalChallengeId, String normalChallengeLocal) {
		super();
		this.normalChallengeNo = normalChallengeNo;
		this.normalChallengeTitle = normalChallengeTitle;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
	}
	

	public NormalChallenge(int normalChallengeNo, String normalChallengeTitle, Date enrollDate,
			Date normalChallengeDate, int normalChallengeMax, String normalChallengeId, String normalChallengeLocal,
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

	public NormalChallenge(String normalChallengeTitle, Date enrollDate, Date normalChallengeDate,
			int normalChallengeMax, String normalChallengeId, String normalChallengeLocal) {
		super();
		this.normalChallengeTitle = normalChallengeTitle;
		this.enrollDate = enrollDate;
		this.normalChallengeDate = normalChallengeDate;
		this.normalChallengeMax = normalChallengeMax;
		this.normalChallengeId = normalChallengeId;
		this.normalChallengeLocal = normalChallengeLocal;
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

	public Date getNormalChallengeDate() {
		return normalChallengeDate;
	}

	public void setNormalChallengeDate(Date normalChallengeDate) {
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

	@Override
	public String toString() {
		return "NormalChallenge [normalChallengeNo=" + normalChallengeNo + ", normalChallengeTitle="
				+ normalChallengeTitle + ", enrollDate=" + enrollDate + ", normalChallengeDate=" + normalChallengeDate
				+ ", normalChallengeMax=" + normalChallengeMax + ", rprStatus=" + rprStatus + ", rprDate=" + rprDate
				+ ", delStatus=" + delStatus + ", rprId=" + rprId + ", normalChallengeId=" + normalChallengeId
				+ ", normalChallengeLocal=" + normalChallengeLocal + "]";
	}

	

	
	
	
}
