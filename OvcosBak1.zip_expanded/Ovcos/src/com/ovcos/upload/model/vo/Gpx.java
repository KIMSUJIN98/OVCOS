package com.ovcos.upload.model.vo;

import java.sql.Date;

public class Gpx {
	
	private int gpxNo;
	private int feedIndex;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	
	public Gpx() {}

	public Gpx(int gpxNo, int feedIndex, String originName, String changeName, String filePath, Date uploadDate,
			String status) {
		super();
		this.gpxNo = gpxNo;
		this.feedIndex = feedIndex;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getGpxNo() {
		return gpxNo;
	}

	public void setGpxNo(int gpxNo) {
		this.gpxNo = gpxNo;
	}

	public int getFeedIndex() {
		return feedIndex;
	}

	public void setFeedIndex(int feedIndex) {
		this.feedIndex = feedIndex;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Gpx [gpxNo=" + gpxNo + ", feedIndex=" + feedIndex + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	
}
