package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class ContestChallenge {
	private int contestChallNo;
	private String contestChallTitle;
	private Date enrollDate;
	private Date contestChallDate;
	private String time;
	private int contestChallMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private int contestNo;
	private String contestChallId;
	
	public ContestChallenge() {}

	public ContestChallenge(int contestChallNo, String contestChallTitle, Date enrollDate, Date contestChallDate,
			String time, int contestChallMax, String rprStatus, Date rprDate, String delStatus, String rprId,
			int contestNo, String contestChallId) {
		super();
		this.contestChallNo = contestChallNo;
		this.contestChallTitle = contestChallTitle;
		this.enrollDate = enrollDate;
		this.contestChallDate = contestChallDate;
		this.time = time;
		this.contestChallMax = contestChallMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.contestNo = contestNo;
		this.contestChallId = contestChallId;
	}

	public int getContestChallNo() {
		return contestChallNo;
	}

	public void setContestChallNo(int contestChallNo) {
		this.contestChallNo = contestChallNo;
	}

	public String getContestChallTitle() {
		return contestChallTitle;
	}

	public void setContestChallTitle(String contestChallTitle) {
		this.contestChallTitle = contestChallTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getContestChallDate() {
		return contestChallDate;
	}

	public void setContestChallDate(Date contestChallDate) {
		this.contestChallDate = contestChallDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getContestChallMax() {
		return contestChallMax;
	}

	public void setContestChallMax(int contestChallMax) {
		this.contestChallMax = contestChallMax;
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

	public int getContestNo() {
		return contestNo;
	}

	public void setContestNo(int contestNo) {
		this.contestNo = contestNo;
	}

	public String getContestChallId() {
		return contestChallId;
	}

	public void setContestChallId(String contestChallId) {
		this.contestChallId = contestChallId;
	}

	@Override
	public String toString() {
		return "ContestChallenge [contestChallNo=" + contestChallNo + ", contestChallTitle=" + contestChallTitle
				+ ", enrollDate=" + enrollDate + ", contestChallDate=" + contestChallDate + ", time=" + time
				+ ", contestChallMax=" + contestChallMax + ", rprStatus=" + rprStatus + ", rprDate=" + rprDate
				+ ", delStatus=" + delStatus + ", rprId=" + rprId + ", contestNo=" + contestNo + ", contestChallId="
				+ contestChallId + "]";
	}

	
	
	
	
}
