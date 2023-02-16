package com.ovcos.feed.model.vo;

import java.sql.Date;

public class Feed {

	private int feedIndex;
	private Date feedDate;
	private String feedTitle;
	private String feedCnt;
	private int feedEval;
	private String feedPublicType;
	private String feedPathNy;
	private String feedRprNy;
	private Date feedRprDate;
	private String gpxUrl;
	private int distance;
	private int startLat;
	private int startLon;
	private String feedDelNy;
	private String MemId;
	
	public Feed() {}

	public Feed(int feedIndex, Date feedDate, String feedTitle, String feedCnt, int feedEval, String feedPublicType,
			String feedPathNy, String feedRprNy, Date feedRprDate, String gpxUrl, int distance, int startLat,
			int startLon, String feedDelNy, String memId) {
		this.feedIndex = feedIndex;
		this.feedDate = feedDate;
		this.feedTitle = feedTitle;
		this.feedCnt = feedCnt;
		this.feedEval = feedEval;
		this.feedPublicType = feedPublicType;
		this.feedPathNy = feedPathNy;
		this.feedRprNy = feedRprNy;
		this.feedRprDate = feedRprDate;
		this.gpxUrl = gpxUrl;
		this.distance = distance;
		this.startLat = startLat;
		this.startLon = startLon;
		this.feedDelNy = feedDelNy;
		MemId = memId;
	}

	public int getFeedIndex() {
		return feedIndex;
	}

	public void setFeedIndex(int feedIndex) {
		this.feedIndex = feedIndex;
	}

	public Date getFeedDate() {
		return feedDate;
	}

	public void setFeedDate(Date feedDate) {
		this.feedDate = feedDate;
	}

	public String getFeedTitle() {
		return feedTitle;
	}

	public void setFeedTitle(String feedTitle) {
		this.feedTitle = feedTitle;
	}

	public String getFeedCnt() {
		return feedCnt;
	}

	public void setFeedCnt(String feedCnt) {
		this.feedCnt = feedCnt;
	}

	public int getFeedEval() {
		return feedEval;
	}

	public void setFeedEval(int feedEval) {
		this.feedEval = feedEval;
	}

	public String getFeedPublicType() {
		return feedPublicType;
	}

	public void setFeedPublicType(String feedPublicType) {
		this.feedPublicType = feedPublicType;
	}

	public String getFeedPathNy() {
		return feedPathNy;
	}

	public void setFeedPathNy(String feedPathNy) {
		this.feedPathNy = feedPathNy;
	}

	public String getFeedRprNy() {
		return feedRprNy;
	}

	public void setFeedRprNy(String feedRprNy) {
		this.feedRprNy = feedRprNy;
	}

	public Date getFeedRprDate() {
		return feedRprDate;
	}

	public void setFeedRprDate(Date feedRprDate) {
		this.feedRprDate = feedRprDate;
	}

	public String getGpxUrl() {
		return gpxUrl;
	}

	public void setGpxUrl(String gpxUrl) {
		this.gpxUrl = gpxUrl;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getStartLat() {
		return startLat;
	}

	public void setStartLat(int startLat) {
		this.startLat = startLat;
	}

	public int getStartLon() {
		return startLon;
	}

	public void setStartLon(int startLon) {
		this.startLon = startLon;
	}

	public String getFeedDelNy() {
		return feedDelNy;
	}

	public void setFeedDelNy(String feedDelNy) {
		this.feedDelNy = feedDelNy;
	}

	public String getMemId() {
		return MemId;
	}

	public void setMemId(String memId) {
		MemId = memId;
	}

	@Override
	public String toString() {
		return "Feed [feedIndex=" + feedIndex + ", feedDate=" + feedDate + ", feedTitle=" + feedTitle + ", feedCnt="
				+ feedCnt + ", feedEval=" + feedEval + ", feedPublicType=" + feedPublicType + ", feedPathNy="
				+ feedPathNy + ", feedRprNy=" + feedRprNy + ", feedRprDate=" + feedRprDate + ", gpxUrl=" + gpxUrl
				+ ", distance=" + distance + ", startLat=" + startLat + ", startLon=" + startLon + ", feedDelNy="
				+ feedDelNy + ", MemId=" + MemId + "]";
	}
	
	
	
	
}
