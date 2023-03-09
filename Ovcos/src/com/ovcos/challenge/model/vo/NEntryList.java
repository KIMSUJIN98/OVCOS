package com.ovcos.challenge.model.vo;

public class NEntryList {
	private int normalChallNo;
	private String normalEntryId;
	private String memNick;
	
	public NEntryList() {}

	public NEntryList(int normalChallNo, String normalEntryId, String memNick) {
		super();
		this.normalChallNo = normalChallNo;
		this.normalEntryId = normalEntryId;
		this.memNick = memNick;
	}
	

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
	

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	@Override
	public String toString() {
		return "NEntryList [normalChallNo=" + normalChallNo + ", normalEntryId=" + normalEntryId + ", memNick="
				+ memNick + "]";
	}


	
	
}
