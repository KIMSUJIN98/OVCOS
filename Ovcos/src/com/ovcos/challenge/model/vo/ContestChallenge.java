package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class ContestChallenge {
	private int contestChallengeNo;
	private String contestChallengeTitle;
	private String contestChallengeContent;
	private String enrollDate;
	private String contestChallengeDate;
	private int contestChallengeMax;
	private String rprStatus;
	private Date rprDate;
	private String delStatus;
	private String rprId;
	private String contestChallengeId;
	private String contestNo;
	
	private String changeName;
	
	private int count;
	
	public ContestChallenge() {}

	
	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, String contestChallengeContent,
			String enrollDate, String contestChallengeDate, int contestChallengeMax, String rprStatus, Date rprDate,
			String delStatus, String rprId, String contestChallengeId, String contestNo, int count) {
		super();
		this.contestChallengeNo = contestChallengeNo;
		this.contestChallengeTitle = contestChallengeTitle;
		this.contestChallengeContent = contestChallengeContent;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.rprStatus = rprStatus;
		this.rprDate = rprDate;
		this.delStatus = delStatus;
		this.rprId = rprId;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
		this.count = count;
	}


	public ContestChallenge(String contestChallengeTitle, String enrollDate, String contestChallengeDate,
			int contestChallengeMax, String contestChallengeId, String contestNo) {
		super();
		this.contestChallengeTitle = contestChallengeTitle;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
	}
	
	

	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, String contestChallengeContent,
			String enrollDate, String contestChallengeDate, int contestChallengeMax, String contestChallengeId,
			String contestNo, String changeName) {
		super();
		this.contestChallengeNo = contestChallengeNo;
		this.contestChallengeTitle = contestChallengeTitle;
		this.contestChallengeContent = contestChallengeContent;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
		this.changeName = changeName;
	}


	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, String enrollDate,
			String contestChallengeDate, int contestChallengeMax, String contestChallengeId, String contestNo,
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

	public ContestChallenge(int contestChallengeNo, String contestChallengeTitle, String contestChallengeContent,
			String enrollDate, String contestChallengeDate, int contestChallengeMax, String contestChallengeId,
			String contestNo, String changeName, int count) {
		super();
		this.contestChallengeNo = contestChallengeNo;
		this.contestChallengeTitle = contestChallengeTitle;
		this.contestChallengeContent = contestChallengeContent;
		this.enrollDate = enrollDate;
		this.contestChallengeDate = contestChallengeDate;
		this.contestChallengeMax = contestChallengeMax;
		this.contestChallengeId = contestChallengeId;
		this.contestNo = contestNo;
		this.changeName = changeName;
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

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getContestChallengeDate() {
		return contestChallengeDate;
	}

	public void setContestChallengeDate(String contestChallengeDate) {
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
	
	
	
	
	public String getContestChallengeContent() {
		return contestChallengeContent;
	}


	public void setContestChallengeContent(String contestChallengeContent) {
		this.contestChallengeContent = contestChallengeContent;
	}


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	@Override
	public String toString() {
		return "ContestChallenge [contestChallengeNo=" + contestChallengeNo + ", contestChallengeTitle="
				+ contestChallengeTitle + ", contestChallengeContent=" + contestChallengeContent + ", enrollDate="
				+ enrollDate + ", contestChallengeDate=" + contestChallengeDate + ", contestChallengeMax="
				+ contestChallengeMax + ", rprStatus=" + rprStatus + ", rprDate=" + rprDate + ", delStatus=" + delStatus
				+ ", rprId=" + rprId + ", contestChallengeId=" + contestChallengeId + ", contestNo=" + contestNo
				+ ", count=" + count + "]";
	}

	


	
	
	
	
}
