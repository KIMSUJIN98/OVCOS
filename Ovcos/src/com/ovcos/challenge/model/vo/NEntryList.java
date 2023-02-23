package com.ovcos.challenge.model.vo;

public class NEntryList {
	private int normalChallNo;
	private String normalEntryId;
	
	public NEntryList() {}

	public NEntryList(int normalChallNo, String normalEntryId) {
		super();
		this.normalChallNo = normalChallNo;
		this.normalEntryId = normalEntryId;
	}

	public int getNormalChallNo() {
		return normalChallNo;
	}

	public void setNormalChallNo(int normalChallNo) {
		this.normalChallNo = normalChallNo;
	}

	public String getNormalEntryId() {
		return normalEntryId;
	}

	public void setNormalEntryId(String normalEntryId) {
		this.normalEntryId = normalEntryId;
	}

	@Override
	public String toString() {
		return "NentryList [normalChallNo=" + normalChallNo + ", normalEntryId=" + normalEntryId + "]";
	}
	
	
	
}
