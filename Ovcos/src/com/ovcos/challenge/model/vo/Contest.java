package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class Contest {
	private int contestNo;
	private String contestName;
	private String contestDate;
	private String contestUrl;
	private String delStatus;
	
	private String changeName;
	
	public Contest() {}

	public Contest(int contestNo, String contestName, String contestDate, String contestUrl, String delStatus, String changeName) {
		super();
		this.contestNo = contestNo;
		this.contestName = contestName;
		this.contestDate = contestDate;
		this.contestUrl = contestUrl;
		this.delStatus = delStatus;
		this.changeName = changeName;
	}

	public Contest(int contestNo, String contestName, String contestDate, String contestUrl, String changeName) {
		super();
		this.contestNo = contestNo;
		this.contestName = contestName;
		this.contestDate = contestDate;
		this.contestUrl = contestUrl;
		this.changeName = changeName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getContestNo() {
		return contestNo;
	}

	public void setContestNo(int contestNo) {
		this.contestNo = contestNo;
	}

	public String getContestName() {
		return contestName;
	}

	public void setContestName(String contestName) {
		this.contestName = contestName;
	}

	public String getContestDate() {
		return contestDate;
	}

	public void setContestDate(String contestDate) {
		this.contestDate = contestDate;
	}

	public String getContestUrl() {
		return contestUrl;
	}

	public void setContestUrl(String contestUrl) {
		this.contestUrl = contestUrl;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	
	@Override
	public String toString() {
		return "Contest [contestNo=" + contestNo + ", contestName=" + contestName + ", contestDate=" + contestDate
				+ ", contestUrl=" + contestUrl + ", delStatus=" + delStatus + ", changeName=" + changeName + "]";
	}
	

	
	
}
