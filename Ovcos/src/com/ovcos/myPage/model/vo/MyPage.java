package com.ovcos.myPage.model.vo;

public class MyPage {
	
	private String userId;
	private double distance;
	private String runDate;
	
	public MyPage() {}

	public MyPage(String userId, double distance, String runDate) {
		super();
		this.userId = userId;
		this.distance = distance;
		this.runDate = runDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public String getRunDate() {
		return runDate;
	}

	public void setRunDate(String runDate) {
		this.runDate = runDate;
	}

	@Override
	public String toString() {
		return "MyPage [userId=" + userId + ", distance=" + distance + ", runDate=" + runDate + "]";
	}

}
