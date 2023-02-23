package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class NormalChallenge {
	private int normalChallNo;
	private String normalChallTitle;
	private Date enrollDate;
	private Date normalChallDate;
	private String time;
	private String normalChallLocal;
	private int normalChallMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String normalChallId;
	
	public NormalChallenge() {}

	public NormalChallenge(int normalChallNo, String normalChallTitle, Date enrollDate, Date normalChallDate,
			String time, String normalChallLocal, int normalChallMax, String rprStatus, Date rprDate, String delStatus,
			String rprId, String normalChallId) {
		super();
		this.normalChallNo = normalChallNo;
		this.normalChallTitle = normalChallTitle;
		this.enrollDate = enrollDate;
		this.normalChallDate = normalChallDate;
		this.time = time;
		this.normalChallLocal = normalChallLocal;
		this.normalChallMax = normalChallMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.normalChallId = normalChallId;
	}

	public int getNormalChallNo() {
		return normalChallNo;
	}

	public void setNormalChallNo(int normalChallNo) {
		this.normalChallNo = normalChallNo;
	}

	public String getNormalChallTitle() {
		return normalChallTitle;
	}

	public void setNormalChallTitle(String normalChallTitle) {
		this.normalChallTitle = normalChallTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getNormalChallDate() {
		return normalChallDate;
	}

	public void setNormalChallDate(Date normalChallDate) {
		this.normalChallDate = normalChallDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getNormalChallLocal() {
		return normalChallLocal;
	}

	public void setNormalChallLocal(String normalChallLocal) {
		this.normalChallLocal = normalChallLocal;
	}

	public int getNormalChallMax() {
		return normalChallMax;
	}

	public void setNormalChallMax(int normalChallMax) {
		this.normalChallMax = normalChallMax;
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

	public String getNormalChallId() {
		return normalChallId;
	}

	public void setNormalChallId(String normalChallId) {
		this.normalChallId = normalChallId;
	}

	@Override
	public String toString() {
		return "NormalChallenge [normalChallNo=" + normalChallNo + ", normalChallTitle=" + normalChallTitle
				+ ", enrollDate=" + enrollDate + ", normalChallDate=" + normalChallDate + ", time=" + time
				+ ", normalChallLocal=" + normalChallLocal + ", normalChallMax=" + normalChallMax + ", rprStatus="
				+ rprStatus + ", rprDate=" + rprDate + ", delStatus=" + delStatus + ", rprId=" + rprId
				+ ", normalChallId=" + normalChallId + "]";
	}

	
	
	
}
