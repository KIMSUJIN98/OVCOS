package com.ovcos.bookmark.model.vo;

public class BookMark {

	 private int bkNo;
	 private String bkId;
	 private String bkDate;
	 private String bkFolloeeNy;
	
	 
	 public BookMark() {}
	 


	public BookMark(int bkNo, String bkId, String bkDate, String bkFolloeeNy) {
		super();
		this.bkNo = bkNo;
		this.bkId = bkId;
		this.bkDate = bkDate;
		this.bkFolloeeNy = bkFolloeeNy;
	}




	public BookMark(int bkNo) {
		super();
		this.bkNo = bkNo;
	}




	public int getBkNo() {
		return bkNo;
	}




	public void setBkNo(int bkNo) {
		this.bkNo = bkNo;
	}




	public String getBkId() {
		return bkId;
	}




	public void setBkId(String bkId) {
		this.bkId = bkId;
	}




	public String getBkDate() {
		return bkDate;
	}




	public void setBkDate(String bkDate) {
		this.bkDate = bkDate;
	}




	public String getBkFolloeeNy() {
		return bkFolloeeNy;
	}




	public void setBkFolloeeNy(String bkFolloeeNy) {
		this.bkFolloeeNy = bkFolloeeNy;
	}




	@Override
	public String toString() {
		return "BookMark [bkNo=" + bkNo + ", bkId=" + bkId + ", bkDate=" + bkDate + ", bkFolloeeNy=" + bkFolloeeNy
				+ "]";
	}
	 
}
