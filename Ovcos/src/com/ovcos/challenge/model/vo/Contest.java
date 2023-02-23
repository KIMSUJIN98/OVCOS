package com.ovcos.challenge.model.vo;

import java.sql.Date;

public class Contest {
	private int cntsNo;
	private String cntsName;
	private Date cntsDate;
	private String cntsUrl;
	private String delStatuss;
	
	public Contest() {}

	public Contest(int cntsNo, String cntsName, Date cntsDate, String cntsUrl, String delStatuss) {
		super();
		this.cntsNo = cntsNo;
		this.cntsName = cntsName;
		this.cntsDate = cntsDate;
		this.cntsUrl = cntsUrl;
		this.delStatuss = delStatuss;
	}

	
	
	public Contest(String cntsName, Date cntsDate, String cntsUrl) {
		super();
		this.cntsName = cntsName;
		this.cntsDate = cntsDate;
		this.cntsUrl = cntsUrl;
	}

	public int getCntsNo() {
		return cntsNo;
	}

	public void setCntsNo(int cntsNo) {
		this.cntsNo = cntsNo;
	}

	public String getCntsName() {
		return cntsName;
	}

	public void setCntsName(String cntsName) {
		this.cntsName = cntsName;
	}

	public Date getCntsDate() {
		return cntsDate;
	}

	public void setCntsDate(Date cntsDate) {
		this.cntsDate = cntsDate;
	}

	public String getCntsUrl() {
		return cntsUrl;
	}

	public void setCntsUrl(String cntsUrl) {
		this.cntsUrl = cntsUrl;
	}

	public String getDelStatuss() {
		return delStatuss;
	}

	public void setDelStatuss(String delStatuss) {
		this.delStatuss = delStatuss;
	}

	@Override
	public String toString() {
		return "Contest [cntsNo=" + cntsNo + ", cntsName=" + cntsName + ", cntsDate=" + cntsDate + ", cntsUrl="
				+ cntsUrl + ", delStatuss=" + delStatuss + "]";
	}
	
	
	
}
