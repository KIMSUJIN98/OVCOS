package com.ovcos.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int ntcNo;
	private String ntcTitle;
	private String ntcCnt;
	private Date ntcDate;
	private String ntcWriter;
	private int ntcCount;
	private String ntcDelNy;
	
	public Notice () {}

	public Notice(int ntcNo, String ntcTitle, String ntcCnt, Date ntcDate, String ntcWriter, int ntcCount,
			String ntcDelNy) {
		super();
		this.ntcNo = ntcNo;
		this.ntcTitle = ntcTitle;
		this.ntcCnt = ntcCnt;
		this.ntcDate = ntcDate;
		this.ntcWriter = ntcWriter;
		this.ntcCount = ntcCount;
		this.ntcDelNy = ntcDelNy;
	}
	
	

	public Notice(int ntcNo, String ntcTitle, Date ntcDate, String ntcWriter, int ntcCount) {
		super();
		this.ntcNo = ntcNo;
		this.ntcTitle = ntcTitle;
		this.ntcDate = ntcDate;
		this.ntcWriter = ntcWriter;
		this.ntcCount = ntcCount;
	}
	
	
	public Notice(int ntcNo, String ntcTitle, String ntcCnt, Date ntcDate, String ntcWriter) {
		super();
		this.ntcNo = ntcNo;
		this.ntcTitle = ntcTitle;
		this.ntcCnt = ntcCnt;
		this.ntcDate = ntcDate;
		this.ntcWriter = ntcWriter;
	}
	
	

	public int getNtcNo() {
		return ntcNo;
	}

	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public String getNtcCnt() {
		return ntcCnt;
	}

	public void setNtcCnt(String ntcCnt) {
		this.ntcCnt = ntcCnt;
	}

	public Date getNtcDate() {
		return ntcDate;
	}

	public void setNtcDate(Date ntcDate) {
		this.ntcDate = ntcDate;
	}

	public String getNtcWriter() {
		return ntcWriter;
	}

	public void setNtcWriter(String ntcWriter) {
		this.ntcWriter = ntcWriter;
	}

	public int getNtcCount() {
		return ntcCount;
	}

	public void setNtcCount(int ntcCount) {
		this.ntcCount = ntcCount;
	}

	public String getNtcDelNy() {
		return ntcDelNy;
	}

	public void setNtcDelNy(String ntcDelNy) {
		this.ntcDelNy = ntcDelNy;
	}

	@Override
	public String toString() {
		return "Notice [ntcNo=" + ntcNo + ", ntcTitle=" + ntcTitle + ", ntcCnt=" + ntcCnt + ", ntcDate=" + ntcDate
				+ ", ntcWriter=" + ntcWriter + ", ntcCount=" + ntcCount + ", ntcDelNy=" + ntcDelNy + "]";
	}
	
	
	
}
