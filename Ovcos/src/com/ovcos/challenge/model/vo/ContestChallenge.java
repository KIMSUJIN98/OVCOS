package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class ContestChallenge {
	private int contestChallengeNo;
	private String contestChallengeTitle;
	private Date enrollDate;
	private Date contestChallengeDate;
	private int contestChallengeMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String contestChallengeId;
	private String contestNo;
	
	private int count;
	
	public ContestChallenge() {}

	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, Date enrollDate,
			Date contestChallengeDate, int contestChallengeMax, String rprStatus, Date rprDate, String delStatus,
			String rprId, String contestChallengeId, String contestNo) {
		super();
		this.contestChallengeNo = contestChallengeNo;
		this.contestChallengeTitle = contestChallengeTitle;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
	}
	
	public ContestChallenge(String contestChallengeTitle, Date enrollDate, Date contestChallengeDate,
			int contestChallengeMax, String contestChallengeId, String contestNo) {
		super();
		this.contestChallengeTitle = contestChallengeTitle;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
	}


	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, Date enrollDate,
			Date contestChallengeDate, int contestChallengeMax, String contestChallengeId, String contestNo,
			int count) {
		super();
		this.contestChallengeNo = contestChallengeNo;
		this.contestChallengeTitle = contestChallengeTitle;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
		this.count = count;
	}

	public ContestChallenge(int count) {
		super();
		this.count = count;
	}

	public int getContestChallengeNo() {
		return contestChallengeNo;
	}

	public void setContestChallengeNo(int contestChallengeNo) {
		this.contestChallengeNo = contestChallengeNo;
	}

	public String getContestChallengeTitle() {
		return contestChallengeTitle;
	}

	public void setContestChallengeTitle(String contestChallengeTitle) {
		this.contestChallengeTitle = contestChallengeTitle;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getContestChallengeDate() {
		return contestChallengeDate;
	}

	public void setContestChallengeDate(Date contestChallengeDate) {
		this.contestChallengeDate = contestChallengeDate;
	}

	public int getContestChallengeMax() {
		return contestChallengeMax;
	}

	public void setContestChallengeMax(int contestChallengeMax) {
		this.contestChallengeMax = contestChallengeMax;
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

	public String getContestChallengeId() {
		return contestChallengeId;
	}

	public void setContestChallengeId(String contestChallengeId) {
		this.contestChallengeId = contestChallengeId;
	}

	public String getContestNo() {
		return contestNo;
	}

	public void setContestNo(String contestNo) {
		this.contestNo = contestNo;
	}
	
	
	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ContestChallenge [contestChallengeNo=" + contestChallengeNo + ", contestChallengeTitle="
				+ contestChallengeTitle + ", enrollDate=" + enrollDate + ", contestChallengeDate="
				+ contestChallengeDate + ", contestChallengeMax=" + contestChallengeMax + ", rprStatus=" + rprStatus
				+ ", rprDate=" + rprDate + ", delStatus=" + delStatus + ", rprId=" + rprId + ", contestChallengeId="
				+ contestChallengeId + ", contestNo=" + contestNo + ", count=" + count + "]";
	}


	
	
	
	
}
