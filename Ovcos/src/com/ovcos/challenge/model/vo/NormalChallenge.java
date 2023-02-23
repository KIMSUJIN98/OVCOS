package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class NormalChallenge {
	private int norChlgNo;
	private String norChlgTitle;
	private Date enrollDate;
	private Date norChlgDate;
	private String time;
	private String norChlgLocal;
	private int norChlgMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String norChlgId;
	
	public NormalChallenge() {}

	public NormalChallenge(int norChlgNo, String norChlgTitle, Date enrollDate, Date norChlgDate, String time,
			String norChlgLocal, int norChlgMax, String rprStatus, Date rprDate, String delStatus, String rprId,
			String norChlgId) {
		super();
		this.norChlgNo = norChlgNo;
		this.norChlgTitle = norChlgTitle;
		this.enrollDate = enrollDate;
		this.norChlgDate = norChlgDate;
		this.time = time;
		this.norChlgLocal = norChlgLocal;
		this.norChlgMax = norChlgMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.norChlgId = norChlgId;
	}

	public int getNorChlgNo() {
		return norChlgNo;
	}

	public void setNorChlgNo(int norChlgNo) {
		this.norChlgNo = norChlgNo;
	}

	public String getNorChlgTitle() {
		return norChlgTitle;
	}

	public void setNorChlgTitle(String norChlgTitle) {
		this.norChlgTitle = norChlgTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getNorChlgDate() {
		return norChlgDate;
	}

	public void setNorChlgDate(Date norChlgDate) {
		this.norChlgDate = norChlgDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getNorChlgLocal() {
		return norChlgLocal;
	}

	public void setNorChlgLocal(String norChlgLocal) {
		this.norChlgLocal = norChlgLocal;
	}

	public int getNorChlgMax() {
		return norChlgMax;
	}

	public void setNorChlgMax(int norChlgMax) {
		this.norChlgMax = norChlgMax;
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

	public String getNorChlgId() {
		return norChlgId;
	}

	public void setNorChlgId(String norChlgId) {
		this.norChlgId = norChlgId;
	}

	@Override
	public String toString() {
		return "NormalChallenge [norChlgNo=" + norChlgNo + ", norChlgTitle=" + norChlgTitle + ", enrollDate="
				+ enrollDate + ", norChlgDate=" + norChlgDate + ", time=" + time + ", norChlgLocal=" + norChlgLocal
				+ ", norChlgMax=" + norChlgMax + ", rprStatus=" + rprStatus + ", rprDate=" + rprDate + ", delStatus="
				+ delStatus + ", rprId=" + rprId + ", norChlgId=" + norChlgId + "]";
	}
	
	
}
