package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class ContestChallenge {
	private int cntsChlgNo;
	private String cntsChlgTitle;
	private Date enrollDate;
	private Date cntsChlgDate;
	private String time;
	private int cntsChlgMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private int cntsNo;
	private String cntsChlgId;
	
	public ContestChallenge() {}

	public ContestChallenge(int cntsChlgNo, String cntsChlgTitle, Date enrollDate, Date cntsChlgDate, String time,
			int cntsChlgMax, String rprStatus, Date rprDate, String delStatus, String rprId, int cntsNo,
			String cntsChlgId) {
		super();
		this.cntsChlgNo = cntsChlgNo;
		this.cntsChlgTitle = cntsChlgTitle;
		this.enrollDate = enrollDate;
		this.cntsChlgDate = cntsChlgDate;
		this.time = time;
		this.cntsChlgMax = cntsChlgMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.cntsNo = cntsNo;
		this.cntsChlgId = cntsChlgId;
	}

	public int getCntsChlgNo() {
		return cntsChlgNo;
	}

	public void setCntsChlgNo(int cntsChlgNo) {
		this.cntsChlgNo = cntsChlgNo;
	}

	public String getCntsChlgTitle() {
		return cntsChlgTitle;
	}

	public void setCntsChlgTitle(String cntsChlgTitle) {
		this.cntsChlgTitle = cntsChlgTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getCntsChlgDate() {
		return cntsChlgDate;
	}

	public void setCntsChlgDate(Date cntsChlgDate) {
		this.cntsChlgDate = cntsChlgDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getCntsChlgMax() {
		return cntsChlgMax;
	}

	public void setCntsChlgMax(int cntsChlgMax) {
		this.cntsChlgMax = cntsChlgMax;
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

	public int getCntsNo() {
		return cntsNo;
	}

	public void setCntsNo(int cntsNo) {
		this.cntsNo = cntsNo;
	}

	public String getCntsChlgId() {
		return cntsChlgId;
	}

	public void setCntsChlgId(String cntsChlgId) {
		this.cntsChlgId = cntsChlgId;
	}

	@Override
	public String toString() {
		return "ContestChallenge [cntsChlgNo=" + cntsChlgNo + ", cntsChlgTitle=" + cntsChlgTitle + ", enrollDate="
				+ enrollDate + ", cntsChlgDate=" + cntsChlgDate + ", time=" + time + ", cntsChlgMax=" + cntsChlgMax
				+ ", rprStatus=" + rprStatus + ", rprDate=" + rprDate + ", delStatus=" + delStatus + ", rprId=" + rprId
				+ ", cntsNo=" + cntsNo + ", cntsChlgId=" + cntsChlgId + "]";
	}
	
	
	
}
