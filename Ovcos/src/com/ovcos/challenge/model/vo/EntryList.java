package com.ovcos.challenge.model.vo;

public class EntryList {
	private int contestChallNo;
	private String contestEntryId;
	
	public EntryList() {}

	public EntryList(int contestChallNo, String contestEntryId) {
		super();
		this.contestChallNo = contestChallNo;
		this.contestEntryId = contestEntryId;
	}

	public int getContestChallNo() {
		return contestChallNo;
	}

	public void setContestChallNo(int contestChallNo) {
		this.contestChallNo = contestChallNo;
	}

	public String getContestEntryId() {
		return contestEntryId;
	}

	public void setContestEntryId(String contestEntryId) {
		this.contestEntryId = contestEntryId;
	}

	@Override
	public String toString() {
		return "EntryList [contestChallNo=" + contestChallNo + ", contestEntryId=" + contestEntryId + "]";
	}

	
}