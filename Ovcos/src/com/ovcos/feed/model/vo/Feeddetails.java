package com.ovcos.feed.model.vo;

public class Feeddetails {

	private int feedIndex;
	private String feedDate;
	private String feedTitle;
	private String feedCnt;
	private int feedEval;
	private double distance;
	private double startLat; 
	private double startLon;
	private String MemId;
	private String changeName;
	private String originName;
	private int hit;
	private int wishCount;
	
	public Feeddetails(){}
	

	public Feeddetails(int feedIndex, String feedDate, String feedTitle, String feedCnt, int feedEval, double distance,
			double startLat, double startLon, String memId, String changeName, int hit) {
		super();
		this.feedIndex = feedIndex;
		this.feedDate = feedDate;
		this.feedTitle = feedTitle;
		this.feedCnt = feedCnt;
		this.feedEval = feedEval;
		this.distance = distance;
		this.startLat = startLat;
		this.startLon = startLon;
		MemId = memId;
		this.changeName = changeName;
		this.hit = hit;
	}
	
	

	public Feeddetails(int feedIndex, String feedDate, String feedTitle, String feedCnt, int feedEval, double distance,
			double startLat, double startLon, String memId, String changeName, String originName, int hit,
			int wishCount) {
		super();
		this.feedIndex = feedIndex;
		this.feedDate = feedDate;
		this.feedTitle = feedTitle;
		this.feedCnt = feedCnt;
		this.feedEval = feedEval;
		this.distance = distance;
		this.startLat = startLat;
		this.startLon = startLon;
		MemId = memId;
		this.changeName = changeName;
		this.originName = originName;
		this.hit = hit;
		this.wishCount = wishCount;
	}


	
	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public int getWishCount() {
		return wishCount;
	}


	public void setWishCount(int wishCount) {
		this.wishCount = wishCount;
	}


	public int getFeedIndex() {
		return feedIndex;
	}

	public void setFeedIndex(int feedIndex) {
		this.feedIndex = feedIndex;
	}

	public String getFeedDate() {
		return feedDate;
	}

	public void setFeedDate(String feedDate) {
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

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getStartLat() {
		return startLat;
	}

	public void setStartLat(double startLat) {
		this.startLat = startLat;
	}

	public double getStartLon() {
		return startLon;
	}

	public void setStartLon(double startLon) {
		this.startLon = startLon;
	}

	public String getMemId() {
		return MemId;
	}

	public void setMemId(String memId) {
		MemId = memId;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "Feeddetails [feedIndex=" + feedIndex + ", feedDate=" + feedDate + ", feedTitle=" + feedTitle
				+ ", feedCnt=" + feedCnt + ", feedEval=" + feedEval + ", distance=" + distance + ", startLat="
				+ startLat + ", startLon=" + startLon + ", MemId=" + MemId + ", changeName=" + changeName + ", hit="
				+ hit + "]";
	}

	
	
}
