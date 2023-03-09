package com.ovcos.inquiry.model.vo;

public class Inquiry {
	private int inqNo;
	private int inqMenu;
	private String inqTitle;
	private String inqDate;
	private String inqCnt;
	private String ansCnt;
	private String inqDelNy;
	private String memId;
	
	public Inquiry() {}

	public Inquiry(int inqNo, int inqMenu, String inqTitle, String inqDate, String inqCnt, String ansCnt,
			String inqDelNy, String memId) {
		super();
		this.inqNo = inqNo;
		this.inqMenu = inqMenu;
		this.inqTitle = inqTitle;
		this.inqDate = inqDate;
		this.inqCnt = inqCnt;
		this.ansCnt = ansCnt;
		this.inqDelNy = inqDelNy;
		this.memId = memId;
	}

	public Inquiry(int inqNo, int inqMenu, String inqTitle, String inqDate, String inqCnt, String memId) {
		super();
		this.inqNo = inqNo;
		this.inqMenu = inqMenu;
		this.inqTitle = inqTitle;
		this.inqDate = inqDate;
		this.inqCnt = inqCnt;
		this.memId = memId;
	}

	

	public Inquiry(int inqNo, int inqMenu, String inqTitle, String inqDate, String memId) {
		super();
		this.inqNo = inqNo;
		this.inqMenu = inqMenu;
		this.inqTitle = inqTitle;
		this.inqDate = inqDate;
		this.memId = memId;
	}

	public Inquiry(int inqNo, int inqMenu, String inqTitle, String inqDate) {
		super();
		this.inqNo = inqNo;
		this.inqMenu = inqMenu;
		this.inqTitle = inqTitle;
		this.inqDate = inqDate;
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public int getInqMenu() {
		return inqMenu;
	}

	public void setInqMenu(int inqMenu) {
		this.inqMenu = inqMenu;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqDate() {
		return inqDate;
	}

	public void setInqDate(String inqDate) {
		this.inqDate = inqDate;
	}

	public String getInqCnt() {
		return inqCnt;
	}

	public void setInqCnt(String inqCnt) {
		this.inqCnt = inqCnt;
	}

	public String getAnsCnt() {
		return ansCnt;
	}

	public void setAnsCnt(String ansCnt) {
		this.ansCnt = ansCnt;
	}

	public String getInqDelNy() {
		return inqDelNy;
	}

	public void setInqDelNy(String inqDelNy) {
		this.inqDelNy = inqDelNy;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "Inquiry [inqNo=" + inqNo + ", inqMenu=" + inqMenu + ", inqTitle=" + inqTitle + ", inqDate=" + inqDate
				+ ", inqCnt=" + inqCnt + ", ansCnt=" + ansCnt + ", inqDelNy=" + inqDelNy + ", memId=" + memId + "]";
	}
	
	
}
